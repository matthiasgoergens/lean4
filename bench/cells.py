#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Writes the cells of PLAN.md, for run.py, to standard output.

    cells.py ROUND CPU

Round 1: every workload with `old` (the binaries built by origin/master's
toolchain), `new` (built by the PR branch's), and the baselines `none` and `none-new` (the same
program not sorting, from each build), all through shuffled.sh so that each run picks one of the
8 shuffled-layout binaries at random, with `nocheck` (the hashes are compared across builds
instead).  Round 2: the same, for the random-key and small-array workloads only (the rerun on a
quiet machine).
"""

import json
import sys

# (type, pattern, n, chunk)
WORKLOADS = (
    # The cases of lean4 issue 8087 and relatives, at 100,000.
    [("nat", p, 100000, 0) for p in ["constant", "dups4", "pathological", "organ", "runs2"]]
    # At 1,000,000, where the old code finishes within about 60 s (constant, dups4, pathological
    # and runs2 do not: PLAN.md).
    + [("nat", p, 1000000, 0) for p in ["nearly", "organ", "sorted", "reversed", "nearly300",
                                         "zipf", "jitter64"]]
    # Random keys: the sort phase of tests/compile_bench/io_compute.lean, and three key types.
    + [("u64", "random", 6250000, 0)]
    + [(t, "random", 1000000, 0) for t in ["nat", "str", "rec"]]
    # Small arrays.
    + [("nat", "random", 1000000, c) for c in [8, 32, 256]]
)

IMPLS = {"old": ("bins/old", "core"), "new": ("bins/new", "core"),
         "none": ("bins/old", "none"), "none-new": ("bins/new", "none")}


def main(round: int, cpu: int) -> None:
    workloads = {1: WORKLOADS, 2: [w for w in WORKLOADS if w[1] == "random"]}[round]
    cells = []
    for typ, pat, n, chunk in workloads:
        workload = f"{typ}-{pat}-{n}" + (f"-c{chunk}" if chunk else "")
        for impl, (bins, algo) in IMPLS.items():
            cells.append({"workload": workload, "impl": impl, "cpus": [cpu],
                          "argv": ["shuffled.sh", bins, algo, typ, pat, str(n), str(chunk), "nocheck"]})
    json.dump(cells, sys.stdout, indent=1)


if __name__ == "__main__":
    main(int(sys.argv[1]), int(sys.argv[2]))
