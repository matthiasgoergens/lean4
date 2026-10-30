# Sorting, round nine (2026-10-27)

Round nine of `sorts/PLAN.md` (choosing the partition by the pivot sample's hint), on the benchmark machine as six parallel shards on CPUs 20–25, two blocks each (12 blocks), load 7–8:

    cd sorts && ./shards.py 9 ../logs/2026-10-27-qsort-round9 2 20 21 22 23 24 25

Every run picked one of 8 shuffled builds of commit b2bec5f's sources at random (`shuffled-binaries.sha256`; `bin=SEED` in each output).  `analysis.txt` is `sorts/analyse.py <dir> pdq` (wall time; its hash check also compares `none`, whose output naturally differs: ignore that line); `analysis-cpu.txt` is `sorts/analyse_cpu.py <dir> core` (sort CPU time, `none` subtracted within each block; for boxed types it includes freeing the sorted array at exit, a cost common to all algorithms that dilutes their ratios towards 1).
