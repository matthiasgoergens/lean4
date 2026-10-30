#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Table of instr.sh output: per workload, the median instructions of each algorithm minus `none`
(the sort's own instructions), its ratio to pdq, and the spread (max - min) over repetitions.

    instr_table.py INSTR.txt
"""
import statistics
import sys
from collections import defaultdict

d = defaultdict(lambda: defaultdict(list))
for line in open(sys.argv[1]):
    p = line.split()
    if len(p) != 4 or p[0] == "rep":
        continue
    d[p[2]][p[1]].append(int(p[3]))
order = sys.argv[2].split() if len(sys.argv) > 2 else ["pdq", "spec-ctl", "spec-cold-hp", "spec-leaves-hp", "spec-cold-hpp", "spec-leaves-hpp", "spec-hot", "spec-closure"]
for w in d:
    base = statistics.median(d[w]["none"])
    pdq = statistics.median(d[w]["pdq"]) - base
    print(f"{w}  (none {base / 1e6:.1f} M)")
    for a in order:
        xs = d[w][a]
        m = statistics.median(xs) - base
        print(f"  {a:16} {m / 1e6:10.2f} M  / pdq {m / pdq:6.3f}   spread {(max(xs) - min(xs)) / 1e6:6.2f} M")
