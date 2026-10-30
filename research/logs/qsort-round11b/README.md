# Sorting, round eleven, quiet rerun (2026-10-27)

The rerun of round eleven of `sorts/PLAN.md` (production pdq with cutoff 24 against core on random keys) as planned, on the benchmark machine as six shards on CPUs 20–25, three blocks each (18 blocks), load 13–21, with the same 8 shuffled builds of commit 9a55c74 as the first attempt (`shuffled-binaries.sha256`; that attempt, at load 157–243, is `qsort-round11`).  `analysis.txt` is `sorts/analyse.py <dir> core` (wall time, the round's primary measure); `analysis-cpu.txt` is `sorts/analyse_cpu.py <dir> core`.
