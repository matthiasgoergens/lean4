#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Markdown table of a qsortbench run for the PR.

    table.py OUT_DIR

Per workload, in cells.py's order: the median in-process sort time of `old` and `new`, the
geometric mean over blocks of new / old with a 95% t interval (analyse.py's estimator); the same
ratio after subtracting, within each block, the in-process time of the same build's identity
baseline (`none` from old, `none-new` from new: the timed loop's work apart from the sort, which
matters only for chunked workloads); the same ratio of sort CPU time over the `none` baseline
(analyse_cpu.py's estimator); a ratio is left blank where any of its baseline-corrected times is
not positive.  Then the first ratio inverted, as a speed-up old / new with its interval, and the
range of the 1-minute load average when that workload's runs started.  Exit codes and hashes are
checked by analyse.py, not here.
"""

import csv
import json
import math
import statistics
import sys
from collections import defaultdict
from pathlib import Path

T975 = {1: 12.706, 2: 4.303, 3: 3.182, 4: 2.776, 5: 2.571, 6: 2.447, 7: 2.365, 8: 2.306, 9: 2.262,
        10: 2.228, 11: 2.201, 12: 2.179, 13: 2.160, 14: 2.145, 15: 2.131, 16: 2.120, 17: 2.110,
        18: 2.101, 19: 2.093, 20: 2.086, 21: 2.080, 22: 2.074, 23: 2.069, 24: 2.064, 25: 2.060}


def ratio(new: dict[int, float], old: dict[int, float]) -> tuple[float, float, float, int] | None:
    ks = [b for b in new if b in old]
    if any(new[b] <= 0 or old[b] <= 0 for b in ks) or len(ks) < 2:
        return None
    logs = [math.log(new[b] / old[b]) for b in ks]
    m = statistics.mean(logs)
    half = T975[len(logs) - 1] * statistics.stdev(logs) / math.sqrt(len(logs))
    return math.exp(m), math.exp(m - half), math.exp(m + half), len(logs)


def seconds(ns: float) -> str:
    if ns < 1e6:
        return f"{ns / 1e3:.3g} µs"
    return f"{ns / 1e6:.3g} ms" if ns < 1e9 else f"{ns / 1e9:.3g} s"


def fmt(r: tuple[float, float, float, int] | None) -> str:
    if r is None:
        return ""
    g, lo, hi, _ = r
    digits = (lambda x: f"{x:.3g}") if g >= 0.01 else (lambda x: f"{x:.2e}")
    return f"{digits(g)} [{digits(lo)}, {digits(hi)}]"


def speedup(r: tuple[float, float, float, int] | None) -> str:
    if r is None:
        return ""
    g, lo, hi, _ = r
    digits = (lambda x: f"{x:,.0f}") if 1 / g >= 100 else (lambda x: f"{x:.3g}")
    return f"{digits(1 / g)}× [{digits(1 / hi)}, {digits(1 / lo)}]"


def main(out_dir: str) -> None:
    ns: dict[str, dict[str, dict[int, float]]] = defaultdict(lambda: defaultdict(dict))
    cpu: dict[str, dict[str, dict[int, float]]] = defaultdict(lambda: defaultdict(dict))
    load: dict[str, list[float]] = defaultdict(list)
    with open(Path(out_dir) / "runs.tsv") as f:
        for row in csv.DictReader(f, delimiter="\t"):
            w, impl, b = row["workload"], row["impl"], int(row["block"])
            kv = dict(x.split("=", 1) for x in row["output"].split() if "=" in x)
            if "ns" not in kv:
                continue
            ns[w][impl][b] = float(kv["ns"])
            cpu[w][impl][b] = float(row["user"]) + float(row["sys"])
            load[w].append(float(row["loadavg1"]))
    cells = json.loads(next(Path(out_dir).glob("cells-*.json")).read_text())
    order = list(dict.fromkeys(c["workload"] for c in cells))
    print("| workload | old | new | new / old | new / old, minus `none` | new / old, CPU time | speed-up | blocks | load |")
    print("|---|---:|---:|---|---|---|---|---:|---|")
    for w in order:
        old, new = ns[w]["old"], ns[w]["new"]
        none = cpu[w].get("none", {})
        sort = {impl: {b: t - none[b] for b, t in cpu[w][impl].items() if b in none} for impl in ("old", "new")}
        r = ratio(new, old)
        sub_old = {b: t - ns[w]["none"][b] for b, t in old.items() if b in ns[w]["none"]}
        sub_new = {b: t - ns[w]["none-new"][b] for b, t in new.items() if b in ns[w]["none-new"]}
        print(f"| {w} | {seconds(statistics.median(old.values()))} | {seconds(statistics.median(new.values()))} "
              f"| {fmt(r)} | {fmt(ratio(sub_new, sub_old))} | {fmt(ratio(sort['new'], sort['old']))} | {speedup(r)} | {r[3] if r else ''} "
              f"| {min(load[w]):.0f}–{max(load[w]):.0f} |")


if __name__ == "__main__":
    main(sys.argv[1])
