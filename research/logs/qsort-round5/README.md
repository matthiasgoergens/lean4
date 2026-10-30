# Sorting, round five (2026-10-27)

Round five of `sorts/PLAN.md` (the one-directional partition and cutoff 24 against pdq, every pattern), run on the benchmark machine as six parallel shards on CPUs 20–25, two blocks each (12 blocks), load about 20–50:

    cd sorts && ./shards.py 5 ../logs/2026-10-27-qsort-round5 2 20 21 22 23 24 25

with `sorts` built from commit 1702358's sources minus the shuffle option (production `Pdq.qsort` running the monadic `sortM`; `lake build sorts` in `localhost/lean-bench`, Lean v4.34.1).  `shard-CPU/` holds each shard's own run directory (cells, fingerprints, runs); `runs.tsv` here merges them with blocks renumbered and a `cpu` column.  `analysis.txt` is `sorts/analyse.py <this directory> pdq`.
