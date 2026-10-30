#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Analysis of a qsortbench run (PLAN.md; adapted from the research harness b629463).

    analyse.py OUT_DIR [BASELINE [LAST_BLOCK]]

Checks that every run exited 0 and that every implementation of a workload printed the same hash
(the baselines `none` and `none-new` excepted, which do not sort).  Then, per workload,
prints the median in-process sort time of every implementation, and the geometric mean over blocks
of the paired ratio of each implementation to BASELINE (default `old`), with a 95% t interval on
the log ratios.  Blocks after LAST_BLOCK (a run stopped part way through one) are left out.
"""

import csv
import math
import statistics
import sys
from collections import defaultdict
from pathlib import Path

T975 = {1: 12.706, 2: 4.303, 3: 3.182, 4: 2.776, 5: 2.571, 6: 2.447, 7: 2.365, 8: 2.306, 9: 2.262,
        10: 2.228, 11: 2.201, 12: 2.179, 13: 2.160, 14: 2.145, 15: 2.131, 16: 2.120, 17: 2.110,
        18: 2.101, 19: 2.093, 20: 2.086, 21: 2.080, 22: 2.074, 23: 2.069, 24: 2.064, 25: 2.060,
        26: 2.056, 27: 2.052, 28: 2.048, 29: 2.045, 30: 2.042}


def parse(output: str) -> dict[str, str]:
    return dict(kv.split("=", 1) for kv in output.split())


def ratio(xs: dict[int, float], ys: dict[int, float]) -> tuple[float, float, float, int]:
    logs = [math.log(xs[b] / ys[b]) for b in xs if b in ys]
    m = statistics.mean(logs)
    half = T975[len(logs) - 1] * statistics.stdev(logs) / math.sqrt(len(logs)) if len(logs) > 1 else math.inf
    return math.exp(m), math.exp(m - half), math.exp(m + half), len(logs)


def seconds(ns: float) -> str:
    return f"{ns / 1e6:.3g} ms" if ns < 1e9 else f"{ns / 1e9:.3g} s"


def main(out_dir: str, baseline: str, last_block: int | None) -> None:
    times: dict[str, dict[str, dict[int, float]]] = defaultdict(lambda: defaultdict(dict))
    hashes: dict[str, dict[str, set[str]]] = defaultdict(lambda: defaultdict(set))
    bad = 0
    with open(Path(out_dir) / "runs.tsv") as f:
        for row in csv.DictReader(f, delimiter="\t"):
            if last_block is not None and int(row["block"]) > last_block:
                continue
            if row["exit"] != "0":
                bad += 1
                print(f"FAILED: block {row['block']} {row['workload']} {row['impl']} exit {row['exit']}")
                continue
            kv = parse(row["output"])
            times[row["workload"]][row["impl"]][int(row["block"])] = float(kv["ns"])
            hashes[row["workload"]][row["impl"]].add(kv["hash"])
    for w, by_impl in hashes.items():
        distinct = set().union(*(h for impl, h in by_impl.items() if not impl.startswith("none")))
        if len(distinct) != 1:
            bad += 1
            print(f"HASH MISMATCH: {w}: {dict(by_impl)}")
    print(f"{bad} problems\n")
    for w in sorted(times):
        by_impl = times[w]
        print(w)
        for impl in sorted(by_impl, key=lambda i: statistics.median(by_impl[i].values())):
            med = statistics.median(by_impl[impl].values())
            line = f"  {impl:10} median {seconds(med):>10}"
            if impl != baseline and baseline in by_impl:
                g, lo, hi, k = ratio(by_impl[impl], by_impl[baseline])
                line += f"   / {baseline}: {g:.3g} [{lo:.3g}, {hi:.3g}] (n={k})"
            print(line)


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else "old",
         int(sys.argv[3]) if len(sys.argv) > 3 else None)
