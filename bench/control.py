#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Negative control of a qsortbench run: the identity baselines of the two builds.

    control.py OUT_DIR

Per workload, the geometric mean over blocks of `none-new` / `none` for the in-process time of the
timed region (no sort in either) and for the whole process's CPU time (user + sys), with 95% t
intervals.  The two builds differ only in `Array.qsort`, so both should be about 1; their spread
shows the noise the run's other ratios carry.
"""

import csv
import math
import statistics
import sys
from collections import defaultdict
from pathlib import Path

T975 = {17: 2.110}


def ratio(xs: dict[int, float], ys: dict[int, float]) -> str:
    logs = [math.log(xs[b] / ys[b]) for b in xs if b in ys]
    m = statistics.mean(logs)
    half = T975[len(logs) - 1] * statistics.stdev(logs) / math.sqrt(len(logs))
    return f"{math.exp(m):.3f} [{math.exp(m - half):.3f}, {math.exp(m + half):.3f}]"


def main(out_dir: str) -> None:
    ns: dict[str, dict[str, dict[int, float]]] = defaultdict(lambda: defaultdict(dict))
    cpu: dict[str, dict[str, dict[int, float]]] = defaultdict(lambda: defaultdict(dict))
    with open(Path(out_dir) / "runs.tsv") as f:
        for row in csv.DictReader(f, delimiter="\t"):
            if row["impl"].startswith("none"):
                kv = dict(x.split("=", 1) for x in row["output"].split() if "=" in x)
                ns[row["workload"]][row["impl"]][int(row["block"])] = float(kv["ns"])
                cpu[row["workload"]][row["impl"]][int(row["block"])] = float(row["user"]) + float(row["sys"])
    print(f"{'workload':28} {'in-process none-new / none':28} {'CPU none-new / none'}")
    for w in sorted(ns):
        print(f"{w:28} {ratio(ns[w]['none-new'], ns[w]['none']):28} {ratio(cpu[w]['none-new'], cpu[w]['none'])}")


if __name__ == "__main__":
    main(sys.argv[1])
