#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""CPU-time analysis of a qsortbench run whose cells include `none` for every workload (adapted
from the research harness b629463).

    analyse_cpu.py OUT_DIR [BASELINE]

Wall time includes the time a process waits while descheduled, which on a busy machine adds large
noise to single runs; CPU time (user + sys, from run.py's wait4) does not.  Every cell of a workload
does the same work apart from the sort (same input, `nocheck`), and `none` does everything except
sort, so within a block, CPU(algo) - CPU(none) is the sort's CPU time.  Prints, per workload, its
median per implementation, and the geometric mean over blocks of the paired ratio to BASELINE
(default `old`) with a 95% t interval on the log ratios.  Checks exit codes and that hashes agree
across implementations (the baselines `none` and `none-new` excepted).  `none-new` is reported as
an implementation: its "sort CPU" is the difference in non-sorting work between the two builds,
which should be about zero.
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


def main(out_dir: str, baseline: str) -> None:
    cpu: dict[str, dict[str, dict[int, float]]] = defaultdict(lambda: defaultdict(dict))
    hashes: dict[str, set[str]] = defaultdict(set)
    bad = 0
    with open(Path(out_dir) / "runs.tsv") as f:
        for row in csv.DictReader(f, delimiter="\t"):
            kv = dict(x.split("=", 1) for x in row["output"].split() if "=" in x)
            if row["impl"].startswith("none"):
                if "ns" not in kv:
                    bad += 1
                    print(f"FAILED: block {row['block']} {row['workload']} none")
                    continue
            elif row["exit"] != "0":
                bad += 1
                print(f"FAILED: block {row['block']} {row['workload']} {row['impl']} exit {row['exit']}")
                continue
            else:
                hashes[row["workload"]].add(kv["hash"])
            cpu[row["workload"]][row["impl"]][int(row["block"])] = float(row["user"]) + float(row["sys"])
    for w, hs in hashes.items():
        if len(hs) != 1:
            bad += 1
            print(f"HASH MISMATCH: {w}: {hs}")
    print(f"{bad} problems\n")
    for w in sorted(cpu):
        none = cpu[w].get("none", {})
        if not none:
            continue  # no baseline in this workload: wall time only
        sort = {impl: {b: t - none[b] for b, t in ts.items() if b in none}
                for impl, ts in cpu[w].items() if impl != "none"}
        print(f"{w}   (none: median {statistics.median(none.values()):.3f} s CPU)")
        for impl in sorted(sort, key=lambda i: statistics.median(sort[i].values())):
            line = f"  {impl:28} sort CPU median {statistics.median(sort[impl].values()) * 1e3:9.1f} ms"
            if impl != baseline and baseline in sort and not impl.startswith("none"):
                ks = [b for b in sort[impl] if b in sort[baseline] and sort[impl][b] > 0 and sort[baseline][b] > 0]
                logs = [math.log(sort[impl][b] / sort[baseline][b]) for b in ks]
                m = statistics.mean(logs)
                half = T975[len(logs) - 1] * statistics.stdev(logs) / math.sqrt(len(logs))
                line += f"   / {baseline}: {math.exp(m):.3g} [{math.exp(m - half):.3g}, {math.exp(m + half):.3g}] (n={len(logs)})"
            print(line)


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else "old")
