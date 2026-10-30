# Sorting, round seven, rerun (2026-10-27)

Round seven of `sorts/PLAN.md` (the insertion-sort cutoff swept), rerun on the benchmark machine as six shards on CPUs 20–25, two blocks each (12 blocks), with the load rising from 27 to 61 during the run; `qsort-round7-loaded` is the first attempt, stopped at load 200.  Every run picked one of round nine's 8 shuffled builds (`shuffled-binaries.sha256`).  `analysis.txt` is `sorts/analyse.py <dir> pdq` (wall time).
