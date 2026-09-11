"""Matched compiler-on/off comparisons in independently shuffled complete blocks."""
import argparse
import datetime
import hashlib
import json
import os
from pathlib import Path
import random
import statistics
import subprocess
import time

ROOT = Path(__file__).resolve().parent
BUILD = ROOT / "build"
TC = Path.home() / ".elan/toolchains/leanprover--lean4---v4.33.1/bin"
MASK = (1 << 64) - 1
SEEDS = (0, 1, 2611923443488327891, MASK)
SCALAR = ["id-while", "io-while", "for-nat", "for-usize", "tail-scalar",
          "tail-pair", "tail-pair-return", "while-struct", "tail-struct", "tail-fuel"]
BYTE = ["nat-while", "usize-while", "usize-for", "state-while"]


def oracle(kind, n, rounds, seed):
    x = seed
    if kind == "scalar":
        for i in range(n):
            x = ((x ^ ((i + 0x9e3779b97f4a7c15) & MASK)) * 0xbf58476d1ce4e5b9) & MASK
            x ^= x >> 29
            x = (x * 0x94d049bb133111eb) & MASK
            x ^= x >> 31
    else:
        buf = bytes((i * 31 + 7) % 256 for i in range(n))
        for _ in range(rounds):
            for b in buf:
                x = ((x + b + 0x9e3779b9) * 0x100000001b3) & MASK
            x ^= x >> 33
    return x


def schedule(variants, blocks, seed):
    if blocks < 1:
        raise ValueError("positive block count required")
    rng = random.Random(seed)
    treatments = [(v, m) for v in variants for m in ("baseline", "split")]
    result = []
    for _ in range(blocks):
        block = treatments.copy()
        rng.shuffle(block)
        result.append(block)
    return result


def invoke(command, log, **context):
    row = {"command": list(map(str, command)), **context}
    start = time.perf_counter_ns()
    try:
        p = subprocess.Popen(row["command"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        row["pid"] = p.pid
        try:
            stdout, stderr = p.communicate(timeout=60)
        except subprocess.TimeoutExpired:
            p.kill()
            stdout, stderr = p.communicate()
            row["timed_out"] = True
        row.update(stdout=stdout, stderr=stderr, status=p.returncode)
    except OSError as exc:
        row.update(status=None, launch_error=str(exc))
    row["process_wall_ns"] = time.perf_counter_ns() - start
    log.write(json.dumps(row) + "\n")
    log.flush()
    if row["status"] != 0 or row.get("timed_out"):
        raise RuntimeError(row)
    return row


def timed(kind, variant, mode, n, rounds, seed, expected, log, **context):
    binary = BUILD / (mode + ("-byte" if kind == "byte" else ""))
    args = [variant, str(n)] + ([str(rounds)] if kind == "byte" else []) + [str(seed)]
    row = invoke([binary, *args], log, kind=kind, variant=variant, mode=mode,
                 n=n, rounds=rounds, seed=seed, **context)
    fields = row["stdout"].split()
    if len(fields) != 3:
        raise RuntimeError(f"malformed result: {row}")
    row.update(zip(("elapsed_ns", "checksum", "warmup_checksum"), map(int, fields)))
    if (row["checksum"], row["warmup_checksum"]) != expected or row["elapsed_ns"] < 0:
        raise RuntimeError(f"checksum/time mismatch: {row}")
    return row


def expected_checksums(kind, n, rounds, seed):
    return (oracle(kind, n, rounds, seed),
            oracle(kind, n // 2 if kind == "scalar" else n,
                   rounds // 2 if kind == "byte" else rounds, seed))


def summarise(rows, variants, seed):
    rng = random.Random(seed)
    result = {}
    for variant in variants:
        times = {mode: {r["block"]: r["elapsed_ns"] for r in rows
                        if r["variant"] == variant and r["mode"] == mode}
                 for mode in ("baseline", "split")}
        ratios = [times["split"][b] / times["baseline"][b] for b in sorted(times["baseline"])]
        boot = sorted(statistics.median(rng.choices(ratios, k=len(ratios))) for _ in range(20000))
        result[variant] = {"median_ms": {mode: statistics.median(t.values()) / 1e6
                                        for mode, t in times.items()},
                           "ratios": ratios, "median_ratio": statistics.median(ratios),
                           "descriptive_95pct": [boot[500], boot[19499]]}
    return result


def capture(command):
    p = subprocess.run(list(map(str, command)), capture_output=True, text=True)
    return {"command": list(map(str, command)), "status": p.returncode,
            "stdout": p.stdout, "stderr": p.stderr}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--kind", choices=("scalar", "byte"), default="scalar")
    parser.add_argument("--n", type=int, default=5_000_000)
    parser.add_argument("--rounds", type=int, default=16)
    parser.add_argument("--blocks", type=int, default=30)
    parser.add_argument("--rng-seed", type=int, default=20260916)
    parser.add_argument("--value-seed", type=int, default=2611923443488327891)
    parser.add_argument("--controls-only", action="store_true")
    args = parser.parse_args()
    if args.blocks < 1 or not 0 <= args.n <= 100_000_000 or not 0 <= args.rounds <= 100:
        parser.error("invalid blocks, n or rounds")
    if not 0 <= args.value_seed <= MASK:
        parser.error("seed must fit UInt64")
    hashes = json.loads((BUILD / "hashes.json").read_text())
    for rel, digest in hashes.items():
        if hashlib.sha256((ROOT / rel).read_bytes()).hexdigest() != digest:
            raise RuntimeError(f"build input/output changed: {rel}; rebuild first")
    out = ROOT / "results" / datetime.datetime.now(datetime.timezone.utc).strftime("%Y%m%dT%H%M%S.%fZ")
    out.mkdir(parents=True)
    print(out, flush=True)
    variants = SCALAR if args.kind == "scalar" else BYTE
    order = schedule(variants, args.blocks, args.rng_seed)
    (out / "schedule.json").write_text(json.dumps(order, indent=2) + "\n")
    allowed = sorted(os.sched_getaffinity(0))
    cpu = allowed[-1]
    os.sched_setaffinity(0, {cpu})
    meta = {"args": vars(args), "cpu": cpu, "initial_affinity": allowed,
            "schedule_scheme": "independent-complete-blocks", "build_hashes": hashes,
            "nice": os.getpriority(os.PRIO_PROCESS, 0), "scheduler": os.sched_getscheduler(0),
            "ionice": capture(["ionice", "--pid", str(os.getpid())]),
            "lscpu": capture(["lscpu"]), "uname": capture(["uname", "--all"]),
            "versions": [capture([TC / name, "--version"]) for name in ("lean", "clang")],
            "runtime_env": {k: v for k, v in os.environ.items() if k in
                            ("LEAN_NUM_THREADS", "LEAN_STACK_SIZE", "LEAN_HEARTBEATS",
                             "MIMALLOC_VERBOSE", "MIMALLOC_SHOW_STATS", "MIMALLOC_PURGE_DELAY")},
            "load_before": os.getloadavg(), "block_loads": [], "snapshot_hashes": {}}
    for rel in ("cpufreq/scaling_governor", "cpufreq/scaling_driver", "topology/core_id",
                "topology/thread_siblings_list", "topology/physical_package_id"):
        p = Path(f"/sys/devices/system/cpu/cpu{cpu}") / rel
        meta[rel] = p.read_text().strip() if p.exists() else "unavailable"
    suffix = "-byte" if args.kind == "byte" else ""
    snapshots = [ROOT / name for name in ("SplitProd.lean", "Semantics.lean", "ByteWork.lean",
                                          "build.py", "measure.py", "DESIGN.md")]
    snapshots += [BUILD / name for name in ("Kernels.lean", "commands.json", "hashes.json")]
    snapshots += [BUILD / (mode + suffix + ext) for mode in ("baseline", "split")
                  for ext in (".c", ".s", "-mono.txt")]
    for p in snapshots:
        data = p.read_bytes()
        (out / p.name).write_bytes(data)
        meta["snapshot_hashes"][p.name] = hashlib.sha256(data).hexdigest()
    metadata_path = out / "metadata.json"
    metadata_path.write_text(json.dumps(meta, indent=2) + "\n")
    with (out / "invocations.jsonl").open("w") as raw:
        # Semantic output and IO effects must agree, not merely their checksums.
        for n in (0, 1, 2, 3, 6, 7, 8, 17, 50):
            for seed in SEEDS:
                results = [invoke([BUILD / (mode + "-semantics"), str(n), str(seed)], raw,
                                  phase="semantics", n=n, seed=seed, mode=mode)
                           for mode in ("baseline", "split")]
                if results[0]["stdout"] != results[1]["stdout"]:
                    raise RuntimeError(f"semantic mismatch: {results}")
        grid = [(n, 0) for n in (0, 1, 2, 17, 1000)] if args.kind == "scalar" else [
            (n, r) for n in (0, 1, 17, 256) for r in (0, 1, 2, 3)]
        for n, rounds in grid:
            for seed in SEEDS:
                expected = expected_checksums(args.kind, n, rounds, seed)
                for variant in variants:
                    for mode in ("baseline", "split"):
                        timed(args.kind, variant, mode, n, rounds, seed, expected, raw, phase="control")
        expected = expected_checksums(args.kind, args.n, args.rounds, args.value_seed)
        meta["expected_checksums"] = expected
        metadata_path.write_text(json.dumps(meta, indent=2) + "\n")
        if args.controls_only:
            print("Controls passed", flush=True)
            return
        rows = []
        with (out / "observations.jsonl").open("w") as observations:
            for block, treatments in enumerate(order):
                meta["block_loads"].append({"block": block, "before": os.getloadavg()})
                for position, (variant, mode) in enumerate(treatments):
                    row = timed(args.kind, variant, mode, args.n, args.rounds, args.value_seed,
                                expected, raw, phase="measurement", block=block, position=position)
                    observations.write(json.dumps(row) + "\n")
                    observations.flush()
                    if row["elapsed_ns"] <= 0:
                        raise RuntimeError(f"non-positive timing: {row}")
                    rows.append(row)
                meta["block_loads"][-1]["after"] = os.getloadavg()
                metadata_path.write_text(json.dumps(meta, indent=2) + "\n")
                print(f"block {block + 1}/{args.blocks}", flush=True)
    summary = summarise(rows, variants, args.rng_seed + 100)
    (out / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
