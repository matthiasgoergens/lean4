# Sorting, round ten (2026-10-27)

Round ten of `sorts/PLAN.md` (partition candidates head to head, all with cutoff 24), on the benchmark machine as six parallel shards on CPUs 20–25, two blocks each (12 blocks), load 62–73:

    cd sorts && ./shards.py 10 ../logs/2026-10-27-qsort-round10 2 20 21 22 23 24 25

Every run picked one of 8 shuffled builds of commit 127a767's sources at random (`shuffled-binaries.sha256`).  `analysis.txt` is `sorts/analyse.py <dir> pdq` (wall time; ignore its hash line about `none`); `analysis-cpu.txt` and `analysis-cpu-vs-core.txt` are `sorts/analyse_cpu.py <dir> pdq` and `core` (sort CPU time with `none` subtracted; at 100,000 elements the sorts take a few milliseconds and CPU-time granularity makes those intervals very wide, so use wall time there).
