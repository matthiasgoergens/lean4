# Pdq frame proofs (branch matthias/qsort-proofs, 2026-10-27)

Proofs in sorts/Sorts/PdqLemmas.lean, commits 83f710b..49544e8.  No definition in Pdq.lean changed, so the hash comparison was not needed; baseline-hashes.txt holds the pre-work run (sorttest 0 failures, pdq pair hashes at b7a090b) for whoever changes a definition later.  sorttest still passes at 49544e8.

lakefile: `lean_lib Sorts` had no Sorts.lean root, so `lake build Sorts` failed before this work; it now has `globs := #[.submodules `Sorts]`.

Technique notes for the sortedness proof:
- `fun_induction` works on every recursive function in Pdq.lean as written, including `sort` (structural on fuel); its cases come with the intermediate `let (v, ..) := if ..` results as equations `(if ..) = (v1, ..)`, and the goal already reduced.
- In loops that destructure a `scanUp`/`scanDown`/`scan` result, the goal keeps `match scan .. with`; `rw [heq]; simp only` reduces it.
- siftDown's induct equation for the child has `if h : ..` (dite with unused binder) where the goal has `ite`: `simp only [dite_eq_ite] at heq` before `rw [heq]`.
- partialInsertionSort.step's `let v := ..` become let-fvars v1 v2 v3 in the case; `simp only [v2]` unfolds one.
- `if_pos`/`dif_pos` are deprecated on v4.34.1; use `simp only [h, ↓reduceIte, ↓reduceDIte]`.
- qsort with hi < lo (or lo past the end) still calls sort on a one-element range, so getElem_qsort_of_not_mem needs `sort_of_le_succ` (sort of a range of at most one element is the identity), as PR 14658 does for core.

# Pdq sortedness proofs (same branch, 2026-10-27)

sorts/Sorts/PdqSorted.lean, commits beafed3..a110294.  Pdq.lean unchanged (git diff 49544e8 -- sorts/Sorts/Pdq.lean is empty), so no hash rerun was needed.  PdqLemmas.lean changed in proofs only: Frame gained a field `src` (each element of the range came from the range; Frame.holds transports any property of the range), and the three `frame_*_eq` helpers lost `private` so PdqSorted can use them.

Structure: `Lawful lt` bundles the two laws; `Sorted lt v a b` is the all-pairs statement.  Invariants: SinkInv (insertion sinks), HeapFrom/SiftInv (heap edges from a root on), scan_adj + Sorted.extend (partial insertion sort), LoopInv/Classified (partition), EqInv (partitionEqual), LeftBound (sort: nothing in v[a:b] less than v[a-1] when lo < a).  No right-end invariant is needed: the pieces are joined at the parent by Frame.holds.

Quirks met:
- fun_induction leaves the goal unreduced when the call sits under `.1` with dependent index proofs (`v[(scanUp ..).1]'_`); state such specs with `∀ k, (f ..).1 = k → .. v[k]` instead, and then `rw [heq] at ih; simp only at ih ⊢` works.
- `obtain ⟨-, ..⟩ := hp` silently cleared the IH, because omega-generated bound proofs inside the IH mention hp.  Use `hp.2.1` projections.
- After the limit update the recursive calls of sort use `l1`, not `limit`.
- `Pdq.qsortOrd xs =?= qsort xs ?lt` sends whnf into a timeout; give `lt` explicitly.
- `..` as trailing arguments to `insertionSort_sorted hlt ..` produced a goal `False`; use explicit `_`.

# Monadic pdq and the switch of qsort (same branch, 2026-10-27)

Commits ebfdec0 (monadic copies + Sorts/PdqMonadic.lean lockstep proofs) and 69c54a9 (qsort runs `Id.run (sortM (fun x y => pure ⟨lt x y⟩) ...)`; qsort_eq; the qsort theorems now `simp only [qsort_eq]` instead of `unfold qsort`, statements unchanged).

Verification of 69c54a9 (scripts in scripts/, raw output in runs/):
- sorttest: 120000 cases, 0 failures.
- hashes.sh (sorttest + `sorts pdq pair <pattern> 100000 0 nocheck` for the eight patterns of baseline-hashes.txt; N=100000 found by probing): identical to the baseline.
- perf.sh, cpu_core/instructions/u on CPU 6, three runs each (before = b7a090b-equivalent code at c1c77a1, binary sha256 8a2f8e06…; after = 69c54a9 code, d4caaf4b…):
  u64 2433078807 2432888577 2432882887 -> 2423324018 2421724609 2421818791 (-0.44%)
  nat 2405753627 2402411297 2405685884 -> 2395254068 2395251672 2398270335 (-0.35%)
  rec 4180228931 4180104540 4180206527 -> 4178576646 4177019653 4176791601 (-0.07%)
  Wall times in the "after" runs were much higher, but the laptop had load average ~27 from other lean jobs at the time; times from these runs mean nothing.

Technique notes for the lockstep proofs:
- Do not destructure proofs in `let ⟨⟨c, h1, h2⟩⟩ ← ...` patterns in the monadic code: the matcher then needs `And.intro` constructors and does not reduce on `by omega` proofs.  Bind `⟨⟨c, hc⟩⟩` and use `hc.1`; omega splits conjunctions in hypotheses.
- Non-recursive wrappers (partition): `dsimp only; generalize v.swap a pivot.1 _ _ = w`, rewrite the scan with its lockstep lemma and `pure_bind`, then `generalize partition.scanUp ... (by omega) ... = s; obtain ⟨i, ...⟩ := s` so both sides reduce.
- sortM's do block becomes a join point (`have __do_jp := ...`) for the `let (v, done) ← if ...`.  In sort's cases: `rw [sortM]; simp only [h12, hl, ↓reduceDIte, ↓reduceIte]; rw [e1]; dsimp only; rw [choosePivotM_id, pure_bind]; ...; split at e3`.  Plain `simp [*]` over the whole case normalises too much.
- `rw [qsort_eq]` fails under getElem (motive); `simp only [qsort_eq]` works.

# The comparison bound (same branch, 2026-10-27)

Commits 975939d (helper costs), 8d7939f (clog, potential, sortM_cost, qsortComparisons_le), 764d90a (#print axioms for every public theorem of PdqMonadic and PdqCost; none uses sorryAx).  Pdq.lean is unchanged since 69c54a9; the sorts binary at 764d90a has the same sha256 (d4caaf4b…) as the one measured above, hashes.sh still matches the baseline.

Statement: `Pdq.qsortComparisons as lt lo hi` (Sorts/PdqCost.lean) is qsort's call of sortM with the same arguments, run with `count lt` (StateM (ULift Nat), adds one per comparison) from 0.  `qsortComparisons_le`: ≤ 130 * (len * (log2 len + 1)) + 39 * len, len = clamped range length, any lt.

Proof shape: `Cost x P` = from every counter value s, x returns r and leaves s + k with P r k; bind/pure/mono/bind_count rules.  Helper bounds: insertion (b-a)^2, siftDown 2*(log2 hi - log2 (root+1)), heap 4*(L*log2 L), partial insertion 6L+4 (scans telescope to b - i, each of five rounds' two shifts ≤ L), pivot 12, partitions ≤ b - a (a round costs size - size' of the unexamined window, so loop(i, j) ≤ j + 2 - i).  Potential pot L limit bal ae = 18*(L*(clog L + limit + bal)) + (ae ? 0 : 9L) + 4*(L*log2 L) + 12L; clog L = if L ≤ 12 then 0 else clog (L - L/8) + 1 (both sides of a balanced partition are ≤ L - L/8; it is not ≤ 7L/8 for small L, e.g. L = 15).  Partition step: children's (clog + limit + bal) ≤ parent's minus one (balanced side via clog, unbalanced larger side via its limit decrement), freeing 18L ≥ W (≤ 7L+17) + 9L reserve for the children.  Equal-key step: paid by the parent's 9L reserve; the child has afterEqual = true and cannot do another.  clog L ≤ 6 log2 L + 6 from 7^k (L - 7) < 6*8^k → clog L ≤ k and 7^6*2 < 8^6.

Positive control (scratch/CountCheck.lean, output runs/count-check.txt): lt instrumented with a side-effecting counter (@[noinline] unsafeBaseIO) passed to the real Pdq.qsort, in the interpreter, agrees with qsortComparisons on every case tried (5 comparison functions incl. constant true/false and a pseudo-random one, n up to 5000, a subrange).  The first attempt counted 0 because the side effect was discarded; the noinline tick that returns its argument fixed it.  Observed counts are 40-150x below the bound (e.g. random keys n=5000: 58624 vs 8645000; lt = true: 198341).

Not proved: that the counting run returns qsort's result (a StateM lockstep); the link between the Id run and the counting run is that both are the same definition sortM instantiated at two monads, checked empirically above.

# Proofs about the monadic code only; pure copy deleted (same branch, 2026-10-27)

Commits 8142c0f (frames for every lawful monad), c5701c6 (sortedness at Id), 2d5a115 (pure comparing functions, their frame lemmas and Sorts/PdqMonadic.lean deleted; Adaptive and PdqLab adapted), 596ca76 (#print axioms for every theorem of PdqLemmas and PdqSorted; round lemmas renamed partitionM.round / partitionEqualM.round).

Route and why:
- `SatisfiesM P x` (Batteries' definition, `∃ x' : m {r // P r}, Subtype.val <$> x' = x`, written out in PdqLemmas because the project has no Batteries; core has no SatisfiesM, and Std.Do's WP needs a `WP m` instance, so it cannot state "for every monad"), with rules pure / trivial / mono / bind (needs LawfulMonad; uses Classical.choose) / bind_any, and at Id: run, of_run, and.
- Frames (PdqLemmas) are proved for every lawful monad and every `lt : α → α → m (ULift Bool)`: the frame property does not depend on what comparisons return, so stating it that way costs nothing (a comparison is `SatisfiesM.bind_any`) and covers qsort (Id) and the counting monad alike.  Frame proofs are now shaped exactly like the Cost proofs.
- Sortedness (PdqSorted) is at Id with `idLt lt := fun x y => pure ⟨lt x y⟩` (what qsort passes, up to the abbrev), still stated with SatisfiesM so that binds compose like in the frame and cost proofs (`SatisfiesM.bind_idLt` unfolds one comparison).  Not generic over monads: sortedness of a call needs the frame and the invariant of the same call together, and `SatisfiesM.and` holds at Id but not in every monad; making it generic would mean conjoining the frame into every sortedness postcondition.  Nothing needs it.
- Cost file unchanged apart from its header (its `Cost` predicate is already about the monadic code, and its bound is untouched).  Sharing more with SatisfiesM would need a StateM-specific bind rule anyway, so it was left alone.

Technique notes:
- fun_induction on a monadic function gives one case per control-flow path that is not under a bind, and IHs quantified over the values bound before the recursive call (`ih5 pivot pivot v4 mid hm`).  The comparisons' results are not in the context: `SatisfiesM.bind_any` / `bind_idLt`, then `split`.
- In a generic monad, `pure w >>= f` is not defeq to `f w`: `rw [pure_bind]` (at Id it is defeq).  The do-notation pushes `let v ← if .. then .. else pure v` continuations into both branches; state the remainder once as a `have rest : ∀ w, .. → SatisfiesM ..` and use it in each branch (partialInsertionSortM.step).
- sortM's big case: `refine SatisfiesM.bind_any fun ⟨(pivot, hint)⟩ => ?_; split; split` (the first split is the trivial ULift match, the second gives the equation for the reverse step), then `dsimp only` inlines the join point; `split; all_goals ..` as in the cost proof.
- A postcondition with a dependent index proof (`v[first + r.down.1]'(..)`) stops `fun ⟨⟨c, ..⟩⟩ h => ..` from substituting into `h`: state it as `∀ c, r.down.1 = c → ..` (the NOTES trick again) and destructure with `obtain` in tactic mode.
- PdqLab's `partitionM` shadows `Pdq.partitionM` inside `namespace PdqLab`: the adapted call says `Pdq.partitionM`.

Verification (raw output in runs/refactor/):
- `lake build Sorts sorts sorttest` clean (only the old `hlo` unused-variable warning in Adaptive.lean); sorttest 120000 cases, 0 failures.
- hashes.sh at 596ca76 (binary sha256 1663915d…): identical to baseline-hashes.txt.
- No sorry / axiom / native_decide; #print axioms of every theorem in PdqLemmas, PdqSorted, PdqCost shows at most propext, Classical.choice, Quot.sound.
- Statements of the eleven public theorems compared textually between 764d90a and HEAD: all the same.
- Instructions (cpu_core/instructions/u, CPU 6), before = 764d90a binary (bin/sorts-764d90a, d4caaf4b…) and after = 596ca76 (bin/sorts-596ca76), three shuffled rounds (scripts/perf2.sh; runs/refactor/perf.txt), median change:
  pdq u64 -0.002%, nat -0.008%, rec +0.000%;
  adaptive u64 -0.39%, nat -0.31%, rec -0.17% (Adaptive.sortRun now runs sortM at Id instead of the deleted pure sort; the same direction as pdq's own switch at 69c54a9).
  Load average was ~33 from other jobs; times from these runs mean nothing.

Production code touched: Pdq.lean lost the pure functions and gained their docs on the monadic ones (code of the monadic functions, qsort and qsortOrd unchanged: diff of the section is comments only); Adaptive.sortRun calls `Id.run (Pdq.sortM (fun x y => pure ⟨lt x y⟩) ..)` because `Pdq.sort` no longer exists.

Still not proved: that the counting run returns qsort's result.  The generic frames now say that every result of the counting run is a permutation that moves only the range, which is weaker.

# Insertion-sort cutoff 12 -> 24 (same branch, 2026-10-27)

Commit 570cfd7 (after a fast-forward to matthias/qsort at 603a0b9).  `Pdq.insertionCutoff : Nat := 24` in Pdq.lean, used by sortM.  Proofs: PdqLemmas' sortM_of_le_succ unfolds it (needs ≥ 1); PdqCost has `twelve_le_insertionCutoff` (by decide), and pot charges `insertionCutoff * L` instead of `12 * L`; only pot_top unfolds the value.  New bound: `qsortComparisons_le` ≤ 130 * (len * (log2 len + 1)) + 51 * len (51 = 18 + 9 + cutoff; was 39).  clog keeps base 12 (ranges reaching a partition now have L ≥ 25, so clog_step's 13 ≤ L holds).  Probe: with the value set to 32 only pot_top's omega fails; with 12 everything builds.

Verification (runs/cutoff24/): scripts/verify-port-cutoff24.sh (copy of verify-port.sh whose axiom regex accepts a lone [propext]: the old one counted 8 such lines in PdqLemmas/PdqSorted as foreign, a false alarm that predates this change; it also prints both statements when one differs): no gaps, 0 foreign axioms per file, ten statements same as 764d90a, qsortComparisons_le differs only in 39 -> 51; sorttest 120000 cases, 0 failures.  baseline-hashes-cutoff24.txt: pair hashes change for organ and tripledesc only.  runs/cutoff24/pdq-vs-lab.txt: `sorts pdq` and `sorts lab-c24` print the same hash on all eight patterns; lab-base reproduces the old cutoff-12 hashes.

Left alone: PdqLab's Config doc ("the defaults are pdq") is now stale, since its default cut is still 12; lab-base is cutoff-12 pdq.
