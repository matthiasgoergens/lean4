# Measuring the PR: old `Array.qsort` against new

Written 2026-10-28 17:40 (UTC+8), before the timed runs.

## Question

For the upstream PR (branch `matthias/qsort-pdq` at 7d8ac86bab, base origin/master f4856ef9cd): how long does `Array.qsort` (and `Array.qsortOrd`) take on the PR's workloads when the same program is compiled by the branch's toolchain ("new") rather than by master's ("old")?

Estimand, per workload: the ratio new / old of the in-process time of the sort alone (the program reads `IO.monoNanosNow` around the sort and nothing else), as the geometric mean over blocks of the paired ratio, with a 95% t interval on the log ratios.  Secondary: the same ratio of the sort's CPU time, CPU(core) − CPU(none) in each block from `wait4`, which leaves out time spent descheduled.

Experimental unit: one run of one binary on one generated input, in a fresh process.

Nuisance factors: machine load (the box is shared; the 1-minute load average was 150–310 on 128 logical CPUs while preparing this, and other users' processes run on CPUs 40–45 unless pinned elsewhere; their SMT siblings 104–109 are not reserved either), code layout (handled by sampling: 8 builds per toolchain linked with lld's `--shuffle-sections` under seeds 1–8, one picked at random for each run), position within a block and time drift (randomised order within each block; blocks spread over six CPUs on six distinct physical cores).

What would matter: on random keys, a slowdown of the new code beyond a few per cent; on the cases of issue 8087, the size of the speed-up (orders of magnitude expected from a probe).

## Builds

- old: `qsort-pr/lean4-master`, a `cp -a` of the PR branch's `lean4-qsort-master` (`git archive` of f4856ef9cd; its sources match that commit, checked with `rsync --checksum --dry-run` against a fresh `git archive`).
- new: `qsort-pr/lean4-branch`, a `cp -a` of `lean4-qsort-spec-shape-e` (sources match 7d8ac86bab, checked the same way).
- Both copies were taken through the PR branch's build (`localhost/lean4-build`, `cmake --preset release -DUSE_GITHASH=OFF`, `make -j32`, its ccache); make had nothing to do in either (the branch tree's `Basic.lean` is newer than its `libInit.a`, but its generated C hashes to the value its object was compiled from).  Logs: `../measure-pr/build/`.
- Benchmark binaries: this directory's `Main.lean` (adapted from `sorts/Main.lean` of the research harness b629463, with only `Array.qsort`/`Array.qsortOrd` and an identity baseline), built by each stage 1 `lake` in `localhost/lean4-build` (`build-bins.sh`, `shuffled-build.sh`), into `bins/old/` and `bins/new/`.  They link the box's own `libgmp`, `libuv`, `libstdc++` dynamically, the same for both.

## Workloads (cells.py)

All `nat` unless said; `old` and `new`, and the baselines `none` (old build, not sorting) and `none-new` (new build, not sorting), all with `nocheck`.

- Issue 8087 and relatives, n = 100,000: `constant`, `dups4`, `pathological` (`[1, …, n−1, 0]`, the order of `Array.range' 1 n |>.push 0`), `organ`, `runs2`.
- n = 1,000,000: `nearly` (8 swaps; old about 17 s in the probe), `organ` (old 44 s in the probe: above the 30 s guide but under the 60 s cap, so included), `sorted`, `reversed`, `nearly300`, `zipf`, `jitter64`.
- Skipped at 1,000,000 because the old code would take over a minute per run: `constant` (about 550 s estimated: 50 s at 300,000 in the probe, quadratic), `dups4` (about 110 s: 10 s at 300,000), `pathological` (about 300 s: 27 s at 300,000), `runs2` (81 s measured).
- Random keys: `u64 random 6250000` (boxed `UInt64` through `qsortOrd`, the sort phase of `tests/compile_bench/io_compute.lean`), `nat`, `str`, `rec` random at 1,000,000.
- Small arrays: `nat random 1000000` in chunks of 8, 32 and 256 elements, each sorted as its own array.

Probe (one checked run each, layout seed 1, before this plan): `probe.log`.

## Design and stopping rule

18 randomised complete blocks: `shards.py 1 OUT 3 40 41 42 43 44 45`, six shards, each a `run.py` of 3 blocks pinned to its own CPU; every block runs all 76 cells once in a fresh random order.  Fixed in advance; no early stopping, no reruns of blocks.  Before the timed run, one checked pass (without `nocheck`, comparing against `Array.mergeSort`) of every workload with both builds.

## Analysis

Primary: `analyse.py OUT old` (exit codes, hash agreement between old and new on every workload, median in-process times, new / old with 95% intervals).  Secondary: `analyse_cpu.py OUT old` (sort CPU time over the `none` baseline; `none-new` should come out near zero, which checks that the two builds' non-sorting work is the same).  Where the two disagree, the CPU figure is the less load-sensitive one for short sorts; both get reported.

## io_compute

`io-compute.sh OUT 10`: `tests/compile_bench/io_compute.lean` compiled by each toolchain as `tests/compile_bench/run_test.sh` does (linked against the toolchain's `libleanshared`), 10 pairs, order within each pair random, pinned to CPU 40, under `sudo perf stat -e task-clock,instructions,cycles,instructions:u,cycles:u`.  Run after the block run, not alongside it.  Analysis `io_analyse.py OUT`: per phase (its own `measurement:` output) and per counter, medians, individual runs, new / old with 95% intervals.  Only `generate_sort` contains the sort; `write`, `read` and `shuffle` are controls that should not move.

## After the runs (added 2026-10-28 18:00)

The planned runs and analyses ran as written: 18 blocks, 0 failed runs, old and new hashes equal everywhere.  Three additions, decided after seeing the block run: (1) arrays of 8 spend most of the timed region outside the sort (the identity baseline takes 122 ms of 135–149 ms), and the CPU-time analysis turned out too noisy at this load to separate the sort, so `instr.sh` measured the sort's user-space instructions (process minus same-build baseline, layout seeds 1–3) for the random-key and small-array workloads; (2) `control.py`, the two builds' baselines against each other; (3) `table.py`, the PR table.  Results and caveats: `../measure-pr/README.md`.
