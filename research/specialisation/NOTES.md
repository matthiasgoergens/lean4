# How much of pdqsort to specialise at each call site

Started 2026-10-28 (UTC+8 afternoon).  The port (`matthias/qsort-pdq`, base origin/master f4856ef9cd) marks `Array.qsort` `@[inline]` and every helper `@[specialize]`, so each of the 96 modules that call `qsort` gets the whole sort: generated C of those modules +23%, `libleanshared.so` +4.8%.  The question is how much of it to keep specialised.

## How Lean specialises, from the compiler source and the generated C

From `src/Lean/Compiler/LCNF/SpecInfo.lean` (origin/master): a parameter that is a type class instance (`[Monad m]`) is `.fixedInst` and is specialised **whether or not the declaration has `@[specialize]`**; a function parameter (`lt`) is specialised only under `@[specialize]` (`.fixedHO`).  `@[nospecialize]` on a declaration makes every parameter `.other`.  Specialisations are cached by a key that, for a helper without `@[specialize]`, holds only the instance (here `Id`'s `Monad`), not `lt`.  The body of a declaration that is itself a specialisation candidate (any instance parameter, or `@[inline]`) is not specialised in its own module.

Checked in the harness's generated C (`harness-c/`, Lean v4.34.1, `Main.c` with 16 call sites of each variant):

* Removing `@[specialize]` (`PdqHot`): the helper is still copied, specialised at `Id` with `lt` a closure (`lean_apply_2` + `lean_unbox` per comparison, no monad dictionary), but **once per calling module** instead of once per call site: 2 declarations of `heapSortM` in `Main.c` against 16 for `Pdq`.  `Pdq.c` itself has no specialisation at all, because `qsort` is `@[inline]`.  In core, most calling modules have one call site (67 of the 94 source files that mention `qsort` name it once), so this alone saves little.
* `@[nospecialize]` (`PdqHotNs`): no copy in `Main.c`; it calls the generic `PdqHotNs.heapSortM___redArg` with the `Id` monad dictionary (`lean_apply_2(toPure…)` and bind through closures).
* Warm definitions (`PdqHotW`: `def warmHeap {α : Type} lt … := Id.run (heapSortM (fun x y => pure ⟨lt x y⟩) …)` in the defining module): the defining module gets the `Id` specialisation, and `Main.c` reuses it through the cross-module specialisation cache (calls `PdqHotW_heapSortM___at___00PdqHotW_warmHeap_spec__0___redArg`, no copy).  The cache entries are exported as `private` (`Specialize.lean`, `exportEntriesFnEx?`), so whether this holds for importers that are `module`s, as in core, is checked on the core build below.  The key includes universe levels, so it can only match callers at `Type`.

## What core does with the same attributes

Core's modules are all `module`s.  On the core build of `hot-w` (the warm definitions), `Basic.c` holds the `Id` copies (`heapSortM___at___00Array_QSort_Internal_warmHeap_spec__0` and the others), but every calling module still makes its own (`Lean/Level.c`, `Lean/Util/SortExprs.c`).  A one-line probe compiled by that stage 1 (`core-probe/`): a non-module file calling `Array.qsort` reuses `warmHeap`'s copy (no `heapSortM` body), the same file as a `module` gets its own.  So the specialisation cache does not cross into `module` importers (its entries are exported as `private`), and in core:

* removing `@[specialize]` leaves one copy of the helper per calling module (`hot`: `libleanshared.so` 252.26 MB against the port's 253.50 and master's 241.95);
* warm definitions change nothing (`hot-w`: 252.31 MB);
* `@[nospecialize]` shares one generic copy (`hot-ns`: 247.84 MB), but generic code at `Id` allocates a closure and makes three indirect calls per comparison: the smoke test (`smoke-1.txt`, load ~130, one run each) had `nopis-ns` at 1.09 s on `pathological` against pdq's 8 ms, and the heapsort probe (`specheap`, below) 12× pdq.
* What does share an `Id` copy in core is a definition that is not a specialisation candidate, compiled in `Basic` and called by name.  `PdqCold` (harness) passes heapsort, the partial insertion sort and pivot selection to the recursion (`sortCoreM`) as parameters, and `qsort` fills them with `@[noinline]` definitions at `Id` (`heapSortId lt := heapSortM (fun x y => pure ⟨lt x y⟩)`, and the others).  In the harness's `Main.c` there is no copy of them, only calls to `PdqCold_heapSortId___redArg` and the others.  This changes code, not only attributes; `sortM` becomes `sortCoreM` applied to the generic helpers, definitionally.

## Speed round one (pre-registered)

Written before it ran; revised before it ran, after the core result above, to measure the variants core can use.

**Question.**  For each split, what fraction of the speed gain of full specialisation (pdq over the fully unspecialised `spec-closure`) does it keep, per workload?  And does an unchanged copy (`spec-ctl`) differ from pdq (negative control)?

**Splits.**  Without `@[specialize]` (one copy per module in core, and in the harness's single `Main` module): `spec-noheap` (heapsort), `spec-nopis` (heapsort and the partial insertion sort), `spec-nopiv` (heapsort and pivot selection, not inlined), `spec-hot` (all three).  The same machine code, comparison through a closure at `Id`, is what `PdqCold`-style sharing would run, and `spec-cold` checks that.  With `@[nospecialize]` (one generic copy): `spec-noheap-ns`, `spec-nopis-ns`, `spec-nopiv-ns`, `spec-hot-ns`.  Baselines `pdq`, `spec-ctl`, `spec-closure` (nothing specialised, `qsort` not inlined), and `none` for CPU time.  Plus the heapsort fallback alone (`specheap`, 1,000,000 random `Nat`s) for `pdq`, `spec-hot`, `spec-cold`, `spec-noheap-ns`, `spec-closure`.

**Workloads.**  The gate case (`u64 random 6250000`); random `nat`, `rec`, `str` at 1,000,000; nearly sorted `nat` at 1,000,000 (`nearly`, `nearly300`, `nearly5000`, `jitter64`); `sortedtail`, `organ`, `runs16`, `dups4` `nat` at 100,000; random `nat` at 1,000,000 in arrays of 8, 32, 256; `pathological` `nat` at 1,000,000.

**Design.**  `cells.py 201`.  Layout sampled (8 shuffled builds; `specheap` unshuffled), unchecked runs with hashes compared across algorithms (all variants make the same permutation), 6 shards on CPUs 40–45 (distinct physical cores), 2 blocks each (12 blocks).

**Estimand.**  Primary: per workload, the CPU-time ratio of each split to pdq (sort CPU = CPU(algo) − CPU(none) within a block, `analyse_cpu.py`), geometric mean over blocks with a 95% t interval; and the fraction of the full gain kept, `(T_closure − T_split) / (T_closure − T_pdq)` on medians over blocks.  In-process sort time (`analyse.py`, the `ns=` the harness prints) alongside, and for `specheap`, which has no `none` cell.

**What matters.**  A split is free on a workload if its interval against pdq lies below 1.03; a cost above 1.05 on random keys or the gate case would show in upstream's benchmark.  Exploratory otherwise: the result is a map of cost per workload, set against the size results.

### Round one, results

Ran 15:02–15:05 (UTC+8), load 45–63 (median 52), 12 blocks, 0 failed runs, hashes equal across algorithms in every workload.  Raw data and analyses in `logs/spec-round1/` (`fraction-cpu.txt`: CPU time minus `none`; `fraction-ns.txt`: in-process sort time, which is what to read for the workloads of a millisecond or two, where the CPU difference is noise; `analysis-cpu.txt`: `analyse_cpu.py` against pdq).  Binaries: 8 shuffled builds of harness commit 5a6af0d (`sorts-bins/5a6af0d.sha256` on the box).

* Negative control: `spec-ctl` (an unchanged copy) has no interval against pdq that excludes 1.
* Pivot selection at `Id` with the comparison through a closure (`spec-nopiv`) costs nothing measurable on any workload (random `nat` CPU 1.017 [0.94, 1.10]; gate 0.967 [0.85, 1.10]).
* Heapsort unspecialised costs nothing unless it runs (`spec-noheap` level with pdq everywhere).  When it runs (the `specheap` probe, in-process time): a closure at `Id` 1.66× [1.49, 1.86] pdq, generic (`@[nospecialize]`) 7.6× [6.8, 8.5].
* The partial insertion sort at `Id` through a closure (`spec-nopis`, `spec-hot`) costs 2.6–3.0× on nearly sorted input (in-process: `nearly` 2.96 [2.46, 3.55], `pathological` 3.00, `sortedtail` 2.78; CPU: `nearly300` 1.94, `nearly5000` 1.39) and 1.27× [1.17, 1.38] on `dups4`; nothing on random keys.  The absolute times are small (pdq 7.8 ms against 19.8 ms on `nearly` at 1,000,000).
* Generic code (`@[nospecialize]`) is far worse: the partial insertion sort 18–94× pdq on nearly sorted input, pivot selection 1.36× [1.23, 1.51] on random `nat`, 1.8× on `jitter64`.
* Fully unspecialised (`spec-closure`): random `nat` 2.49× [2.19, 2.82], gate 2.16× [1.96, 2.39], `rec` 1.77×, `str` 1.64×, nearly sorted up to 7×.
* `spec-cold` was slower than `spec-hot` on the partial insertion sort (CPU `nearly` 34.8 against 18.5 ms): `PdqCold` dropped `@[specialize]` from the helpers, so `heapSortId` and the others call the comparison through two closures (the wrapper `fun x y => pure ⟨lt x y⟩`, then `lt`).  Keeping `@[specialize]` on the generic helpers, which callers never reach directly, fixes that (`PdqShare` below; `specheap` smoke test: `spec-share` level with `spec-hot`).

## Sizes on the core build (all variants so far)

Stage 1 of each tree, built by `tools/core-build.sh` (PR branch's image, ccache, `-j32`); `tools/core-size.sh` output in `core-logs/size-*.tsv` on the box (copied to `logs/core/`).  `libleanshared.so` file size; master and the port are the PR branch's trees.

| variant | what is shared | libleanshared.so | over master |
|---|---|---|---|
| master f4856ef9cd | (old qsort) | 241,945,304 | |
| port | nothing | 253,495,992 | +4.77% |
| `hot` | `@[specialize]` removed from heap, PIS, pivot: one copy per module | 252,263,624 | +4.26% |
| `hot-w` | as `hot`, plus warm definitions | 252,307,096 | +4.28% |
| `noheap-ns` | heapsort generic | 251,768,112 | +4.06% |
| `nopiv-ns` | heapsort, pivot generic | 250,418,552 | +3.50% |
| `nopis-ns` | heapsort, PIS generic | 249,200,272 | +3.00% |
| `hot-ns` | heapsort, PIS, pivot generic | 247,839,640 | +2.44% |
| `closure` | everything (qsort not inlined) | 241,464,312 | −0.20% |

## Speed round two (pre-registered)

Written before it ran.

**Question.**  The sharing that core can do: what does each `PdqShare` split cost in speed, against pdq, and how much of the full gain does it keep?  `spec-cold-hp`: heapsort and pivot selection compiled once at `Id`, the rest specialised at the call site.  `spec-cold-hpp`: also the partial insertion sort.  `spec-leaves-hp`: the recursion itself, heapsort and pivot selection compiled once, the partitions, insertion sort and partial insertion sort specialised at the call site and called through closures.  `spec-leaves-hpp`: also the partial insertion sort shared.  Round one predicts: `cold-hp` level with pdq except on heapsort; `cold-hpp` as `spec-hot`; the leaves variants add a closure call per partition and per insertion sort, which should cost a few per cent on small arrays at most.

**Design.**  As round one (`cells.py 202`): same 16 workloads, `none`, `spec-closure`, `pdq`, `spec-ctl`, `spec-nopiv`, `spec-hot` and the four splits; the heapsort probe for `pdq`, `spec-hot`, `spec-share` (heapsort through `PdqShare.heapSortId`), `spec-closure`.  8 shuffled builds of harness commit af95112, 6 shards on CPUs 40–45, 2 blocks each.  Same estimands and margins.

### Round two, results

Ran 15:20–15:24, load 55–70 (median 60), 12 blocks, 0 failed runs, hashes equal.  `logs/spec-round2/` (same files as round one).  This round was noisier: at the gate case even the unchanged copy `spec-ctl` came out at 1.14 [0.99, 1.32] in-process and the medians of pdq and `spec-ctl` differ by 27%, so single gate-case ratios here do not resolve anything under about 20%.

* The heapsort probe: `spec-share` (`PdqShare.heapSortId`) 1.68× [1.45, 1.95] pdq, level with `spec-hot` 1.70×: the double closure of `PdqCold` is gone.
* Sharing the partial insertion sort (`cold-hpp`, `leaves-hpp`) costs as `spec-hot` did in round one: in-process 2.0–2.8× on `nearly`, `nearly300`, `nearly5000`, `pathological`, `sortedtail`; 1.32–1.37× on `dups4`.
* With it specialised (`cold-hp`, `leaves-hp`), no nearly sorted workload has an interval above 1.10.
* On random `nat` (the tightest workload, in-process): `cold-hp` 1.027 [1.014, 1.041], `cold-hpp` 1.028 [0.996, 1.060], `leaves-hp` 1.039 [1.000, 1.080], `leaves-hpp` 1.031 [1.017, 1.045], against `spec-ctl` 1.029 [0.974, 1.088]: a cost of up to 4% cannot be told from the copy effect.
* `runs16` (100,000): `cold-hp`, `leaves-hp` and `spec-nopiv` 1.13–1.14 with intervals above 1.04, `spec-hot` 1.05: unclear.

## Speed round three (pre-registered, confirmatory)

Written before it ran.

**Question.**  On random keys, the gate case, small arrays, `runs16`, `organ` and `nearly300`, does any of the four `PdqShare` splits cost more than 5% against pdq?

**Design.**  `cells.py 203`: `none`, `pdq`, `spec-ctl`, `spec-cold-hp`, `spec-cold-hpp`, `spec-leaves-hp`, `spec-leaves-hpp`; the gate case, random `nat`, `rec`, `str` at 1,000,000, random `nat` in arrays of 8, 32, 256, `runs16` and `organ` at 100,000, `nearly300` at 1,000,000.  Binaries of round two (8 shuffled builds of af95112).  6 shards on CPUs 40–45, 4 blocks each (24 blocks).

**Decision rule.**  Primary estimand: in-process sort time ratio to pdq, geometric mean over blocks, 95% t interval (`fraction.py … ns`); CPU time alongside.  A split is "free" on a workload if the upper end of its interval is below 1.05.  `spec-ctl` must itself be free everywhere, or the round measures layout, not the splits, and is reported as inconclusive.  `nearly300` is expected to show the partial insertion sort's cost for the `-hpp` splits (about 2×) and is there as a positive control.

### Round three, results

Ran 15:23–15:29, load 49–66 (median 62), 24 blocks, 0 failed runs, hashes equal.  `logs/spec-round3/`.

Under the rule fixed beforehand the round is inconclusive on most workloads: the unchanged copy `spec-ctl` was not "free" (upper end under 1.05) on the gate case, `rec`, `str` (1.087 [1.011, 1.168]), arrays of 8, `organ` and `nearly300`.  Where it was (random `nat`, arrays of 32 and 256, `runs16`), in-process time against pdq: `cold-hp` 1.027 [1.012, 1.042], 0.967, 1.048 [1.009, 1.088], 1.045 [1.017, 1.075]; the other three splits 1.03–1.11, the leaves variants the highest.  So the shared splits cost a few per cent on random keys, which timing on this box resolves only barely; instruction counts settle it (next section).

## Instruction counts

Timing on the shared box resolves 3–5% only with many blocks, so the remaining comparisons use user-space instruction counts (`sudo perf stat -e instructions:u`, `tools/instr.sh`, CPU 46), which are deterministic here: repeated runs agree to within 0.01%.  The sort's own instructions are the count minus `none`'s on the same workload.  Upstream's benchmark bot also reports instructions.  `logs/spec-instr*/table.txt`.

Round two's binaries (`logs/spec-instr/`), sort instructions over pdq:

| workload | `cold-hp` | `leaves-hp` | `cold-hpp` | `leaves-hpp` | `spec-hot` | `spec-closure` |
|---|---|---|---|---|---|---|
| gate (u64, 6.25M) | 1.068 | 1.092 | 1.068 | 1.092 | 1.069 | 6.23 |
| random nat 1M | 1.050 | 1.069 | 1.050 | 1.070 | 1.050 | 4.49 |
| random str 1M | 1.028 | 1.038 | 1.028 | 1.039 | 1.028 | 2.88 |
| arrays of 8 | 1.019 | 1.430 | 1.019 | 1.456 | 1.000 | 3.08 |
| arrays of 256 | 1.095 | 1.137 | 1.096 | 1.139 | 1.097 | 3.96 |
| runs16 100k | 1.054 | 1.076 | 1.057 | 1.078 | 1.056 | 4.66 |
| nearly300 1M | 1.003 | 1.004 | 1.951 | 1.951 | 1.951 | 6.03 |
| dups4 100k | 1.001 | 1.001 | 1.447 | 1.447 | 1.447 | 4.65 |

`spec-ctl` is 1.000 everywhere.  Two causes, separated by further variants (`logs/spec-instr2/`, `spec-instr3/`, `spec-instr4/`):

* Pivot selection through a closure costs about 2.5% on random keys (12 closure calls per partition).  Making `medianM` and `choosePivotM` `@[specialize]` instead of `@[inline]` (`spec-pivspec`) costs 2.6% too (result tuples allocated), and saves only 0.25 MB in core (`pivspec`: 253,244,752).  So pivot selection stays inlined.
* `PdqShare`'s `sortCoreM` took all six helpers as parameters.  Passing `choosePivotM` (an `@[inline]` function) as a parameter makes its local index function `ad` a closure in the specialised recursion (`lean_alloc_closure` plus six `lean_apply_4` per partition, seen in a two-function probe, `harness-c/Probe-coldh.c`): another 2.5%, even with heapsort the only helper shared (`spec-cold-h`: gate 1.027, random `nat` 1.023).
* `PdqShare2`/`PdqShare3` take only heapsort, the partial insertion sort and the equal-key partition as parameters and call the rest directly, as `sortM` does.  `PdqShare2` passes `heapSortId lt`, a closure over the user's comparison, which costs one allocation per `qsort` call (+1.5% on arrays of 8).  `PdqShare3` passes the helpers themselves, each taking the comparison as its first argument (`sortM` is literally `sortCoreM partitionEqualM heapSortM partialInsertionSortM`), and `heapSortId` etc. are the helpers at `Id`.

`PdqShare3`, sort instructions over pdq (`logs/spec-instr4/table.txt`):

| workload | `c3-h` | `c3-he` | `c3-hp` | `c3-hpe` |
|---|---|---|---|---|
| gate | 1.000 | 1.000 | 1.001 | 1.001 |
| random nat 1M | 1.000 | 1.000 | 1.001 | 1.001 |
| random str 1M | 1.000 | 1.000 | 1.001 | 1.001 |
| arrays of 8 | 1.003 | 1.003 | 1.003 | 1.003 |
| arrays of 256 | 1.001 | 1.001 | 1.002 | 1.002 |
| runs16 100k | 1.000 | 1.000 | 1.003 | 1.003 |
| nearly300 1M | 1.000 | 1.000 | 1.948 | 1.948 |
| dups4 100k | 1.000 | 1.163 | 1.447 | 1.609 |

So sharing heapsort through `sortCoreM` is free, sharing the equal-key partition costs 16% only on many duplicates, and sharing the partial insertion sort costs 1.45–1.95× on nearly sorted input and duplicates.

## Speed round four (pre-registered)

Written before it ran.

**Question.**  Do the instruction counts of the `PdqC5*` splits (heapsort shared: level with pdq; equal-key partition shared: +16% on `dups4` only; partial insertion sort shared: +45% on `dups4`, +95% on `nearly300`) carry over to time, and what fraction of the full specialisation gain does each keep per workload?

**Design.**  `cells.py 204`: `none`, `spec-closure`, `pdq`, `spec-ctl`, `spec-c5-h`, `spec-c5-he`, `spec-c5-hp`, `spec-c5-hpe` on round one's 16 workloads, and the heapsort probe for `pdq`, `spec-c5-h`, `spec-closure`.  8 shuffled builds of harness commit 016df63, 6 shards on CPUs 40–45, 3 blocks each (18 blocks), started after the core builds finish.

**Estimand and rule.**  As round one: in-process ratio to pdq with 95% t intervals, the fraction of the gain kept, CPU time alongside.  Prediction from the instruction counts: `c5-h` and `c5-he` within the noise of `spec-ctl` on every workload except `dups4` for `c5-he`; the `-hp` splits 1.5–3× on nearly sorted input and `dups4`.  A disagreement between time and instructions larger than `spec-ctl`'s spread is a finding to resolve, not to average.

### Round four, results

Ran 16:05–16:16, load 54–68 (median 64), 18 blocks, 0 failed runs, hashes equal.  `logs/spec-round4/`.  Time agrees with the instruction counts (in-process, ratio to pdq; `spec-ctl` within 0.92–1.06 on every workload):

* `c5-h`: no workload with an interval excluding 1 except the heapsort probe, 1.85× [1.70, 2.01] (the fully unspecialised sort: 1.91×).
* `c5-he`: level with pdq except `dups4`, 1.063 [1.003, 1.126].
* `c5-hp`, `c5-hpe`: 2.0–3.0× on `nearly`, `nearly300`, `nearly5000`, `pathological`, `sortedtail`; 1.29–1.33× on `dups4`; level on random keys, small arrays, `runs16`, `organ`, `jitter64`.
* `spec-closure`: 1.9–7.2×; 3.18× at the gate.

For scale, master's qsort (harness `core`, instructions, `logs/spec-instr5/table-core.txt`) takes 62× pdq on `nearly300`, 1427× on `nearly`, 2131× on `dups4`, 4.7× on `sortedtail`, and 1.26× at the gate, so even `c5-hpe` stays far ahead of it on every input measured.

## Sizes of the `PdqC5*` splits in core

With their proofs (`Lemmas.lean`: `sortCoreM_eq_sortM`, and a `simp only [sortCoreM_qsort]` after each `unfold qsort`), built cleanly by `tools/core-build.sh` (`tools/cold/mkc5.py` writes the files).  `libleanshared.so`:

| variant | shared | bytes | over master | share of the port's increase removed |
|---|---|---|---|---|
| port | nothing | 253,495,992 | +4.77% | |
| `c5-h` | heapsort | 251,763,664 | +4.06% | 15% |
| `c5-he` | heapsort, equal-key partition | 249,804,424 | +3.25% | 32% |
| `c5-hp` | heapsort, partial insertion sort | 249,192,480 | +2.99% | 37% |
| `c5-hpe` | all three | 247,235,312 | +2.19% | 54% |
| `closure` | everything | 241,464,312 | −0.20% | 104% |

(`c3-h`, the variant that passed the specialised helpers as bare constants, came out at 256,771,704: larger than the port, because of the duplicate copies.)

## Compile cost

`tools/ccost.sh 5`: `leanc -O3 -DNDEBUG -c` of three calling modules' generated C, randomised blocks, CPU 46, median of 5 (ms), and object size (`logs/spec-ccost/ccost.txt`):

| module (call sites) | master | port | `c5-h` | `c5-he` | `c5-hpe` | `c5b-hpe` | `closure` |
|---|---|---|---|---|---|---|---|
| `Lean/Meta/Tactic/Grind/VarRename` (1) | 289 | 788 | 736 | 703 | 612 | 596 | 246 |
| `Lean/Level` (1) | 1325 | 1903 | 1796 | 1641 | 1631 | 1633 | 1222 |
| `Lean/Util/SortExprs` (2) | 312 | 1270 | 1125 | 1000 | 879 | 884 | 213 |

So the C compile cost per call site goes from about +0.5 s (port) to about +0.3 s (`c5-hpe`).

## The proposed change

`share-cold-hpe.patch` (a `git format-patch` against `matthias/qsort-pdq` at 09bb5d2473, applies cleanly; not committed to the branch) is `c5b-hpe`: the recursion is defined once, as `sortCoreM` taking the equal-key partition, heapsort and partial insertion sort as parameters (each taking the comparison); `sortM` becomes the `abbrev` that passes the generic helpers, so no statement changes; the three proofs that induct on `sortM` induct on `sortCoreM` after `unfold sortM`; `qsort` passes `partitionEqualId`, `heapSortId`, `partialInsertionSortId` (`@[noinline]`, at `Id`, compiled once in `Basic`), and the four `qsort` lemmas rewrite with a `rfl` lemma, `sortCoreM_qsort`, after `unfold qsort`.  `share-cold-he.diff` is the same for the split that keeps the partial insertion sort specialised (`c5b-he`).

Checked on the core build: both build with `Lemmas.lean` and `Cost.lean` (no `sorry`); `libleanshared.so` 247,270,928 (`c5b-hpe`) and 249,818,424 (`c5b-he`); the targeted ctest (`-R "qsort|Array|array|constTrie|grind_lia|Sort|sort"`, 79 tests) passes on both; the full ctest on `c5b-hpe` fails the same 4 of 4705 tests as master and the port (`logs/core/ctest-c5b-hpe-full.log`).  In the generated C, `Lean/Level.c` holds only `sortCoreM`, `partitionM` and `insertionSortM` specialised to its comparison and calls `heapSortId___redArg`, `partialInsertionSortId___redArg`, `partitionEqualId___redArg`; `Init/Data/Array/QSort/Basic.c` holds the one copy of each at `Id` (`core-c/c5b-hpe/`).

## Conclusion

Every split was measured against the port (everything specialised) and the fully unspecialised sort (`closure`), in size on the core build and in speed in the harness (time in randomised blocks with layout sampled, and deterministic instruction counts).

* Attributes alone cannot share code across core's modules.  Without `@[specialize]` a helper is still copied once per calling module (the monad instance is always specialised, and the specialisation cache does not cross into `module` importers); with `@[nospecialize]` one generic copy is shared but runs 7.6× (heapsort) to 90× (partial insertion sort) slower than pdq.
* Sharing needs the code change above: the shared helpers as parameters of the recursion, filled by `qsort` with definitions compiled once at `Id`.  Passing only the shared helpers, and passing them as constants that take the comparison, matters: other forms cost 1.5–2.5% on random keys or duplicated code at every call site.
* Pivot selection must stay specialised and inlined (2.5% on random keys otherwise, for 0.25 MB).  Sharing the recursion as well (the leaves variants, which call the partitions and insertion sort through closures) costs 2–4% more instructions than the matching `cold` variant on random keys and 40% more on arrays of 8, for 0.7–0.9 MB.
* Recommended: share heapsort, the partial insertion sort and the equal-key partition (`c5b-hpe`).  Increase over master 4.77% → 2.19% (54% of it removed), C compile per call site +0.5 s → +0.3 s, random keys, small arrays, interleaved runs and the gate case unchanged (instructions within 0.3%, time within the control's noise); nearly sorted input 1.9–2.4× pdq's instructions (1.9–2.8× time), many equal keys 1.6× (1.3× time), heapsort fallback 1.85×, all still 2–1300× fewer instructions than master's quicksort on those inputs.  If nearly sorted speed matters more than 1% of `libleanshared.so`, `c5b-he` keeps it (increase 3.25%, only many equal keys pay, 1.16× instructions, 1.06× time).
* The largest remaining per-site cost is the specialised recursion itself: about 50 KB of the 70–80 KB of C per call site with `c5-hpe` (harness probe and `Lean/Level.c`).  In the harness probe (`harness-c/PPdq.c`) its body makes 22 recursive calls and calls `partitionM` from 4 places where the source has 5 and 1, so the compiler copies its tail several times.  Not pursued here; a restructuring that keeps that tail in one place might shrink every call site further at no speed cost, but that is untested.

## Applied: heapsort and the equal-key partition shared (2026-10-28 evening)

Matthias chose `c5b-he`.  Commit 896924ba7d on `matthias/qsort-pdq` ("perf: compile the rarely used parts of `Array.qsort` once", author Matthias Goergens <matthias.goergens@gmail.com>, not pushed) is `share-cold-he.diff`.  On the box (`lean4-qsort-spec-c5b-he`, synced from the worktree with the PR branch's filter): builds with `Lemmas.lean` and `Cost.lean`; `libleanshared.so` 249,818,424; targeted ctest 79/79 passed; full ctest 4701 passed, 4 failed out of 4705 (`tests/lake/tests/15761`, `tests/lake/tests/samply`, `lint.py`, `elab/async_systems_info`, the same four as on master and the port).  Logs: `logs/core/ctest-branch-*.log`.

## Copies of the recursion's tail

Correction to the conclusion above: "22 recursive calls" was a miscount (the 22 calls in the specialised `sortM` included 13 calls of the pivot index helper `ad`).  The real figures, from the C of the recursion's body (harness probe and `Lean/Level.c`): 4 call sites of `partitionM` (source: 1), 2 of `partitionEqualM` and of the partial insertion sort (source: 1 each), and 15 recursive calls or loops back (source: 5).

The LCNF (`set_option trace.Compiler.result true`, `harness-c/lcnf-*.trace`) shows two independent causes, each doubling the tail:

1. The equal-key test `let ⟨equal⟩ ← (if … then do pure ⟨!(← lt …).down⟩ else pure ⟨false⟩)`: the path with the known `false` gets its own copy of the partition and recursion.
2. A split inside the inlined pivot selection.  First it was the branch for ranges under 8 elements (dead here: the recursion only selects a pivot above 24), which returns the known hint `.increasing`; with that branch removed (`choosePivotM` taking `8 ≤ b - a`), the split moves to the ninther / median-of-three branch.  Hiding the hint behind a `@[noinline]` function (`hintOf`) or sharing the last median through a local function changed nothing; the compiler still copies the tail into both branches.

Variants (harness, one call site, C bytes; `tools/shape_probe.sh`; all with the same `pair` hashes as pdq on random, dups4, nearly300, organ, runs16, pathological, constant, reversed, and arrays of 8):

| variant | per call site | recursion | `partitionM` sites | sort instructions vs `c5-he` |
|---|---|---|---|---|
| `c5-he` | 89,092 | 47,719 | 4 | |
| `shape-e` (equal test as `equalM`) | 84,478 | 39,430 (+3,059 `equalM`) | 2 | +0.0–0.15% |
| `shape-p` (no dead pivot branch) | 91,935 | 49,851 | 4 | |
| `shape-ep` | 86,750 | 41,406 | 2 | −0.0–0.05% |
| `shape-eh`, `shape-eph` (`hintOf`) | 83,721 / 85,004 | 37,979 / 39,346 | 2 | |
| `shape-epf` (shared last median) | 84,818 | 39,136 | 2 | |
| `shape-em` (`medianM` `@[specialize]`) | 75,889 | 26,032 (+4,498 `medianM`) | 2 | +1.1–4.4% (a pair allocated per median) |
| diagnostic: no pivot selection at all | 57,741 | 11,403 | 1 | not the algorithm |

So pivot selection is most of the recursion (about 28 of 39 KB after `shape-e`): twelve inlined comparisons with their index arithmetic, and it cannot be called instead of inlined without allocating its results (2–4% on random keys).

Applied: `shape-e`, commit 7d8ac86bab ("perf: keep one copy of the tail of the `Array.qsort` recursion").  Core: `Lean/Level.c`'s specialised recursion 45,818 → 37,754 bytes (+1,038 for `equalM`), `partitionM` call sites 4 → 2, per call site about 4.6 KB less C; `libleanshared.so` 249,818,424 → 249,621,984 (over master +3.25% → +3.17%).  Proof edits: `unfold equalM` before the `split` on the test in `sortM_sorted` and `sortM_cost`.  Builds; targeted ctest 79/79; full ctest the same 4 failures of 4705.  Instruction counts in `logs/shape-instr1/`, `logs/shape-instr2/`.
