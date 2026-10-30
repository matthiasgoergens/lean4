#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Randomised blocks of wall-clock timings on CPU 6: timeit.py FILE BLOCKS REPS ALGO...
Each block runs every algorithm once (REPS sorts in one process) in random order; reports per
algorithm the median over blocks of the per-process median, and the ratio to the first algorithm."""
import random
import re
import statistics
import subprocess
import sys

BRK = "sorts/.lake/build/bin/brk"


def main() -> None:
    f, blocks, reps, algos = sys.argv[1], int(sys.argv[2]), sys.argv[3], sys.argv[4:]
    res = {a: [] for a in algos}
    hashes = {}
    rnd = random.Random(1)
    for _ in range(blocks):
        order = algos[:]
        rnd.shuffle(order)
        for a in order:
            out = subprocess.run(["taskset", "--cpu-list", "6", BRK, "time", a, f, reps], capture_output=True, text=True, check=True).stdout
            ns = [int(x) for x in re.search(r"ns=\[([^\]]*)\]", out).group(1).split(",")]
            hashes.setdefault(a, re.search(r"hash=(\d+)", out).group(1))
            res[a].append(statistics.median(ns[1:] if len(ns) > 1 else ns))
    base = statistics.median(res[algos[0]])
    hs = set(hashes.values())
    print(f"file={f} blocks={blocks} reps={reps} hashes_agree={len(hs) == 1}")
    for a in algos:
        m = statistics.median(res[a])
        print(f"  {a:45s} median_ms={m / 1e6:9.3f} ratio={m / base:6.3f} per_block_ms={[round(x / 1e6, 2) for x in res[a]]}")


if __name__ == "__main__":
    main()
