#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Sort-only instruction counts from an instr.sh run.

    instr_analyse.py OUT_DIR

Per workload and layout seed, the sort's user-space instructions are instructions(core) minus
instructions(identity baseline) of the same build and seed; prints them per build, the ratio
new / old per seed, and whole-process counts.  Checks exit codes and that old and new printed the
same hash.
"""

import csv
import statistics
import sys
from collections import defaultdict
from pathlib import Path


def main(out_dir: str) -> None:
    instr: dict[str, dict[str, dict[int, int]]] = defaultdict(lambda: defaultdict(dict))
    hashes: dict[str, set[str]] = defaultdict(set)
    bad = 0
    with open(Path(out_dir) / "instr.tsv") as f:
        for name, ins, _cyc, out in csv.reader(f, delimiter="\t"):
            stem, impl, seed = name.rsplit("-", 2) if not name.endswith(tuple(f"none-new-{s}" for s in "123")) \
                else (name.removesuffix(f"-none-new-{name[-1]}"), "none-new", name[-1])
            if "rc=0" not in out:
                bad += 1
                print(f"FAILED: {name}: {out}")
                continue
            instr[stem][impl][int(seed)] = int(ins)
            if not impl.startswith("none"):
                hashes[stem].add(out.split("hash=")[1].split()[0])
    for stem, hs in hashes.items():
        if len(hs) != 1:
            bad += 1
            print(f"HASH MISMATCH: {stem}: {hs}")
    print(f"{bad} problems\n")
    for stem in sorted(instr):
        d = instr[stem]
        sort_old = {s: d["old"][s] - d["none"][s] for s in d["old"]}
        sort_new = {s: d["new"][s] - d["none-new"][s] for s in d["new"]}
        ratios = [sort_new[s] / sort_old[s] for s in sorted(sort_old) if s in sort_new]
        base = [d["none-new"][s] / d["none"][s] for s in sorted(d["none"]) if s in d["none-new"]]
        print(f"{stem}")
        print(f"  sort instructions old {statistics.median(sort_old.values()):.4e}  new "
              f"{statistics.median(sort_new.values()):.4e}  new / old per seed: "
              + " ".join(f"{r:.4f}" for r in ratios))
        print(f"  baseline none {statistics.median(d['none'].values()):.4e}  none-new / none per seed: "
              + " ".join(f"{r:.5f}" for r in base))


if __name__ == "__main__":
    main(sys.argv[1])
