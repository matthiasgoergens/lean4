The opt-in compiler prototype removes the generic pair-state cost in these diagnostic workloads without changing their source. Ordinary Id/IO `while` and pair-recursive workers become native scalar workers. Returning the pair exposed an additional missed optimisation: splitting alone made that case slower, because the reconstructed pair remained above the loop condition. The follow-up moves its construction into the exit branch.

The related [Stabilizer work and layout-replication plan](STABILIZER.md) address the remaining layout nuisance factor. These campaigns repeat processes from fixed linked binaries; their intervals do not include uncertainty across layouts.

[audit.md](audit.md) records the adversarial reviews, the corrected build-admission defect, twelve passing harness tests and the additional controls-only validation. Future measurements require a completed build manifest binding the binaries, traces and commands; each build attempt preserves its diagnostics.

The subsequent [checked annotation prototype](ANNOTATIONS.md) adds `must_split_prod`: a missed transformation becomes a compilation error. It records compiler evidence without changing the measured kernels' generated C. Its contract, syntax limitations and nineteen compiler fixtures are separate from the timing results below.

At five million iterations, the final pair-return version takes 17.00 ms versus 72.35 ms with the pass disabled: median paired enabled/baseline ratio 0.235, descriptive 95% interval 0.231–0.236. The fresh half-size campaign reproduces the ratio at 0.235 (0.235–0.236). The splitting-only regression is retained below, not replaced. These are separate campaigns; their absolute times are not a paired comparison between plugin versions.

The source diagnosis and follow-up design are in [REGRESSION.md](REGRESSION.md); the initial protocol is in [DESIGN.md](DESIGN.md). Every block independently shuffles every variant/mode combination. Block counts are arbitrary and schedules are prefix-stable. Each timing is a fresh process with a half-sized warm-up, setup outside the timer, and a monotonic clock. No observations were excluded. Ratios pair enabled and baseline within the same block; intervals resample blocks 20,000 times. They are descriptive, without multiplicity-adjusted significance or equivalence claims.

The runs used Lean 4.33.1 (819816b2e0a3bf405af45ae5c7af2491d8f5bee6), bundled Clang 22.1.4, `-O3 -DNDEBUG`, CPU 31 on an i9-13900K, nice 10, normal scheduling and `intel_pstate`/`powersave`. Metadata retains load before/after each block, affinity, topology, runtime environment switches and exact versions. No CPU reservation or frequency-policy change was made. Randomisation mitigates nuisance factors; it cannot eliminate contention, serial drift or differences caused by code layout.

[SplitProd.lean](SplitProd.lean) runs after mono arity reduction. It requires exactly one eligible pair parameter and a direct self-call, creates a native-scalar worker and retains the original aggregate ABI as a wrapper. Partial applications retain that wrapper. Its second pass follows the next stock simplification and operates only on names recorded as generated in this compilation branch. It moves scalar-only `Prod.mk` bindings into a single using cases arm, stopping at actual uses and local-function/join-point captures. The option defaults to false. Both modes import the same plugin and compile the same input; only the option differs. Explicit `noinline` is preserved, and all builds enable compiler IR checking.

The final [C](results/20260911T075723.246119Z/split.c) and [assembly](results/20260911T075723.246119Z/split.s) show `tailPairReturn._splitProd` allocating its two boxes and pair after the arithmetic loop finishes. The stock `FloatLetIn.initialDecisions` treats a later potentially owned use of a constructor input as a reason to refuse movement. Its visitor does not distinguish these native scalar fields from objects. This explains the conservative barrier in the inspected IR; it is not a claim that arbitrary object constructors can safely be moved.

Each scalar campaign includes 400 small checksum-control processes, and each byte campaign includes 512. Every campaign also runs 72 semantic-control processes (36 baseline/enabled pairs). The semantic suite covers returned state, escaping pairs stored in arrays, non-tail recursion, partial application through a real closure, IO effect traces, representative scalar widths, break/continue and nested loops. A mixed object/scalar pair, two eligible pair parameters and the richer early-return state are skipped controls, not evidence that those shapes are optimised. Scalar and byte outputs, including warm-up outputs, are checked against Python recurrences at small and full inputs.

The preliminary controls-only archive [073839](results/20260911T073839.541513Z) contained an inadequate object negative control: its one-field `Box` monomorphised to a native scalar. It was corrected to retain an observed String before all performance campaigns. [BUILD_FAILURES.md](BUILD_FAILURES.md) records two failed follow-up builds; no timings from them were accepted. In particular, Lean can emit a compiler panic and still exit zero, so the build driver now rejects panic diagnostics too.

All six performance campaigns completed 2,320 timed observations, with 2,624 checksum-control and 432 semantic-control processes. Raw invocations, parsed observations, full paired ratios, schedules, seeds, source snapshots, generated C/assembly/traces, build commands and hashes are retained in each archive. Binary hashes are retained; the executable files themselves are ignored build outputs.

Tables report baseline and enabled medians in milliseconds. The effect is the median of within-block ratios, which need not equal the ratio of the two medians.

**Initial splitting only: 5 million iterations, 30 blocks** — [raw archive](results/20260911T074107.343764Z), [summary](results/20260911T074107.343764Z/summary.json).

| Variant | Baseline ms | Enabled ms | Paired ratio | Descriptive 95% interval |
|---|---:|---:|---:|---:|
| id-while | 68.368 | 16.977 | 0.248 | 0.247–0.249 |
| io-while | 67.044 | 16.987 | 0.254 | 0.253–0.254 |
| for-nat | 17.533 | 17.530 | 1.000 | 1.000–1.000 |
| for-usize | 16.969 | 17.032 | 1.000 | 0.999–1.006 |
| tail-scalar | 16.962 | 16.994 | 1.001 | 1.000–1.003 |
| tail-pair | 67.287 | 16.978 | 0.253 | 0.252–0.253 |
| tail-pair-return | 73.013 | 90.666 | 1.240 | 1.232–1.250 |
| while-struct | 17.526 | 17.559 | 1.000 | 1.000–1.003 |
| tail-struct | 17.523 | 17.542 | 1.000 | 1.000–1.003 |
| tail-fuel | 17.983 | 17.969 | 1.000 | 0.997–1.002 |

**Initial splitting only: 2.5 million iterations, 20 blocks** — [raw archive](results/20260911T074330.855990Z), [summary](results/20260911T074330.855990Z/summary.json).

| Variant | Baseline ms | Enabled ms | Paired ratio | Descriptive 95% interval |
|---|---:|---:|---:|---:|
| id-while | 35.414 | 8.709 | 0.246 | 0.244–0.249 |
| io-while | 34.738 | 8.719 | 0.251 | 0.249–0.254 |
| for-nat | 8.971 | 8.989 | 1.000 | 0.986–1.005 |
| for-usize | 8.665 | 8.720 | 1.007 | 0.991–1.014 |
| tail-scalar | 8.687 | 8.773 | 1.001 | 0.998–1.011 |
| tail-pair | 34.454 | 8.648 | 0.252 | 0.251–0.253 |
| tail-pair-return | 37.162 | 46.944 | 1.257 | 1.241–1.274 |
| while-struct | 8.922 | 8.945 | 1.001 | 0.994–1.006 |
| tail-struct | 8.977 | 8.972 | 1.006 | 0.985–1.013 |
| tail-fuel | 9.164 | 9.134 | 0.998 | 0.982–1.007 |

**Initial splitting only: 1 MiB byte scan, 16 rounds, 20 blocks** — [raw archive](results/20260911T074458.741308Z), [summary](results/20260911T074458.741308Z/summary.json).

| Variant | Baseline ms | Enabled ms | Paired ratio | Descriptive 95% interval |
|---|---:|---:|---:|---:|
| nat-while | 118.027 | 117.838 | 1.000 | 0.982–1.004 |
| usize-while | 230.873 | 27.990 | 0.121 | 0.120–0.121 |
| usize-for | 28.370 | 28.337 | 1.000 | 0.994–1.005 |
| state-while | 31.594 | 32.033 | 1.000 | 0.998–1.011 |

**Splitting and constructor placement: 5 million iterations, 30 blocks** — [raw archive](results/20260911T075723.246119Z), [summary](results/20260911T075723.246119Z/summary.json).

| Variant | Baseline ms | Enabled ms | Paired ratio | Descriptive 95% interval |
|---|---:|---:|---:|---:|
| id-while | 69.188 | 17.020 | 0.247 | 0.244–0.250 |
| io-while | 67.222 | 16.973 | 0.253 | 0.251–0.253 |
| for-nat | 17.619 | 17.590 | 1.000 | 0.995–1.001 |
| for-usize | 16.969 | 16.985 | 1.000 | 1.000–1.000 |
| tail-scalar | 16.978 | 17.015 | 1.000 | 0.999–1.002 |
| tail-pair | 67.447 | 17.140 | 0.253 | 0.251–0.253 |
| tail-pair-return | 72.348 | 16.997 | 0.235 | 0.231–0.236 |
| while-struct | 17.531 | 17.611 | 1.000 | 0.999–1.000 |
| tail-struct | 17.540 | 17.526 | 1.000 | 0.999–1.000 |
| tail-fuel | 17.986 | 17.962 | 0.999 | 0.997–1.001 |

**Splitting and constructor placement: 2.5 million iterations, 20 blocks** — [raw archive](results/20260911T075837.050387Z), [summary](results/20260911T075837.050387Z/summary.json).

| Variant | Baseline ms | Enabled ms | Paired ratio | Descriptive 95% interval |
|---|---:|---:|---:|---:|
| id-while | 34.071 | 8.497 | 0.250 | 0.249–0.253 |
| io-while | 33.700 | 8.495 | 0.253 | 0.249–0.254 |
| for-nat | 8.768 | 8.820 | 1.002 | 1.000–1.006 |
| for-usize | 8.497 | 8.491 | 1.000 | 0.995–1.002 |
| tail-scalar | 8.487 | 8.494 | 1.000 | 0.999–1.001 |
| tail-pair | 33.709 | 8.494 | 0.253 | 0.252–0.253 |
| tail-pair-return | 36.135 | 8.487 | 0.235 | 0.235–0.236 |
| while-struct | 8.780 | 8.811 | 1.000 | 0.998–1.005 |
| tail-struct | 8.771 | 8.773 | 1.000 | 0.996–1.002 |
| tail-fuel | 8.981 | 8.974 | 0.999 | 0.995–1.001 |

**Splitting and constructor placement: 1 MiB byte scan, 16 rounds, 20 blocks** — [raw archive](results/20260911T075929.180681Z), [summary](results/20260911T075929.180681Z/summary.json).

| Variant | Baseline ms | Enabled ms | Paired ratio | Descriptive 95% interval |
|---|---:|---:|---:|---:|
| nat-while | 116.386 | 117.593 | 1.012 | 1.001–1.023 |
| usize-while | 230.298 | 27.867 | 0.121 | 0.121–0.122 |
| usize-for | 28.283 | 28.316 | 1.000 | 0.996–1.003 |
| state-while | 31.471 | 31.531 | 1.001 | 0.999–1.006 |

The eligible checked USize byte loop benefits, but the original Nat-index byte loop does not receive the transformation. This remains a synthetic transfer case, not a whole-application result. Untouched range and concrete-state controls show no large median shift; this is not an equivalence result. Larger state shapes, multiple using branches, captured state, mutual recursion, code-size/compile-time costs across larger projects and a second machine remain work for a broader compiler evaluation. The scalar-only movement restriction does not itself guarantee profitability of worker splitting in every accepted function.

The prototype has bounded differential evidence and internal IR validation, not a semantic-preservation proof. Unsafe address/identity observations and resource-exhaustion timing are outside the claimed value-semantic contract. It is not ready to enable globally or submit as a general compiler fix.

Reproduce from the repository root, running the commands separately:

```sh
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python compiler-study/build.py
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python compiler-study/measure.py --n 5000000 --blocks 30 --rng-seed 20260919
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python compiler-study/measure.py --n 2500000 --blocks 20 --rng-seed 20260920
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python compiler-study/measure.py --kind byte --n 1048576 --rounds 16 --blocks 20 --rng-seed 20260921
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python compiler-study/verify.py
```

[verify.py](verify.py) audits archive consistency and recalculates summaries using the runner's analysis routines; it is not an independent statistical implementation. It checks raw/stored output agreement, process counts, grids, seeded schedules, source/build hashes, compiler diagnostics and transformation coverage. Historical binaries may be unavailable or replaced without invalidating archived source evidence. See [verification.json](verification.json) for the completed audit and [codex-review.txt](codex-review.txt) for the bounded source review.
