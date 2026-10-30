# Sorting, round eight (2026-10-27)

Round eight of `sorts/PLAN.md` (one suspect per lab variant, by CPU time), on the benchmark machine as six parallel shards on CPUs 20–25, two blocks each (12 blocks), load 24–26:

    cd sorts && ./shards.py 8 ../logs/2026-10-27-qsort-round8 2 20 21 22 23 24 25

Every run picked one of 8 shuffled builds of the round's commit at random (`shuffled-binaries.sha256`).  `analysis-cpu.txt` is `sorts/analyse_cpu.py <dir> core`: sort CPU time, `none` subtracted within each block; for boxed types it includes freeing the sorted array at exit, common to all algorithms, which dilutes those ratios towards 1.
