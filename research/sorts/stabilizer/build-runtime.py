#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Build `sorts` with Lean's runtime and Init compiled from source, natively and under Stabilizer.

    build-runtime.py --lean-src DIR --mimalloc-src DIR --sorts-src DIR --stabilizer-src DIR --out DIR [--exe NAME]

Runs inside localhost/sorts-stabilizer-runtime (Containerfile.runtime).  DIR arguments:

  --lean-src        Lean's source at the tag matching the image's toolchain (v4.34.1)
  --mimalloc-src    mimalloc at the tag Lean's CMake fetches (v3.4.4)
  --sorts-src       the sorts Lake project (or another Lake project whose executable --exe names,
                    default sorts; the outputs are then named after it)
  --stabilizer-src  a Stabilizer checkout, built here as a release build
  --toolchain       optionally, a Lean release directory to generate the C with, for a source
                    tree that the image's toolchain cannot compile
  --out             a new directory

Steps: configure Lean's CMake with the image's clang (for the runtime's exact compile flags and
generated headers); build Init's C with the toolchain's Lake from the Lean source; build sorts with
Lake (its C, and `lake/sorts` as the reference binary); compile the runtime's C++ (the static
`leanrt` flavour, local-exec TLS, with mimalloc), Init's C and sorts' C to LLVM bitcode, each with
its own build's flags; link the bitcode into one module and keep only what `main` reaches
(internalize, globaldce).  From that module:

  native/sorts  llc -O3, linked against libuv, GMP and OpenSSL
  stab/sorts    the same after Stabilizer's code randomisation (the passes `szc -Rcode` runs),
                linked with --emit-relocs and libstabilizer

So the two binaries run the same code apart from the instrumentation, and nothing of Lean is
left in a shared library.  Every command and its output go to OUT/build.log; OUT/manifest.txt
has the hashes.
"""

import argparse
import concurrent.futures
import hashlib
import json
import os
import shlex
import shutil
import subprocess
import sys
from pathlib import Path

STABILIZE = "lower-intrinsics,lower-switch,lower-invoke,stabilize"
LEANC_FLAGS = ["-O3", "-DNDEBUG", "-DLEAN_EXPORTING", "-fstack-clash-protection",
               "-ffp-contract=off", "-fPIC", "-fvisibility=hidden"]
NATIVE_LIBS = ["-luv", "-lgmp", "-lssl", "-lcrypto", "-lpthread", "-ldl", "-lrt", "-lm"]


class Builder:
    def __init__(self, out: Path):
        self.out = out
        self.log = open(out / "build.log", "a")

    def run(self, cmd: list, cwd: Path | None = None, quiet: bool = False) -> str:
        cmd = [str(c) for c in cmd]
        proc = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)
        self.log.write(f"+ {shlex.join(cmd)}" + (f"  (in {cwd})" if cwd else "") + "\n")
        if not quiet or proc.returncode:
            self.log.write(proc.stdout + proc.stderr)
        self.log.flush()
        if proc.returncode:
            sys.exit(f"FAILED: {shlex.join(cmd)}\n{(proc.stdout + proc.stderr)[-3000:]}")
        return proc.stdout

    def parallel(self, cmds: list[list], jobs: int) -> None:
        with concurrent.futures.ThreadPoolExecutor(jobs) as pool:
            for f in [pool.submit(self.run, c, None, True) for c in cmds]:
                f.result()


def runtime_commands(compile_commands: Path, bc_dir: Path) -> list[list[str]]:
    """The static runtime's entries (leanrt, local-exec TLS, and its mimalloc) of Lean's
    compile_commands.json, emitting bitcode."""
    cmds = []
    for entry in json.loads(compile_commands.read_text()):
        argv = shlex.split(entry["command"])
        out = argv[argv.index("-o") + 1]
        # Later Lean versions build mimalloc (with the runtime's allocation entry point) as
        # separate object-library variants; the static runtime links the local-exec one.
        if not out.startswith(("CMakeFiles/leanrt.dir/", "CMakeFiles/mimalloc_local-exec.dir/")):
            continue
        i = argv.index("-o")
        del argv[i:i + 2]
        argv = [a for a in argv if a not in ("-Wall", "-Wextra")]
        name = Path(entry["file"]).name
        cmds.append(argv + ["-emit-llvm", "-o", str(bc_dir / f"rt-{name}.bc")])
    return cmds


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    for a in ("lean-src", "mimalloc-src", "sorts-src", "stabilizer-src", "out"):
        p.add_argument(f"--{a}", required=True, type=Path)
    p.add_argument("--exe", default="sorts")
    p.add_argument("--source-date-epoch",
                   help="for a Lean source tree that is not a Git checkout: its commit's date")
    p.add_argument("--lean-commit", help="for the log, when the Lean source is not a Git checkout")
    p.add_argument("--toolchain", type=Path,
                   help="a Lean release directory whose lean and lake generate Init's and the "
                        "program's C (default: the image's elan toolchain)")
    p.add_argument("--jobs", type=int, default=min(16, len(os.sched_getaffinity(0))))
    a = p.parse_args()
    out = a.out.resolve()
    out.mkdir()
    b = Builder(out)
    # The runtime embeds __DATE__ and __TIME__; pin them to the Lean commit's date.
    os.environ["SOURCE_DATE_EPOCH"] = a.source_date_epoch or subprocess.run(
        ["git", "-C", str(a.lean_src), "log", "-1", "--format=%ct"], capture_output=True, text=True,
        check=True).stdout.strip()
    if a.toolchain:
        # Only lean and lake come from the release; its bundled clang (which needs its own
        # sysroot) must not replace the image's clang 21.
        tool_bin = out / "toolchain-bin"
        tool_bin.mkdir()
        for tool in ("lean", "lake"):
            (tool_bin / tool).symlink_to(a.toolchain.resolve() / "bin" / tool)
        os.environ["PATH"] = f"{tool_bin}:{os.environ['PATH']}"
    toolchain = Path(b.run(["lean", "--print-prefix"]).strip())
    b.log.write(f"lean: {b.run(['lean', '--version'])}clang: {b.run(['clang', '--version']).splitlines()[0]}\n")
    if a.lean_commit:
        b.log.write(f"lean source commit (stated): {a.lean_commit}\n")
    for src in (a.lean_src, a.mimalloc_src, a.stabilizer_src):
        rev = subprocess.run(["git", "-C", str(src), "rev-parse", "HEAD"], capture_output=True, text=True).stdout.strip()
        b.log.write(f"source {src}: {rev or 'not a git checkout'}\n")

    # Stabilizer, release build.
    stab = out / "stabilizer"
    shutil.copytree(a.stabilizer_src, stab, symlinks=True)
    for dep in ("Heap-Layers", "DieHard"):
        if not (stab / dep).exists():
            shutil.copytree(Path("/opt/stabilizer") / dep, stab / dep, symlinks=True)
    b.run(["make", "-C", stab, "clean"])
    b.run(["env", "CPLUS_INCLUDE_PATH=/usr/lib/llvm-21/include", "make", "-C", stab, "release"])

    # Lean's CMake configuration (flags, generated headers, lakefile) and Init's C.
    lean = out / "lean"
    shutil.copytree(a.mimalloc_src, lean / "mimalloc" / "src" / "mimalloc", symlinks=True)
    stage1 = lean / "stage1"
    b.run(["cmake", "-S", a.lean_src.resolve() / "src", "-B", stage1, "-DCMAKE_BUILD_TYPE=Release",
           "-DCMAKE_C_COMPILER=clang", "-DCMAKE_CXX_COMPILER=clang++", "-DSTAGE=1",
           "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON"])
    include = stage1 / "include"
    # Later Lean versions copy the source headers into the build tree in a build step rather than
    # at configure time; copy what is missing, keeping the generated ones.
    for h in sorted((a.lean_src.resolve() / "src/include/lean").glob("*.h")):
        if not (include / "lean" / h.name).exists():
            shutil.copy2(h, include / "lean" / h.name)
            b.log.write(f"copied {h} into the build's include directory\n")
    b.run(["env", f"LEAN_NUM_THREADS={a.jobs}", "lake", "build", "Init"], cwd=stage1)
    init_c = sorted((stage1 / "lib" / "temp").rglob("*.c"))

    # sorts: Lake's binary and C.
    sorts = out / "sorts-src"
    shutil.copytree(a.sorts_src, sorts, ignore=shutil.ignore_patterns(".lake"))
    b.run(["env", f"LEAN_NUM_THREADS={a.jobs}", "lake", "build", a.exe], cwd=sorts)
    (out / "lake").mkdir()
    shutil.copy2(sorts / f".lake/build/bin/{a.exe}", out / f"lake/{a.exe}")
    rsp = (sorts / f".lake/build/bin/{a.exe}.rsp").read_text().split()
    sorts_c = [Path(x.strip('"').removesuffix(".o.export")) for x in rsp if x.strip('"').endswith(".c.o.export")]

    # Bitcode.
    bc = out / "bc"
    bc.mkdir()
    cmds = runtime_commands(stage1 / "compile_commands.json", bc)
    for i, c in enumerate(init_c):
        cmds.append(["clang", *LEANC_FLAGS, "-I", include, "-c", "-emit-llvm", c, "-o", bc / f"init-{i:04}.bc"])
    for i, c in enumerate(sorts_c):
        cmds.append(["clang", *LEANC_FLAGS, "-I", include, "-c", "-emit-llvm", c, "-o", bc / f"sorts-{i}.bc"])
    b.log.write(f"bitcode: {len(cmds)} translation units ({len(init_c)} Init, {len(sorts_c)} sorts)\n")
    b.parallel(cmds, a.jobs)

    # One module, reduced to what main reaches.
    b.run(["llvm-link", "-o", out / "all.bc", *sorted(bc.glob("*.bc"))])
    b.run(["opt", "-passes=internalize,globaldce", "-internalize-public-api-list=main",
           out / "all.bc", "-o", out / "linked.bc"])

    llc = ["llc", "-O3", "-relocation-model=pic", "--frame-pointer=all", "-filetype=obj"]
    (out / "native").mkdir()
    b.run([*llc, out / "linked.bc", "-o", out / "native.o"])
    b.run(["clang++", out / "native.o", "-o", out / f"native/{a.exe}", *NATIVE_LIBS])

    (out / "stab").mkdir()
    b.run(["opt", "-o", out / "stab.bc", out / "linked.bc", f"--load-pass-plugin={stab / 'LLVMStabilizer.so'}",
           f"-passes={STABILIZE}", "-stabilize-code=true"])
    b.run([*llc, out / "stab.bc", "-o", out / "stab.o"])
    b.run(["clang++", out / "stab.o", "-Wl,--emit-relocs", "-o", out / f"stab/{a.exe}", "-L", stab,
           "-lstabilizer", *NATIVE_LIBS])
    b.run(["sh", stab / "tests/Harness/check-instrumentation.sh", out / f"stab/{a.exe}"])

    lines = []
    for f in [f"lake/{a.exe}", f"native/{a.exe}", f"stab/{a.exe}", "stabilizer/libstabilizer.so",
              "stabilizer/LLVMStabilizer.so", "linked.bc"]:
        lines.append(f"{hashlib.sha256((out / f).read_bytes()).hexdigest()}  {f}")
    (out / "manifest.txt").write_text("\n".join(lines) + "\n")
    print(f"built: {out}/{{lake,native,stab}}/{a.exe}")


if __name__ == "__main__":
    main()
