# Sorting, round three (2026-10-27)

The third round of `sorts/PLAN.md` (run-count limits on fresh data), run on the benchmark machine pinned to CPU 77:

    cd bench && uv run --script run.py ../sorts/cells-round3.json ../logs/2026-10-27-qsort-round3 10

with `cells-round3.json` from `sorts/cells.py 3 77` (a copy is `cells.json` here) and `sorts` built from commit 82eb632's sources plus the round-three cells (`lake build sorts` in `localhost/lean-bench`, Lean v4.34.1; `fingerprints.tsv`).  Stopped with SIGTERM during block 7, before the data had been looked at; `analysis.txt` is `sorts/analyse.py <this directory> pdq 6`, the six complete blocks.
