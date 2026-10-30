#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Randomised complete blocks over the cells of a plan (see PLAN.md).

    run.py CELLS.json OUT_DIR BLOCKS

CELLS.json is a list of {"workload", "impl", "argv", "cpus"}: argv[0] is a program path relative to
the bench directory or an absolute path, "cpus" the logical CPUs the run is pinned to.  Every block
runs every cell once, in a fresh random order; each run is one child process, timed by wait4.  Writes
OUT_DIR/runs.tsv (one row per run, appended as it goes) and OUT_DIR/fingerprints.tsv (SHA-256 of
every program and script), and refuses an existing OUT_DIR.
"""

import hashlib
import json
import os
import random
import subprocess
import sys
import time
from pathlib import Path

BENCH = Path(__file__).resolve().parent


def resolve(argv: list[str]) -> list[str]:
    return [str(BENCH / a) if not os.path.isabs(a) and (BENCH / a).exists() else a for a in argv]


def sha256(path: str) -> str:
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def run_once(argv: list[str], cpus: list[int]) -> tuple[float, float, float, int, str, int]:
    start = time.perf_counter()
    proc = subprocess.Popen(argv, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL,
                            preexec_fn=lambda: os.sched_setaffinity(0, cpus))
    out = proc.stdout.read().decode().strip()
    _, status, usage = os.wait4(proc.pid, 0)
    wall = time.perf_counter() - start
    proc.returncode = os.waitstatus_to_exitcode(status)
    return usage.ru_utime, usage.ru_stime, wall, usage.ru_maxrss, out, proc.returncode


def main(cells_path: str, out_dir: str, blocks: int) -> None:
    cells = json.loads(Path(cells_path).read_text())
    out = Path(out_dir)
    out.mkdir(parents=True, exist_ok=False)
    with open(out / "fingerprints.tsv", "w") as f:
        for path in sorted({p for c in cells for p in resolve(c["argv"]) if os.path.isfile(p)}):
            f.write(f"{sha256(path)}\t{path}\n")
    (out / "cells.json").write_text(json.dumps(cells, indent=1))
    rng = random.SystemRandom()
    with open(out / "runs.tsv", "w") as f:
        f.write("block\tposition\tworkload\timpl\tuser\tsys\twall\tmaxrss_kb\texit\tloadavg1\toutput\n")
        for block in range(1, blocks + 1):
            order = list(range(len(cells)))
            rng.shuffle(order)
            for position, i in enumerate(order):
                c = cells[i]
                load = os.getloadavg()[0]
                user, sys_, wall, rss, text, code = run_once(resolve(c["argv"]), c["cpus"])
                f.write(f"{block}\t{position}\t{c['workload']}\t{c['impl']}\t{user:.4f}\t{sys_:.4f}\t"
                        f"{wall:.4f}\t{rss}\t{code}\t{load:.1f}\t{text}\n")
                f.flush()
            print(f"block {block}/{blocks} done", file=sys.stderr, flush=True)


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], int(sys.argv[3]))
