# Old against new `Array.qsort`, for the upstream PR

Measured on the benchmark machine (AMD Ryzen Threadripper PRO 9985WX, 64 cores / 128 threads, `performance` governor, shared with other users' jobs) on 2026-10-28, 17:36–17:54 (UTC+8).  Old is origin/master f4856ef9cd, new is `matthias/qsort-pdq` at 7d8ac86bab; the same benchmark program is compiled by each toolchain.  Plan, written before the runs: `../bench/PLAN.md`; the sources of everything below are in `../bench/`.  Nothing was posted or pushed.

## Builds and their verification

- Source trees: the PR branch's `lean4-qsort-master` and `lean4-qsort-spec-shape-e` are not Git checkouts, so each was compared with a fresh `git archive` of its commit by `rsync --checksum --dry-run --itemize-changes` (build outputs and Git-ignored files excluded): no file differs in either (`verify/tree-master.txt`, `verify/tree-branch.txt`; only symlinks, which rsync skipped without `--links`, and one untracked test output directory in the branch tree are listed).
- Completeness: the branch tree's `QSort/*.lean` are newer (17:11) than its `libInit.a` (17:03) and `libleanshared.so` (17:07), because something re-elaborated `Basic.lean` at 17:12 after the full build.  The trees were left alone; copies (`cp -a`, keeping timestamps) in `qsort-pr/lean4-master` and `qsort-pr/lean4-branch` were taken through the PR branch's build (`build-copy.sh`: `localhost/lean4-build`, `cmake --preset release -DUSE_GITHASH=OFF`, `make -j32`, nice/ionice, its ccache).  Make had nothing to do in either (16 and 18 s; `build/`): Lean's build is hash-traced, and the branch's `Basic.c` hashes to 0224e8a2c5de81da, the input recorded in its object's trace.  So both builds are complete and current.
- The branch build's `Array.qsort` is the new one: its `Basic.c` has `equalM` and no `qpartition` (master's has `qpartition`), its `libleanshared.so` is 249,621,984 bytes (the size the spec notes give for `shape-e`), and it sorts 100,000 equal `Nat`s in 0.19 ms (median of the block run), against 5.4 s for master's.
- Toolchain fingerprints (SHA-256 of `lean`, `leanc`, `lake`, `libleanshared.so`, `libInit.a`, `libLean.a`, `QSort/Basic.olean`, `.ir`, and the image id): `build/toolchain-fingerprints.txt`.  `libleanshared.so`: old c175e8c9dbc4…, new 3fe57a3c59c7….
- Benchmark binaries: `../bench/Main.lean` (the generators and timing of the research harness b629463's `sorts/Main.lean`, using only `Array.qsort`/`Array.qsortOrd` and an identity baseline), built by each stage 1 `lake` in `localhost/lean4-build`, 8 times per toolchain with `-Kshuffle=1..8` (lld `--shuffle-sections`; `main` lands at different addresses in each), hashes in `runs/build-bins.log` and `runs/bins-fingerprints.tsv`.  They link the box's own `libgmp`, `libuv`, `libstdc++` dynamically, the same for both.
- Correctness: one checked run (result compared with `Array.mergeSort`) of every workload with both builds passed, and old and new printed the same hash on every workload in every run (`runs/smoke-check.log`; `analyse.py`: 0 problems).

## Results

Times are the in-process time of the sort alone (`IO.monoNanosNow` around it), medians over 18 randomised complete blocks; ratios are geometric means over blocks of the paired ratio new / old with a 95% t interval; the speed-up is its inverse.  Every run picks one of the 8 layout builds of its toolchain at random.  Sort instructions are user-space instructions of the sort alone (the process's count minus that of the same build's identity baseline on the same input), from separate runs; they are deterministic (the same to 4 digits across 3 layout seeds).

### Inputs that are quadratic or slow for the old code (`Nat`)

| input | n | old | new | new / old [95% CI] | speed-up [95% CI] |
|---|---:|---:|---:|---|---|
| all equal | 100,000 | 5.43 s | 0.191 ms | 3.56e-5 [3.08e-5, 4.10e-5] | 28,000× [24,000, 32,000] |
| 4 distinct values | 100,000 | 1.15 s | 1.48 ms | 1.25e-3 [1.13e-3, 1.38e-3] | 800× [720, 880] |
| `[1, …, n−1, 0]` (as `Array.range' 1 n \|>.push 0`) | 100,000 | 2.58 s | 0.474 ms | 1.71e-4 [1.47e-4, 1.99e-4] | 5,800× [5,000, 6,800] |
| organ pipe | 100,000 | 345 ms | 4.44 ms | 0.0127 [0.0111, 0.0145] | 79× [69, 90] |
| two interleaved runs | 100,000 | 906 ms | 4.33 ms | 4.43e-3 [4.00e-3, 4.90e-3] | 226× [204, 250] |
| nearly sorted (8 swaps) | 1,000,000 | 16.8 s | 27.3 ms | 1.57e-3 [1.25e-3, 1.99e-3] | 635× [503, 803] |
| organ pipe | 1,000,000 | 43.9 s | 69.8 ms | 1.47e-3 [1.30e-3, 1.66e-3] | 680× [602, 767] |
| sorted | 1,000,000 | 75.7 ms | 7.31 ms | 0.087 [0.064, 0.118] | 11.5× [8.5, 15.6] |
| reversed | 1,000,000 | 86.6 ms | 25.8 ms | 0.20 [0.14, 0.28] | 5.0× [3.5, 7.1] |
| nearly sorted (300 swaps) | 1,000,000 | 1.02 s | 33.5 ms | 0.0316 [0.0259, 0.0385] | 32× [26, 39] |
| skewed duplicates (Zipf-like) | 1,000,000 | 2.47 s | 90.6 ms | 0.0378 [0.0318, 0.0449] | 26× [22, 31] |
| each key within about 64 places of its position | 1,000,000 | 113 ms | 69 ms | 0.571 [0.488, 0.669] | 1.75× [1.49, 2.05] |

Not measured at 1,000,000 because the old code would take more than a minute per run: all equal (about 550 s, extrapolated from 50 s at 300,000), 4 distinct values (about 110 s, from 10 s), `[1, …, n−1, 0]` (about 300 s, from 27 s), two interleaved runs (81 s, measured once).  Organ pipe at 1,000,000 (44 s) is included although it exceeds the 30 s guide.

### Random keys and small arrays

| input | n | old | new | new / old, time [95% CI] | sort instructions new / old |
|---|---:|---:|---:|---|---:|
| `UInt64` through `qsortOrd` (io_compute's sort) | 6,250,000 | 5.17 s | 4.65 s | 0.918 [0.836, 1.01] | 0.815 |
| `Nat` | 1,000,000 | 114 ms | 118 ms | 1.01 [0.932, 1.10] | 0.903 |
| `String` (zero-padded decimals) | 1,000,000 | 1.93 s | 1.37 s | 0.705 [0.645, 0.771] | 0.837 |
| structure sorted by a `Nat` field | 1,000,000 | 646 ms | 612 ms | 0.96 [0.87, 1.06] | 0.853 |
| `Nat`, arrays of 8 | 1,000,000 in all | 149 ms | 135 ms | 0.939 [0.841, 1.05] (see below) | 0.499 |
| `Nat`, arrays of 32 | 1,000,000 in all | 82.7 ms | 65.3 ms | 0.802 [0.739, 0.869] | 0.680 |
| `Nat`, arrays of 256 | 1,000,000 in all | 71.8 ms | 60.6 ms | 0.861 [0.819, 0.906] | 0.782 |

For the small arrays the timed region contains, besides the sorts, about 1 µs of other work per array (the identity baseline takes 122 ms in-process on arrays of 8, 26 ms on 32, 2 ms on 256), so their time ratios understate the change in the sort itself.  Subtracting each build's baseline within each block gives 0.687 [0.602, 0.783] for arrays of 32 and 0.859 [0.815, 0.904] for 256; for arrays of 8 the baseline's noise is larger than the sort and some blocks come out negative, so there the instruction ratio is the usable figure.

### `tests/compile_bench/io_compute.lean`

Compiled by each toolchain as `tests/compile_bench/run_test.sh` does (`lean --c`, `leanc -O3 -DNDEBUG`, linked against that toolchain's `libleanshared.so`), 10 pairs, order within each pair random, pinned to CPU 40, under `sudo perf stat`.  Phase times are the program's own output (a millisecond clock).

| | old (median) | new (median) | new / old [95% CI] |
|---|---:|---:|---|
| generate_sort (contains the sort) | 6.485 s | 5.403 s | 0.844 [0.803, 0.886] |
| write (control) | 3.742 s | 3.635 s | 0.997 [0.941, 1.056] |
| read (control) | 0.268 s | 0.250 s | 0.974 [0.657, 1.444] |
| shuffle (control) | 0.915 s | 0.915 s | 0.988 [0.929, 1.051] |
| task-clock | 13.39 s | 12.28 s | 0.921 [0.882, 0.962] |
| instructions:u | 11,099,355,310–11,099,388,927 | 10,013,294,002–10,013,337,598 | 0.9022 (all runs within 0.9021–0.9022) |
| instructions (user and kernel) | 1.1308e10 | 1.0216e10 | 0.904 [0.867, 0.944] |
| cycles | 6.212e10 | 5.703e10 | 0.922 [0.881, 0.964] |

The whole program executes 1.086e9 (9.8%) fewer user-space instructions; the counts including the kernel scatter more (one old run at 1.34e10, one new at 1.16e10).  Individual runs: `runs/io-analysis.txt`.

## Load

- Block run (17:38–17:44): 1-minute load average 145–223 at the start of each run (per workload in `runs/blocks-table.md`; every run's value in the `loadavg1` column of `runs/2026-10-28-blocks/runs.tsv`).  Other users' processes were seen on CPUs 40–45 before the run; nothing reserves those CPUs or their SMT siblings 104–109.
- io_compute (17:46–17:50): 173–209 before each run, 175–208 after (`runs/2026-10-28-io/runs.tsv`).
- Instruction counts (17:53): 191 at the start, 183 at the end; the counts do not depend on load.

## Caveats and open points

- On this loaded machine the time intervals on random keys are about ±8%, so the time measurements alone cannot resolve changes smaller than that there; the instruction counts are exact and point the same way (or further) on every random-key and small-array workload.  `String` keys gain more in time (0.705) than in instructions (0.837); not investigated.
- Negative control (`runs/blocks-control.txt`): the two builds' identity baselines (no sort) should take equal time.  In-process, 17 of 19 workloads' intervals contain 1; `[1, …, n−1, 0]` gives 1.17 [1.03, 1.34] and arrays of 8 give 1.14 [1.04, 1.25].  Among 19 intervals one or two misses are expected by chance; their instruction counts are identical (ratio 1.00000 ± 0.00003 on all instruction-count workloads), so it is not a difference in work.  It matters only for arrays of 8, whose time ratio is mostly baseline (above).
- The CPU-time analysis over the `none` baseline (`runs/blocks-analysis-cpu.txt`, the plan's secondary analysis) is too noisy at this load to use: the ratio of the whole-process CPU times of the two builds' identical baselines ranges from 0.82 to 1.38 across workloads, and many baseline-corrected values come out negative.  The table gives it only where all 18 blocks are positive (in `runs/blocks-table.md`), and it should not be quoted.
- The roughly 1 µs per array spent in the timed region of chunked runs apart from the sort is not explained; a whole-process profile could not attribute it to the timed region.  The lab's harness has the same structure.
- Old `nearly` at 1,000,000 took 16.8 s here, not the 12.7 s known from elsewhere (different load, different machine state).
- After the plan was written, three things were added: the instruction-count runs (`instr.sh`), the negative control (`control.py`) and the PR table script (`table.py`); the planned analyses ran unchanged.

## Files

- `build-copy.sh`; `build/`: the finishing build logs of both copies and the toolchain fingerprints.
- `verify/`: source-tree comparisons with the commits.
- `runs/probe.log`: the sizing probe (one checked run per candidate, seed 1); `runs/smoke-check.log`: the checked pass.
- `runs/2026-10-28-blocks/`: the 18-block run (`runs.tsv`, one row per run with user/sys/wall CPU times, load and output; per-shard cells and fingerprints); `runs/blocks-analysis.txt` (`analyse.py`), `runs/blocks-analysis-cpu.txt` (`analyse_cpu.py`), `runs/blocks-control.txt` (`control.py`), `runs/blocks-table.md` (`table.py`).
- `runs/2026-10-28-io/`: io_compute (`runs.tsv`, `perf-PAIR-IMPL.csv`, `fingerprints.txt` with the binaries, their C and both `libleanshared.so`, `ldd.txt`, the source); `runs/io-analysis.txt` (`io_analyse.py`).
- `runs/2026-10-28-instr/`: instruction counts (`instr.tsv`, per-run perf output); `runs/instr-analysis.txt` (`instr_analyse.py`).

## Commands

On the benchmark machine, with `../bench/` copied to `qsort-pr/bench/` (binaries stay there, in `bins/old/` and `bins/new/`):

```
qsort-pr/build-copy.sh lean4-qsort-spec-shape-e qsort-pr/lean4-branch qsort-pr/logs/build-branch.log
qsort-pr/build-copy.sh lean4-qsort-master qsort-pr/lean4-master qsort-pr/logs/build-master.log
cd qsort-pr/bench
./build-bins.sh
./probe.sh
./smoke-check.sh
./shards.py 1 runs/2026-10-28-blocks 3 40 41 42 43 44 45
./io-compute.sh runs/2026-10-28-io 10
./instr.sh runs/2026-10-28-instr
```

Analysis, here: `analyse.py DIR old`, `analyse_cpu.py DIR old`, `control.py DIR`, `table.py DIR` on the block run; `io_analyse.py`, `instr_analyse.py` on the others.

## Rerun on a quiet machine: not done

The PR is meant to quote numbers from a quiet machine (earlier work found that at a load around 200 wall time flatters the new sort), so the random-key and small-array workloads (round 2 of `../bench/cells.py`) and the io_compute pairs were to be rerun once the 5-minute load average fell below 40.  `../bench/quiet-run.sh runs/2026-10-28-quiet 40 6` checked the load every 3 minutes from 17:58 to 23:58 (UTC+8) on 2026-10-28, ready to start the same design (18 blocks as 6 shards of 3 on CPUs 40–45, then 10 io_compute pairs) as soon as it did.  It never did: over 121 checks the 5-minute load average ranged from 82 (23:31) to 271 (22:52), so it gave up and nothing ran (`runs/2026-10-28-quiet/wait.log`).  Until a quiet rerun exists, the time ratios on random keys and small arrays above come from a loaded machine.  The instruction counts do not depend on load.  The build copies in `qsort-pr/` are kept for the rerun, which is `./quiet-run.sh runs/NAME 40 HOURS` from `qsort-pr/bench/`.

## Rerun on a quiet machine (2026-10-29)

`quiet-run.sh runs/2026-10-29-quiet 40 72`, started by the author, waited until 06:57 (UTC+8), when the 5-minute load fell to 31.7 (1-minute 11.35), and ran the same design: 18 blocks as 6 shards of 3 on CPUs 40–45 with the same shuffled-layout binaries (fingerprints unchanged), load 11–15, then 10 io_compute pairs, load 14–15.  Raw data in `runs/2026-10-29-quiet/` (`blocks/`, `io/`, `load.log`, `wait.log`); `analysis-wall.txt` and `analysis-cpu.txt` are `sorts/analyse.py` and `analyse_cpu.py` from the research harness with baseline `old` (their hash lines compare the `none` baselines, named `none` and `none-new`, which do not sort: old and new agree on every workload); `io-analysis.txt` is the io_compute analysis.

Sort time, new / old: `UInt64` 6.25M via `qsortOrd` 0.986 [0.97, 1.00]; `nat` 1M 0.949 [0.937, 0.961]; `rec` 1M 0.927 [0.907, 0.947]; `str` 1M 0.879 [0.846, 0.914]; arrays of 8 / 32 / 256: 0.847 [0.79, 0.908] / 0.739 [0.717, 0.761] / 0.805 [0.798, 0.811].

io_compute, new / old: generate_sort 0.927 [0.915, 0.939]; write 0.987 [0.966, 1.008]; read 1.039 [1.026, 1.053] (2 ms on 56 ms, in code the PR does not change; one build each, no layout sampling, so most likely placement); shuffle 1.092 [0.979, 1.218]; instructions:u 0.9022; cycles 0.9729 [0.962, 0.984].
