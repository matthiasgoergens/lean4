# Which in-place sort to give Lean's `Array.qsort`

Written before the first timed block, 2026-10-27.

**Question.**  Lean's `Array.qsort` is quadratic on many equal keys and on median-of-three-killer input (leanprover/lean4#8087).  Upstream wants a well-engineered sort from another language's library, proved correct.  The requirements here: in place, the existing interface (`lt`, inclusive `lo`/`hi`), no regression on random distinct keys, and ideally adaptivity to existing runs.  The first round measures pattern-defeating quicksort (`Pdq.qsort`, which makes the same permutation as Go's `slices.SortFunc` on every input checked) against the current `qsort`, against lean4 PR 14653's three-way partitioning, and against core's `Array.mergeSort`.  `Array.mergeSort` is not in place: it is here as the merge-sort family's representative, and to show what stability and allocation cost.

**Estimand.**  For each element type, pattern and size, the geometric mean over blocks of the paired ratio of in-process sort time (the `ns=` the harness prints, timed around the sort alone), candidate over current `qsort`, with a 95% t interval on the log ratios.  Also pdq over each of the others.  Whole-process CPU time is recorded too, but not analysed.

**Units and nuisances.**  One process per measurement, pinned to one CPU; every block runs every cell once, in a fresh random order (`bench/run.py`); 10 blocks.  The box is shared, and its load is recorded per run.

**Cells.**  Algorithms `core`, `threeway`, `merge` and `pdq`; types `nat` (unboxed), `str` (strings, so comparisons cost more) and `u64` (boxed, through `Ord`, the path Lean's `io_compute` benchmark takes); the 13 patterns of `Main.lean`, at n = 100,000.  Plus random keys at n = 1,000,000 for `nat` and `str`, and the gate case: random `UInt64` at n = 6,250,000 through `qsortOrd`, as `io_compute` sorts them.  Go's `slices.SortFunc` on `nat` at n = 100,000 for context: it is a different language, not a candidate.

**What matters.**  On random distinct keys, a regression over 5% would show in upstream's benchmark (it has blocked a PR at 39%), so that is the margin: a candidate is acceptable there if its interval's upper end is below 1.05.  On the quadratic patterns, anything that stops being quadratic wins by orders of magnitude, and the point is only to confirm it.  Everything else is exploratory, and labelled so.

**Correctness.**  Every run checks its result against `Array.mergeSort` on a fresh copy of the input and exits non-zero on a mismatch; the identity "sort" fails that check (negative control).

## Round two

Written before its first block, while round one was still running; the partial results of round one and a rough local run had shown that the adaptive front end wins on a few long runs and loses heavily on 16 perfectly interleaved runs of integers.

**Question.**  Where does the natural-run front end (`adaptive`) pay for itself over pattern-defeating quicksort alone (`pdq`), and where does it cost?

**Estimand.**  Per workload, the paired ratio adaptive / pdq of in-process sort time, as in round one; merge / pdq for reference.

**Cells.**  `pdq`, `adaptive` and `merge`; `nat` and `str`; round one's 13 patterns plus `runs4`, `runs64`, `runs256` (perfectly interleaved runs, the worst case for rotation merges) and `blocks2`, `blocks16`, `blocks256` (sorted blocks of random values, as from concatenated sorted batches), `headsqrt` (a sorted head of √n values, then random ones), at n = 100,000; the run-structured patterns and random also at n = 1,000,000.  The gate case with `core`, `pdq` and `adaptive`; round one gave `pdq` there the comparator `compare x y == .lt`, which calls `instDecidableEqOrdering` on every comparison where core's `qsortOrd` inlines `(compare x y).isLT`, and `Pdq.qsortOrd` now uses the latter.  Current `qsort` is otherwise left out: it is quadratic on several of these patterns.  10 blocks.

**What matters.**  On random input and at the gate, the same 5% margin as round one, now against pdq.  Beyond that the result is a map of gains and losses, for a judgement on whether the front end is worth its proof cost; no threshold is fixed in advance.

## Round three

Written before its first block.  Round two showed the general front end (`adaptive`) winning with a few long runs and losing up to about 3× with many runs (16 to 256 sorted blocks of random values), and on a sorted head of √n.  That suggested trusting only a handful of long runs: `fewruns4` and `fewruns8` (`Adaptive.qsortK 4` and `8`, at most 4 or 8 runs of at least a quarter or an eighth of the range, everything else sorted by one call of `Pdq.sort`), and `onerun` (`k = 1`, only a range that is already one run, as Rust's ipnsort checks).

**Hypotheses, from round two's data and so tested here on fresh runs.**  (1) `fewruns4` is within 5% of `pdq` (interval inside [0.95, 1.05]) on every pattern without at most four long runs: random, the equal-key patterns, pathological, tripledesc, ninther, runs16 and up, blocks16 and up, headsqrt.  (2) `fewruns4` is below 0.7 of `pdq` on runs2, runs4, blocks2, organ and sortedtail.  (3) `onerun` is within 5% of `pdq` everywhere except sorted and reversed input, where it may be faster.

**Cells.**  `pdq`, `onerun`, `fewruns4`, `fewruns8`, `adaptive`, `merge`; types `nat`, `str`, `rec` (a structure sorted by a `Nat` field) and `u64`; 21 patterns at n = 100,000; 13 patterns at n = 1,000,000 for `nat` and `rec`; many small arrays (1,000,000 elements as arrays of 8, 32, 256 and 4,096) for `nat` on random, sorted and dups4, with `core`; random `nat` at n = 10,000,000 and the gate case, with `core`.  10 blocks.

**Also reported.**  `pdq` against `core` wherever both ran (random keys at each size, the small arrays, the gate), with the 5% margin of round one.

**Deviation.**  Stopped after 6 of the 10 blocks, at Matthias's request to spend less time on the benchmark, before any of its data had been looked at; the analysis uses the 6 complete blocks and leaves out the partial seventh.

## Round four

Written before it ran.  Rounds two and three put pdq 3–7% behind core in wall time at the gate case, although it executes about 19% fewer instructions in the sort (`logs/2026-10-27/qsort-gate-perf`).  A one-run profile on the busy box gave pdq's sort about 20% more samples than core's.  The two inner loops do the same work per element in the generated C, so the suspects are the partition scheme (pdq scans from both ends, core in one direction) and the insertion-sort cutoff.

**Cells.**  `core`, `pdq`, and `PdqLab` with the cutoff at 12 (`lab-base`, pdq itself through the lab copy, a control) or 24 (`lab-c24`), each with pdq's two-ended partition or a one-directional one (`lab-lomuto`, `lab-lomuto-c24`); random keys only: the gate case, and 1,000,000 `nat` and `rec`.  Unchecked runs; the analysis requires equal hashes across algorithms.  10 blocks; exploratory, to choose what to change.

**Deviation.**  The first attempt was stopped in block 6 because the box's load had risen to 70–100 (intervals ±50%); it is kept in `logs/2026-10-27/qsort-round4-loaded` and the round is rerun when the load is back near its usual 25.

## Round five

Written before it ran.  Round four (load 35–45, 10 blocks) put the lab variant with a one-directional partition and an insertion-sort cutoff of 24 (`lab-lomuto-c24`) 5–12% ahead of core on random keys (gate case 0.954 [0.938, 0.971]), where pdq was level or behind; pdq and `lab-base`, the same algorithm through two copies of the code, differed by 4% at the gate, which is a measure of code-layout effects on that case.

**Question.**  Does `lab-lomuto-c24` regress against pdq on any pattern, type or size?  `lab-c24` (the cutoff alone) separates the two changes.

**Cells.**  `pdq`, `lab-lomuto-c24`, `lab-c24`, unchecked (hashes compared across algorithms); round three's 21 patterns at n = 100,000 for `nat`, `str`, `rec` and `u64`; 8 patterns at n = 1,000,000 for `nat` and `rec`; arrays of 8, 32 and 256 random or sorted elements (1,000,000 in all), and the gate case, both also with `core`.  Run as 6 parallel shards (`shards.py`) on distinct physical cores, 2 blocks each: 12 blocks.

**What matters.**  A regression is a ratio over pdq whose interval lies above 1.05.  Exploratory beyond that.

## Round six

Written before it ran.  Rounds four and five disagreed at the gate case by more than their intervals (`lab-lomuto-c24` 0.95× core in round four, about 1.05× in round five, between which the binary changed), and pdq and `lab-base` differed by 4% there while running the same algorithm: code layout, which one binary fixes for every run.  This round samples it: 8 builds of the same sources, each linked with a different shuffled function order (`shuffled-build.sh`), and every run picks one at random (`shuffled.sh`), so layout becomes part of the variance instead of a bias.

**Question.**  With layout sampled, how do `core`, `pdq`, `lab-c24` and `lab-lomuto-c24` compare on random keys (the gate case, 1,000,000 `nat` and `rec`, 100,000 `str`), and do `lab-c24`'s regressions on sorted and constant `u64` and `lab-lomuto-c24`'s on runs16 and nearly sorted `nat` hold?

**Design.**  6 parallel shards on CPUs 20–25, 2 blocks each (12 blocks).  Unchecked runs; hashes compared across algorithms.  Exploratory.

## Round seven

Written before it ran.  Round six, with layout sampled, confirmed that raising the insertion-sort cutoff from 12 to 24 helps on random keys without the regressions round five showed on sorted and constant `u64` (those were layout), while the one-directional partition keeps its 1.3–1.4× losses on interleaved runs and nearly sorted input.  24 was a guess; this round sweeps 16, 20, 24, 32 and 48 against pdq (12) and core, with layout sampled as in round six: random keys (the gate case, `nat`, `rec`, `str`), arrays of 32, and four patterns where small ranges are frequent.  6 shards, 2 blocks each.  Exploratory, to choose the cutoff.

## Round eight

Written before it ran.  pdq takes 3–8% longer than core on random boxed `UInt64` (rounds four to six) while executing about 19% fewer instructions in the sort; one profile put the extra cycles in the partition loops.  Each lab variant changes one suspect: the insertion-sort cutoff (`lab-c24`), Tukey's ninther (`lab:m3`, median of three only), the partial insertion sort the smaller side of every partition may try (`lab:nochild`), all three (`lab:c24,m3,nochild`), and the partition scheme (`lab-lomuto`, `lab-lomuto-c24`).

**Measure.**  The box's load reached 200 on 128 hardware threads, at which wall time puts the time a descheduled run waits into single runs.  So this round's estimand is CPU time (user + sys from run.py's `wait4`): every cell does identical work apart from the sort (same input, `nocheck`), and a `none` cell in every block gives the baseline, so CPU(algo) − CPU(none) within a block is the sort's CPU time (`analyse_cpu.py`).  Ratios to core, geometric means over blocks with t intervals.  Layout sampled as in round six; 6 shards on CPUs 20–25, 2 blocks each.  Exploratory, to find the cause.

## Round nine

Written before it ran.  Round eight (CPU time, layout sampled) found the partition scheme to be what closes the gap to core at the gate case: the one-directional partition with cutoff 24 reached 0.98 [0.95, 1.01] of core there (diluted towards 1 by the common cost of freeing the sorted array at exit) and 0.91 on random `nat`, while the cutoff, median-of-three and child knobs helped on `nat` only.  But that partition loses 1.3–1.4× on interleaved runs and nearly sorted input (rounds five and six).  `lab:hyb` uses it only where the pivot sample did not look ascending, and pdq's two-ended partition where it did.

**Question.**  Does `lab:hyb` (and `lab:hyb,c24`) keep the one-directional partition's gain on random keys without its losses on runs4/16/64, nearly sorted, organ pipe, sorted-plus-tail and the rest?

**Design.**  `none`, `core`, `pdq`, `lab:hyb`, `lab:hyb,c24`, `lab-lomuto-c24`; random keys (the gate case, 1,000,000 `nat` and `rec`) and 11 patterns at 100,000 for `nat` and `rec` (core left out of those, where it can be quadratic).  Layout sampled; 6 shards on CPUs 20–25, 2 blocks each.  Wall time and CPU time both analysed.  Exploratory.

**Round seven, rerun.**  Started after round nine, on the same cores, with the load at about 8; the binaries are round nine's (whose lab parses the same `lab-cNN` names).

## Round ten

Written before it ran.  Round nine: the one-directional partition closes the gate gap but loses 1.2–1.7× on interleaved runs on this box, and choosing it by the pivot sample's hint (`lab:hyb`) does not route those ranges away from it.  On the laptop (Intel; the box is AMD) the same partition showed no loss on interleaved runs, which points at branch prediction.  Two candidates remove the comparison's branch: the branch-free one-directional loop (`bl`, as Rust's unstable sort partitions) and a block partition (`block`, BlockQuicksort); a first laptop look at `block` was discouraging.  All candidates with cutoff 24: `lab-c24` (pdq's scan), `lab:lomuto,c24`, `lab:lomuto,bl,c24`, `lab:block,c24`, `lab:hyb,bl,c24`; plus `none`, `pdq`, and `core` on random keys.  Random keys (the gate case, 1,000,000 `nat` and `rec`) and runs4/16/64, nearly sorted, organ pipe, sorted-plus-tail and the ninther killer at 100,000 for `nat` and `rec`.  Layout sampled; 6 shards, 2 blocks each; wall time and CPU time.  Exploratory.

**After round ten.**  Production pdq's insertion-sort cutoff is now 24 (`Pdq.insertionCutoff`), so `lab-base` (cutoff 12) is no longer the same as `pdq` in rounds run from here on; `lab-c24` is.

## Round eleven

Written before it ran.  Confirmatory: production pdq, now with an insertion-sort cutoff of 24 (commit 6527464), against core on random keys: the gate case, and 1,000,000 `nat`, `rec` and `str`.  `none` in every workload.  Layout sampled; 6 shards on CPUs 20–25, 3 blocks each (18 blocks).  Primary: wall-time ratio pdq / core per workload with its interval; CPU-time ratio alongside.  The margin of round one applies: pdq is not slower if the interval's upper end is below 1.05.  Rounds four to six put pdq with cutoff 12 at 1.03–1.10 at the gate, and rounds five to nine put the cutoff of 24 at a 3–9% gain on random keys.  The Stabilizer overhead study found session-to-session differences larger than one session's interval, so a single round's interval is read as a lower bound on the uncertainty.

**Round eleven, deviation.**  It ran at a load of 157–243 (median 211), which oversubscribes the box; its result (pdq 0.78–0.91 of core) is kept in `logs/2026-10-27/qsort-round11` as a measurement of that condition, and the round is rerun as planned when the load is low.

## Round twelve

Written before it ran, and before the reviews of the partition research had reported.  The research (notes in `research/partition/`, branch `matthias/qsort-partition`, merged) found why one-directional partitions lost on interleaved runs (a self-similar bad pivot that pdq's pattern breaking, which disturbs only the middle ninther group, cannot escape) and two candidates: `lab:lomuto,ends,c24,brk9` and the same with `nochild`, measured at about 0.75 of pdq's wall time at the gate case and 0.42 on random `nat`, with weak cells on runs5, nearly sorted and the ninther killer.  This round confirms on the main cores, on fresh runs and more shapes.

**Cells.**  `pdq` (production, cutoff 24) and both candidates on round three's 21 patterns plus the ninther killer and runs5/6/8/12, at 100,000, for `nat`, `rec`, `u64` and `str`; six of them also at 1,000,000 for `nat`; arrays of 8, 32 and 256 (1,000,000 elements) and random keys (the gate case, 1,000,000 `nat`, `rec`, `str`), both also with `core`; `none` on the random keys.  Layout sampled; 6 shards on CPUs 20–25, 3 blocks each (18 blocks).  Wall time primary; CPU time alongside where `none` exists.

**Decision rule, fixed now.**  A candidate qualifies if (a) at the gate case its wall-time interval against core lies below 1.00, and (b) no workload's interval against pdq lies above 1.15 (a regression larger than 15% that the data cannot explain away).  If both qualify, the one with the lower geometric mean of ratios to pdq over all workloads is adopted; if neither qualifies, production stays pdq with cutoff 24 and the candidate becomes a follow-up.  Separately, any finding from the two reviews that shows a correctness problem overrides this rule.
