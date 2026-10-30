# Sorting, round one (2026-10-27)

The first round of `sorts/PLAN.md`, run on the benchmark machine pinned to CPU 77, 10 blocks:

    cd bench && uv run --script run.py ../sorts/cells-round1.json ../logs/2026-10-27-qsort-round1 10

with `cells-round1.json` from `sorts/cells.py 1 77` (a copy is `cells.json` here) and the binaries built from commit d1a29f3: `sorts` with `lake build` in the `localhost/lean-bench` image (Lean v4.34.1), `go/sortref` with `CGO_ENABLED=0 go build` in `golang:1.25` (go1.25.14).  `fingerprints.tsv` has their SHA-256.  `analysis.txt` is `sorts/analyse.py` on this directory.

In this round the `pdq` cell of the `u64` type sorted with `compare x y == .lt`, which calls `instDecidableEqOrdering` on every comparison, where `core` used `Array.qsortOrd`'s inlined `(compare x y).isLT`; the `u64` pdq ratios here measure that handicap, not the algorithm.  Round two compares them on equal terms.
