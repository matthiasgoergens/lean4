#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Analysis of an io-compute.sh run.

    io_analyse.py OUT_DIR

Checks that every run exited 0 and printed the four phases, then prints, per phase of
io_compute (its own `measurement:` lines, in seconds, from a millisecond clock) and per perf
counter, the median of each build, the individual observations, and the geometric mean over pairs
of the ratio new / old with a 95% t interval on the log ratios.  Also prints the 1-minute load
average before each run.
"""

import csv
import math
import statistics
import sys
from pathlib import Path

T975 = {1: 12.706, 2: 4.303, 3: 3.182, 4: 2.776, 5: 2.571, 6: 2.447, 7: 2.365, 8: 2.306, 9: 2.262,
        10: 2.228, 11: 2.201, 12: 2.179, 13: 2.160, 14: 2.145, 15: 2.131, 16: 2.120, 17: 2.110,
        18: 2.101, 19: 2.093, 20: 2.086}
PHASES = ["generate_sort", "write", "read", "shuffle"]
EVENTS = ["task-clock", "instructions", "cycles", "instructions:u", "cycles:u"]


def perf(path: Path) -> dict[str, float]:
    values = {}
    for line in path.read_text().splitlines():
        if not line or line.startswith("#"):
            continue
        fields = line.split(",")
        if fields[2] in EVENTS and fields[0] not in ("<not counted>", "<not supported>"):
            values[fields[2]] = float(fields[0])
    return values


def main(out_dir: str) -> None:
    out = Path(out_dir)
    data: dict[str, dict[str, dict[int, float]]] = {}
    loads = []
    bad = 0
    with open(out / "runs.tsv") as f:
        for row in csv.DictReader(f, delimiter="\t"):
            p, w = int(row["pair"]), row["impl"]
            loads.append(f"{p}{w[0]}:{row['loadavg1_before']}")
            if row["exit"] != "0":
                bad += 1
                print(f"FAILED: pair {p} {w} exit {row['exit']}: {row['output']}")
                continue
            phases = {}
            for line in row["output"].split(";"):
                if line.startswith("measurement: "):
                    name, value, unit = line.removeprefix("measurement: ").split()
                    assert unit == "s", line
                    phases[name] = float(value)
            if set(phases) != set(PHASES):
                bad += 1
                print(f"MISSING PHASES: pair {p} {w}: {row['output']}")
                continue
            for name, v in phases.items():
                data.setdefault(name, {}).setdefault(w, {})[p] = v
            for name, v in perf(out / f"perf-{p}-{w}.csv").items():
                data.setdefault(name, {}).setdefault(w, {})[p] = v
    print(f"{bad} problems")
    print("load average (1 min) before each run: " + " ".join(loads) + "\n")
    for name in PHASES + EVENTS:
        old, new = data[name]["old"], data[name]["new"]
        unit = "s" if name in PHASES else ("ms" if name == "task-clock" else "")
        logs = [math.log(new[p] / old[p]) for p in old if p in new and old[p] > 0 and new[p] > 0]
        m = statistics.mean(logs)
        half = T975[len(logs) - 1] * statistics.stdev(logs) / math.sqrt(len(logs))
        fmt = (lambda v: f"{v:.4g}") if unit else (lambda v: f"{v:.4e}")
        print(f"{name:15} old median {fmt(statistics.median(old.values()))} {unit:2}  new median "
              f"{fmt(statistics.median(new.values()))} {unit:2}  new/old {math.exp(m):.4f} "
              f"[{math.exp(m - half):.4f}, {math.exp(m + half):.4f}] (n={len(logs)})")
        print(f"{'':15} old: {' '.join(fmt(old[p]) for p in sorted(old))}")
        print(f"{'':15} new: {' '.join(fmt(new[p]) for p in sorted(new))}")


if __name__ == "__main__":
    main(sys.argv[1])
