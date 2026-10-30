# Sorting, round four (2026-10-27)

The rerun of round four of `sorts/PLAN.md` (the `PdqLab` variants against core and pdq on random keys), on the benchmark machine pinned to CPU 77, 10 blocks, load 35–45:

    cd bench && uv run --script run.py ../sorts/cells-round4.json ../logs/2026-10-27-qsort-round4 10

with `cells-round4.json` from `sorts/cells.py 4 77` and `sorts` built from commit c1c77a1 (pure production pdq; `lake build sorts` in `localhost/lean-bench`, Lean v4.34.1).  `analysis.txt` is `sorts/analyse.py <this directory> core`.  pdq and `lab-base` run the same algorithm from two copies of the code and differ by 4% at the gate case: a measure of code-layout effects there.
