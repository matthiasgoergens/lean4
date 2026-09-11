"""Build the same kernel source with the experimental pass disabled and enabled."""
import hashlib
import json
import os
from pathlib import Path
import resource
import subprocess
import time

ROOT = Path(__file__).resolve().parent
resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
TC = Path.home() / ".elan/toolchains/leanprover--lean4---v4.33.1/bin"
OUT = ROOT / "build"
OUT.mkdir(exist_ok=True)
env = os.environ.copy()
env["LEAN_PATH"] = str(ROOT)
records = []


def run(command, output=None):
    start = time.perf_counter_ns()
    try:
        p = subprocess.run(list(map(str, command)), cwd=ROOT, env=env,
                           capture_output=True, text=True, timeout=90)
    except subprocess.TimeoutExpired as exc:
        records.append({"command": list(map(str, command)), "status": None, "timed_out": True,
                        "wall_ns": time.perf_counter_ns() - start,
                        "stdout": str(exc.stdout or ""), "stderr": str(exc.stderr or "")})
        (OUT / "commands.json").write_text(json.dumps(records, indent=2) + "\n")
        raise
    records.append({"command": list(map(str, command)), "status": p.returncode,
                    "wall_ns": time.perf_counter_ns() - start,
                    "stdout": p.stdout, "stderr": p.stderr})
    (OUT / "commands.json").write_text(json.dumps(records, indent=2) + "\n")
    if output is not None:
        output.write_text(p.stdout + p.stderr)
    if p.returncode or "PANIC" in p.stdout + p.stderr or "uncaught exception" in p.stdout + p.stderr:
        raise RuntimeError(records[-1])


source = (ROOT.parent / "loop-study/Variants.lean").read_text()
(OUT / "Kernels.lean").write_text(source.replace("import Std", "import Std\nimport SplitProd", 1))
run([TC / "lean", f"--o={ROOT / 'SplitProd.olean'}", f"--c={OUT / 'SplitProd.c'}",
     ROOT / "SplitProd.lean"])
run([TC / "leanc", "-O3", "-DNDEBUG", "-c", OUT / "SplitProd.c", "-o", OUT / "SplitProd.o"])
targets = [("", OUT / "Kernels.lean"), ("-semantics", ROOT / "Semantics.lean"),
           ("-byte", ROOT / "ByteWork.lean")]
for suffix, source_path in targets:
    for mode in ("baseline", "split"):
        name = mode + suffix
        run([TC / "lean", f"-Dcompiler.splitProd={'true' if mode == 'split' else 'false'}",
             "-Dcompiler.check=true", "-Dtrace.Compiler.saveMono=true",
             f"--c={OUT / (name + '.c')}", source_path], OUT / (name + "-mono.txt"))
        run([TC / "leanc", "-O3", "-DNDEBUG", "-o", OUT / name, OUT / (name + ".c"), OUT / "SplitProd.o"])
        run([TC / "leanc", "-O3", "-DNDEBUG", "-S", "-o", OUT / (name + ".s"), OUT / (name + ".c")])
hashes = {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
          for p in [ROOT / "SplitProd.lean", ROOT / "build.py", ROOT / "Semantics.lean",
                    ROOT / "ByteWork.lean", OUT / "Kernels.lean"] +
                   [OUT / (mode + suffix) for suffix, _ in targets for mode in ("baseline", "split")]}
(OUT / "hashes.json").write_text(json.dumps(hashes, indent=2) + "\n")
print("Built baseline and split executables", flush=True)
