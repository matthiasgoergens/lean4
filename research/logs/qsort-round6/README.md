# Sorting, round six (2026-10-27)

Round six of `sorts/PLAN.md` (the main random-key comparisons with code layout sampled), run on the benchmark machine as six parallel shards on CPUs 20–25, two blocks each (12 blocks), load 60–66:

    cd sorts && ./shards.py 6 ../logs/2026-10-27-qsort-round6 2 20 21 22 23 24 25

Every run went through `shuffled.sh`, which picked one of 8 builds of commit e132730's sources (production pdq is the monadic `sortM` only), each linked with a different shuffled function order by `shuffled-build.sh 8` in `localhost/lean-bench` (Lean v4.34.1); their SHA-256 are in `shuffled-binaries.sha256`, and each run's `output` starts with the build it used (`bin=SEED`).  `analysis-vs-core.txt` and `analysis.txt` are `sorts/analyse.py` with baselines core and pdq.
