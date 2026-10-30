#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Per workload and implementation, the fraction of full specialisation's gain a split keeps.

    fraction.py OUT_DIR [METRIC]

METRIC is `cpu` (default: user + sys minus the `none` cell of the same block, as analyse_cpu.py)
or `ns` (the in-process sort time the harness prints, for workloads without `none`).  For each
workload prints, per implementation, the median over blocks, the geometric-mean ratio to `pdq`
with a 95% t interval, and the fraction kept, (T_closure - T_impl) / (T_closure - T_pdq) on the
medians, with a 95% bootstrap interval over blocks (resampling blocks, 2000 draws, fixed seed).
Exits non-zero on failed runs or hashes that differ across implementations (`none` excepted).
"""

import csv
import math
import random
import statistics
import sys
from collections import defaultdict
from pathlib import Path

T975 = {n: t for n, t in zip(range(1, 31), [12.706, 4.303, 3.182, 2.776, 2.571, 2.447, 2.365,
        2.306, 2.262, 2.228, 2.201, 2.179, 2.160, 2.145, 2.131, 2.120, 2.110, 2.101, 2.093, 2.086,
        2.080, 2.074, 2.069, 2.064, 2.060, 2.056, 2.052, 2.048, 2.045, 2.042])}


def main(out_dir: str, metric: str) -> None:
    raw: dict[str, dict[str, dict[int, float]]] = defaultdict(lambda: defaultdict(dict))
    hashes: dict[str, set[str]] = defaultdict(set)
    loads = []
    bad = 0
    with open(Path(out_dir) / "runs.tsv") as f:
        for row in csv.DictReader(f, delimiter="\t"):
            kv = dict(x.split("=", 1) for x in row["output"].split() if "=" in x)
            loads.append(float(row["loadavg1"]))
            if "ns" not in kv or (row["impl"] != "none" and row["exit"] != "0"):
                bad += 1
                print(f"FAILED: block {row['block']} {row['workload']} {row['impl']} exit {row['exit']}")
                continue
            if row["impl"] != "none":
                hashes[row["workload"]].add(kv["hash"])
            v = float(row["user"]) + float(row["sys"]) if metric == "cpu" else float(kv["ns"]) / 1e9
            raw[row["workload"]][row["impl"]][int(row["block"])] = v
    for w, hs in hashes.items():
        if len(hs) != 1:
            bad += 1
            print(f"HASH MISMATCH: {w}: {hs}")
    print(f"{bad} problems; load average median {statistics.median(loads):.0f}, range {min(loads):.0f}-{max(loads):.0f}\n")
    rng = random.Random(1)
    for w in sorted(raw):
        cells = raw[w]
        if metric == "cpu":
            none = cells.get("none")
            if not none:
                continue
            t = {i: {b: x - none[b] for b, x in ts.items() if b in none} for i, ts in cells.items() if i != "none"}
        else:
            t = {i: ts for i, ts in cells.items() if i != "none"}
        if "pdq" not in t:
            continue
        print(f"{w}   ({metric})")
        blocks = sorted(set.intersection(*(set(ts) for ts in t.values())))
        for impl in sorted(t, key=lambda i: statistics.median(t[i].values())):
            med = statistics.median(t[impl].values())
            line = f"  {impl:16} median {med * 1e3:9.1f} ms"
            if impl != "pdq":
                ks = [b for b in t[impl] if b in t["pdq"] and t[impl][b] > 0 and t["pdq"][b] > 0]
                logs = [math.log(t[impl][b] / t["pdq"][b]) for b in ks]
                if len(logs) > 1:
                    m = statistics.mean(logs)
                    half = T975[len(logs) - 1] * statistics.stdev(logs) / math.sqrt(len(logs))
                    line += f"   / pdq {math.exp(m):6.3f} [{math.exp(m - half):6.3f}, {math.exp(m + half):6.3f}]"
            if "spec-closure" in t and impl not in ("pdq", "spec-closure"):
                def frac(bs):
                    c = statistics.median(t["spec-closure"][b] for b in bs)
                    p = statistics.median(t["pdq"][b] for b in bs)
                    s = statistics.median(t[impl][b] for b in bs)
                    return (c - s) / (c - p) if c != p else float("nan")
                f0 = frac(blocks)
                draws = sorted(frac([rng.choice(blocks) for _ in blocks]) for _ in range(2000))
                line += f"   kept {f0:6.2f} [{draws[50]:5.2f}, {draws[1949]:5.2f}]"
            print(line)


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else "cpu")
