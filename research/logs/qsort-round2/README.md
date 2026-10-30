# Sorting, round two (2026-10-27)

The second round of `sorts/PLAN.md` (the adaptive front end against pdq alone), run on the benchmark machine pinned to CPU 77, 10 blocks:

    cd bench && uv run --script run.py ../sorts/cells-round2.json ../logs/2026-10-27-qsort-round2 10

with `cells-round2.json` from `sorts/cells.py 2 77` (a copy is `cells.json` here) and `sorts` built from commit 0640787 with `lake build sorts` in the `localhost/lean-bench` image (Lean v4.34.1); `fingerprints.tsv` has its SHA-256.  `analysis.txt` is `sorts/analyse.py <this directory> pdq`, so every ratio is over pdq.  In this round pdq and adaptive sort `UInt64` with core's `(compare x y).isLT`.
