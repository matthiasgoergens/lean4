import Sorts.Pdq

/-!
A laboratory copy of `Pdq.sortM` for timing variants, not for use; `Config` says what differs.
-/

namespace PdqLab

open Pdq

variable {α : Type} {n : Nat}

/-- What a lab variant changes against pdq.  The defaults are pdq as it was with an insertion-sort
cutoff of 12 (production pdq now uses `Pdq.insertionCutoff`, 24, the same as `cut := 24`). -/
structure Config where
  /-- Ranges up to this length (at least 12) are insertion-sorted. -/
  cut : Nat := 12
  /-- A one-directional partition in the style of core's `Array.qsort` instead of the two-ended
  one. -/
  lomuto : Bool := false
  /-- The one-directional partition only where the pivot sample did not look ascending; pdq's
  two-ended partition where it did. -/
  hybrid : Bool := false
  /-- The branch-free one-directional partition except where 8 sampled adjacent pairs are all in
  order (`locallySorted`), where pdq's two-ended partition keeps the runs. -/
  pairs : Bool := false
  /-- With `lomuto` or `hybrid`: the branch-free one-directional partition. -/
  branchless : Bool := false
  /-- The block partition (`blockPartition`) instead of the scalar two-ended one. -/
  block : Bool := false
  /-- The median of three candidates always, never Tukey's ninther. -/
  median3 : Bool := false
  /-- Whether the smaller side of a partition may try the partial insertion sort first (pdq: yes,
  it starts as "balanced and partitioned"). -/
  childTries : Bool := true
  /-- pdq's two-ended partition one step at a time without branching on the comparisons
  (`hoareBranchless`), instead of the scalar scans. -/
  hoareBl : Bool := false
  /-- After an unbalanced partition, swap pseudo-random elements into all three groups the ninther
  samples (`breakPatterns9`), not only the middle one. -/
  brk9 : Bool := false
  /-- With `branchless`: `lomutoBranchless2` (a branchy scan of the leading less elements, then
  the branch-free loop without the "already partitioned" bookkeeping). -/
  lean2 : Bool := false
  /-- With `branchless`: `lomutoEnds` (pdq's scans from both ends first, the branch-free loop only
  between the first misplaced pair). -/
  ends : Bool := false
  /-- The partial insertion sort of Orson Peters's C++ pdqsort (`partialInsertionSort8`: gives up
  once the elements moved have travelled more than 8 positions in total) instead of Go's (gives up
  after moving 5 elements, each as far as it needs to go). -/
  pis8 : Bool := false
  /-- pdq's two-ended partition right after a partial insertion sort was tried and failed: an
  order-keeping partition leaves children that look ascending without being nearly sorted, and
  the two-ended one scrambles that order. -/
  hybp : Bool := false
  /-- `partialInsertionSortX`: Go's partial insertion sort, which also gives up at a descent between
  two ordered blocks rather than at an isolated misplaced element. -/
  pisx : Bool := false
  /-- With `ends`: where the 16 elements just inside each end scan rarely change side (at most 3
  flips of "less than the pivot" in all), continue with pdq's two-ended loop, whose branches will
  be predicted, instead of the branch-free loop (`lomutoEndsPred`). -/
  pred : Bool := false
  /-- With `pred`: the most flips that still choose pdq's loop. -/
  predMax : Nat := 3
  /-- With `pisx`: how far from the descent the test compares, `w`: `v[i+w] < v[i-1-w]`.  With 6,
  six elements on each side are mutually inverted (for ascending blocks), and since one move of the
  partial insertion sort repairs at most one element on each side, five moves cannot succeed. -/
  pisWidth : Nat := 1

/-- The median of the candidates at a quarter, a half and three quarters of `v[a:b]`, with the
same hint as `Pdq.choosePivotM` (ascending: no pair out of order; descending: all three). -/
@[inline] def median3Pivot (lt : α → α → Bool) (v : Vector α n) (a b : Nat) (hab : a < b)
    (hb : b ≤ n) : Idx a b × Hint :=
  if h8 : 8 ≤ b - a then
    let ⟨(j, swaps)⟩ := Id.run (medianM (fun x y => pure ⟨lt x y⟩) v hb
      ⟨a + (b - a) / 4, by omega⟩ ⟨a + (b - a) / 4 * 2, by omega⟩ ⟨a + (b - a) / 4 * 3, by omega⟩ 0)
    (j, if swaps == 0 then .increasing else if swaps == 3 then .decreasing else .unknown)
  else (⟨a + (b - a) / 4 * 2, by omega⟩, .increasing)

/-- Partitions `v[a:b]` around `v[pivot]` with one scan from the left, with the same result
contract as `Pdq.partitionM`; "already partitioned" means no element had to move. -/
@[specialize] def lomutoPartition (lt : α → α → Bool) (v : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) : Vector α n × Idx a b × Bool :=
  let v := v.swap a pivot.1 (by omega) (by omega)
  loop v[a] v (a + 1) (a + 1) true (by omega) (by omega) (by omega)
where
  @[specialize] loop (p : α) (v : Vector α n) (i k : Nat) (still : Bool) (h1 : a < i) (h2 : i ≤ k)
      (h3 : k ≤ b) : Vector α n × Idx a b × Bool :=
    if h : k < b then
      if lt v[k] p then
        loop p (v.swap i k (by omega) (by omega)) (i + 1) (k + 1) (still && i == k) (by omega)
          (by omega) (by omega)
      else loop p v i (k + 1) still h1 (by omega) (by omega)
    else (v.swap a (i - 1) (by omega) (by omega), ⟨i - 1, by omega, by omega⟩, still)
  termination_by b - k



/-- `lomutoPartition` without a branch on the comparison: every step swaps `v[i]` and `v[k]` and
advances `i` by the comparison's result (if `v[k]` was not less than the pivot, the swap only
permutes elements of `[i, k]`, all not less), as Rust's unstable sort partitions. -/
@[specialize] def lomutoBranchless (lt : α → α → Bool) (v : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) : Vector α n × Idx a b × Bool :=
  let v := v.swap a pivot.1 (by omega) (by omega)
  loop v[a] v (a + 1) (a + 1) true (by omega) (by omega) (by omega)
where
  @[specialize] loop (p : α) (v : Vector α n) (i k : Nat) (still : Bool) (h1 : a < i) (h2 : i ≤ k)
      (h3 : k ≤ b) : Vector α n × Idx a b × Bool :=
    if h : k < b then
      let c := lt v[k] p
      let v := v.swap i k (by omega) (by omega)
      loop p v (i + if c then 1 else 0) (k + 1) (still && (i == k || !c)) (by split <;> omega)
        (by split <;> omega) (by omega)
    else (v.swap a (i - 1) (by omega) (by omega), ⟨i - 1, by omega, by omega⟩, still)
  termination_by b - k

/-- How far `hoareBranchless` moves `i` and `j` after comparing `v[i]` (`c1`: less) and `v[j]`
(`c2`: less): `i` unless both were not less, `j` unless both were less; at least one moves.  Each
amount is a choice between two small constants, which the C compiler turns into a select rather
than a branch (`&&`, `||` and `Bool.toNat` compile to branches and a call). -/
@[inline] def stepAmounts (c1 c2 : Bool) :
    {d : Nat × Nat // 1 ≤ d.1 + d.2 ∧ d.1 ≤ 1 ∧ d.2 ≤ 1} :=
  let n2 : Nat := if c2 then 1 else 0
  let m2 : Nat := if c2 then 0 else 1
  ⟨(if c1 then 1 else n2, if c1 then m2 else 1), by cases c1 <;> cases c2 <;> decide⟩

/-- The index to swap with `i`: `j` when `v[i]` is not less (`c1` false) and `v[j]` is (`c2`),
else `i` itself, so that the swap changes nothing.  Computed as `i + s * (j - i)` with `s` a choice
between constants: choosing between `i` and `j` themselves compiles to a branch, because each arm
takes its own reference. -/
@[inline] def swapTarget (c1 c2 : Bool) (i j : Nat) (h : i ≤ j) : {k : Nat // k = i ∨ k = j} :=
  ⟨i + (if c1 then 0 else if c2 then 1 else 0) * (j - i), by
    cases c1 <;> cases c2 <;> simp <;> omega⟩

/-- `Pdq.partitionM`'s two-ended partition one step at a time, without a branch on the
comparisons: each step compares `v[i]` and `v[j]` with the pivot, swaps them when `v[i]` is not
less and `v[j]` is less (otherwise it swaps `v[i]` with itself), then moves `i` up if `v[i]` is now
less and `j` down if `v[j]` is now not less.  `[a+1, i)` stays less than the pivot and `(j, b)` not
less, as in `Pdq.partitionM`, and the pairs swapped are the same: the k-th element not less from
the left with the k-th less from the right.  So the result is `Pdq.partitionM`'s. -/
@[specialize] def hoareBranchless (lt : α → α → Bool) (v : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) : Vector α n × Idx a b × Bool :=
  let v := v.swap a pivot.1 (by omega) (by omega)
  loop v[a] v (a + 1) (b - 1) true (by omega) (by omega) (by omega)
where
  @[specialize] loop (p : α) (v : Vector α n) (i j : Nat) (still : Bool) (h1 : a < i)
      (h2 : i ≤ j + 1) (h3 : j < b) : Vector α n × Idx a b × Bool :=
    if h : i < j then
      let c1 := lt v[i] p
      let c2 := lt v[j] p
      let ⟨k, hk⟩ := swapTarget c1 c2 i j (by omega)
      let v := v.swap i k (by omega) (by omega)
      let ⟨(di, dj), hd⟩ := stepAmounts c1 c2
      loop p v (i + di) (j - dj) (still && k == i) (by simp at hd; omega) (by simp at hd; omega)
        (by omega)
    else
      -- At most one element is left unexamined, at `i = j`.
      let i := if h' : i = j then (if lt v[i] p then i + 1 else i) else i
      have : a < i ∧ i ≤ b := by dsimp only [i]; split <;> (try split) <;> omega
      (v.swap a (i - 1) (by omega) (by omega), ⟨i - 1, by omega, by omega⟩, still)
  termination_by j + 1 - i

/-- `Pdq.breakPatterns` over all three groups the ninther samples (around a quarter, a half and
three quarters of `v[a:b]`), not only the middle one: a partition that keeps the order of the
elements on one side, like the one-directional ones, can leave a range whose samples sit at the
same places in its structure as before, so that the next pivot is as bad as the last. -/
def breakPatterns9 (v : Vector α n) (a b : Nat) (hb : b ≤ n) : Vector α n :=
  if h50 : 50 ≤ b - a then go v 1 0 (b - a).toUInt64 h50 else breakPatterns v a b hb
where
  go (v : Vector α n) (g t : Nat) (r : UInt64) (h50 : 50 ≤ b - a) : Vector α n :=
    if hg : g ≤ 3 then
      if ht : t < 3 then
        let r := Pdq.xorshift r
        have := Nat.mod_lt r.toNat (show b - a > 0 by omega)
        have : (b - a) / 4 * g ≤ (b - a) / 4 * 3 := Nat.mul_le_mul_left _ hg
        go (v.swap (a + (b - a) / 4 * g - 1 + t) (a + r.toNat % (b - a)) (by omega) (by omega))
          g (t + 1) r h50
      else go v (g + 1) 0 r h50
    else v
  termination_by (4 - g, 3 - t)

/-- The branch-free one-directional loop on `[k, b)` with `[a+1, i)` less than `p` and `[i, k)` not
less (`i < k`: at least one element not less has been seen): swaps `v[i]` and `v[k]` every step and
moves `i` by the comparison's result.  Returns the array and the final `i`. -/
@[specialize] def bfLoop (lt : α → α → Bool) (a b : Nat) (hb : b ≤ n) (p : α) (v : Vector α n)
    (i k : Nat) (h1 : a < i) (h2 : i < k) (h3 : k ≤ b) :
    {r : Vector α n × Nat // a < r.2 ∧ r.2 ≤ b} :=
  if h : k < b then
    let c := lt v[k] p
    let v := v.swap i k (by omega) (by omega)
    bfLoop lt a b hb p v (i + if c then 1 else 0) (k + 1) (by split <;> omega)
      (by split <;> omega) (by omega)
  else ⟨(v, i), h1, by omega⟩
termination_by b - k

/-- `lomutoBranchless` with less work per element: a scan first finds the first element `f` not
less than the pivot (branchy, but the branch is taken once), then the branch-free loop runs from
`f` with `[a+1, i)` less and `[i, k)` not less, without tracking whether anything moved: the range
was already partitioned exactly when no less element came after `f`, that is when `i` ends at `f`.
Same result as `lomutoBranchless`. -/
@[specialize] def lomutoBranchless2 (lt : α → α → Bool) (v : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) : Vector α n × Idx a b × Bool :=
  let v := v.swap a pivot.1 (by omega) (by omega)
  let p := v[a]
  let ⟨f, hf⟩ := first p v (a + 1) (by omega) (by omega)
  if h : f < b then
    let ⟨(v, i), hi⟩ := bfLoop lt a b hb p v f (f + 1) (by omega) (by omega) (by omega)
    (v.swap a (i - 1) (by omega) (by omega), ⟨i - 1, by omega, by omega⟩, i == f)
  else (v.swap a (f - 1) (by omega) (by omega), ⟨f - 1, by omega, by omega⟩, true)
where
  /-- The first `k' ≥ k` with `v[k']` not less than `p`, or `b`. -/
  @[specialize] first (p : α) (v : Vector α n) (k : Nat) (h1 : a < k) (h2 : k ≤ b) :
      {k' : Nat // a < k' ∧ k' ≤ b ∧ k ≤ k'} :=
    if h : k < b then
      if lt v[k] p then
        let ⟨k', h'⟩ := first p v (k + 1) (by omega) (by omega)
        ⟨k', h'.1, h'.2.1, by omega⟩
      else ⟨k, h1, h2, Nat.le_refl _⟩
    else ⟨k, h1, h2, Nat.le_refl _⟩
  termination_by b - k

/-- pdq's first scans from both ends, then the branch-free one-directional loop only on what lies
between: `scanUp` stops at the first `i` with `v[i]` not less than the pivot, `scanDown` at the last
`j` with `v[j]` less; if they meet, the range was already partitioned; otherwise
`bfLoop` partitions `[i, j]` (starting with `v[i]` not less), which leaves `[a+1, i')`
less and `[i', b)` not less.  On presorted ranges the scans cover most of the range with
well-predicted branches and no writes. -/
@[specialize] def lomutoEnds (lt : α → α → Bool) (v : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) : Vector α n × Idx a b × Bool :=
  let v := v.swap a pivot.1 (by omega) (by omega)
  let p := v[a]
  let ⟨⟨i, hi⟩⟩ := Id.run (Pdq.partitionM.scanUp (fun x y => pure ⟨lt x y⟩) a b pivot hb p v (a + 1) (b - 1)
    (by omega) (by omega) (by omega))
  let ⟨⟨j, hj⟩⟩ := Id.run (Pdq.partitionM.scanDown (fun x y => pure ⟨lt x y⟩) a b pivot hb p v i (b - 1)
    hi.1 (by omega) (by omega))
  if h : i < j then
    let ⟨(v, i'), hi'⟩ := bfLoop lt a (j + 1) (by omega) p v i (i + 1) (by omega) (by omega)
      (by omega)
    (v.swap a (i' - 1) (by omega) (by omega), ⟨i' - 1, by omega, by omega⟩, false)
  else (v.swap j a (by omega) (by omega), ⟨j, by omega⟩, true)

/-- Insertion sort of `v[a:b]` that gives up once the elements moved have travelled more than 8
positions in total, as `partial_insertion_sort` in Orson Peters's C++ pdqsort: returns whether
`v[a:b]` ended up sorted. -/
@[specialize] def partialInsertionSort8 (lt : α → α → Bool) (v : Vector α n) (a b : Nat)
    (hb : b ≤ n) : Vector α n × Bool :=
  outer v (a + 1) 0
where
  /-- Moves `v[j]` down while it is less than its left neighbour, not below `a`; counts the
  moves in `moved`. -/
  @[specialize] sink (v : Vector α n) (j moved : Nat) (hj : j < n) : Vector α n × Nat :=
    if h : a < j then
      if lt v[j] v[j - 1] then sink (v.swap j (j - 1)) (j - 1) (moved + 1) (by omega)
      else (v, moved)
    else (v, moved)
  @[specialize] outer (v : Vector α n) (i moved : Nat) : Vector α n × Bool :=
    if h : i < b then
      let (v, moved) := sink v i moved (by omega)
      if moved > 8 then (v, false) else outer v (i + 1) moved
    else (v, true)
  termination_by b - i

/-- `Pdq.partialInsertionSortM` (Go's), except that it also gives up, before moving anything, at a
descent `v[i] < v[i-1]` whose neighbours are inverted too (`v[i+1] < v[i-2]`): that is the boundary
between two ordered blocks (interleaved runs, or a run left in order by a one-directional partition),
which five moves cannot repair, whereas an isolated misplaced element leaves `v[i-2] ≤ v[i+1]`. -/
@[specialize] def partialInsertionSortX (lt : α → α → Bool) (w : Nat) (v : Vector α n) (a b : Nat)
    (hab : a < b) (hb : b ≤ n) : Vector α n × Bool :=
  step v (a + 1) 0 (by omega) (by omega)
where
  @[specialize] step (v : Vector α n) (i steps : Nat) (h1 : a < i) (h2 : i ≤ b) :
      Vector α n × Bool :=
    if steps < 5 then
      let ⟨⟨i, hi⟩⟩ := Id.run (Pdq.partialInsertionSortM.scan (fun x y => pure ⟨lt x y⟩) a b hb v
        i h1 h2)
      if h : i = b then (v, true)
      else if b - a < 50 then (v, false)
      else if (if hblk : a + 1 + w ≤ i ∧ i + w < b then lt v[i + w] v[i - 1 - w] else false) then
        (v, false)
      else
        let v := v.swap i (i - 1) (by omega) (by omega)
        let v := if hl : 2 ≤ i - a then
          Id.run (Pdq.partialInsertionSortM.sinkLeft (fun x y => pure ⟨lt x y⟩) a b hb v (i - 1)
            (by omega)) else v
        let v := if 2 ≤ b - i then
          Id.run (Pdq.partialInsertionSortM.riseRight (fun x y => pure ⟨lt x y⟩) a b hb v (i + 1)
            (by omega)) else v
        step v i (steps + 1) hi.1 hi.2
    else (v, false)
  termination_by 5 - steps

/-- How often "less than `p`" changes between neighbours in `v[s:e)` (`flips`, counted from the
side `prev` of the element before `s`). -/
@[specialize] def flips (lt : α → α → Bool) (p : α) (v : Vector α n) (s e : Nat) (he : e ≤ n)
    (prev : Bool) (acc : Nat) : Nat :=
  if h : s < e then
    let c := lt v[s] p
    flips lt p v (s + 1) e he c (acc + if c == prev then 0 else 1)
  else acc
termination_by e - s

/-- `lomutoEnds`, except that a middle `[i, j]` of at least 64 elements whose 16 elements at each
end (`v[i:i+16)` and `v(j-16:j]`) flip side at most 3 times in all goes to `Pdq.partitionM`'s loop (branchy, but predictable
on such blocky input, and writing only misplaced pairs) instead of the branch-free loop. -/
@[specialize] def lomutoEndsPred (lt : α → α → Bool) (maxFlips : Nat) (v : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) : Vector α n × Idx a b × Bool :=
  let v := v.swap a pivot.1 (by omega) (by omega)
  let p := v[a]
  let ⟨⟨i, hi⟩⟩ := Id.run (Pdq.partitionM.scanUp (fun x y => pure ⟨lt x y⟩) a b pivot hb p v (a + 1)
    (b - 1) (by omega) (by omega) (by omega))
  let ⟨⟨j, hj⟩⟩ := Id.run (Pdq.partitionM.scanDown (fun x y => pure ⟨lt x y⟩) a b pivot hb p v i
    (b - 1) hi.1 (by omega) (by omega))
  if h : i < j then
    let f := if hm : i + 64 ≤ j then
        flips lt p v (i + 1) (i + 16) (by omega) false 0 +
          flips lt p v (j - 14) (j + 1) (by omega) (lt v[j - 15] p) 0
      else maxFlips + 1
    if f ≤ maxFlips then
      Id.run (Pdq.partitionM.loop (fun x y => pure ⟨lt x y⟩) a b pivot hb p (v.swap i j (by omega)
        (by omega)) (i + 1) (j - 1) (by omega) (by omega) (by omega))
    else
      let ⟨(v, i'), hi'⟩ := bfLoop lt a (j + 1) (by omega) p v i (i + 1) (by omega) (by omega)
        (by omega)
      (v.swap a (i' - 1) (by omega) (by omega), ⟨i' - 1, by omega, by omega⟩, false)
  else (v.swap j a (by omega) (by omega), ⟨j, by omega⟩, true)

/-- Whether 8 adjacent pairs, at positions spread evenly over `v[a:b]`, are all in order: a cheap
sign that the range is made of ascending runs. -/
def locallySorted (lt : α → α → Bool) (v : Vector α n) (a b : Nat) (hab : a + 16 ≤ b)
    (hb : b ≤ n) : Bool :=
  go 0
where
  go (t : Nat) : Bool :=
    if ht : t < 8 then
      have : (b - a - 2) * t / 8 ≤ b - a - 2 := by
        have := Nat.mul_le_mul_left (b - a - 2) (show t ≤ 8 by omega)
        have := Nat.div_le_div_right (c := 8) this
        rw [Nat.mul_div_cancel _ (by decide)] at this
        omega
      !lt v[a + (b - a - 2) * t / 8 + 1] v[a + (b - a - 2) * t / 8] && go (t + 1)
    else true
  termination_by 8 - t

/-- The block size of `blockPartition`: offsets within a block fit a byte. -/
def blockSize : Nat := 64

/-- Partitions `v[a:b]` around `v[pivot]` in the manner of BlockQuicksort (Edelkamp and Weiß): while
more than two blocks remain, the offsets of the misplaced elements of a block at each end are
collected into a buffer, adding each comparison's result to a count instead of branching on it,
and as many pairs as both buffers allow are swapped; a two-ended scan finishes the middle and
places the pivot.  Same result contract as `Pdq.partitionM`. -/
@[specialize] def blockPartition (lt : α → α → Bool) (v : Vector α n) (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) : Vector α n × Idx a b × Bool :=
  let v := v.swap a pivot.1 (by omega) (by omega)
  let p := v[a]
  let (v, l, r, swapped) := blocks p v (a + 1) b (ByteArray.mk (Array.replicate blockSize 0))
    (ByteArray.mk (Array.replicate blockSize 0)) 0 0 0 0 false (b - a) (by omega) (by omega)
    (Nat.le_refl _)
  -- `[a+1, l)` is less than `p`, `[r, b)` is not less: finish `[l, r)` with the scalar scans.
  if h : a < l ∧ l ≤ r ∧ r ≤ b then
    let (v, mid, already) := finish p v l (r - 1) (by omega) (by omega) (by omega) true
    (v, mid, already && !swapped)
  else (v, ⟨a, by omega, by omega⟩, false)  -- unreachable: `blocks` keeps `a < l ≤ r ≤ b`
where
  /-- `offL[sL:sL+nL]` are the offsets in `[l, l+B)` of elements not less than `p`, `offR[sR:sR+nR]`
  those in `(r-B-1, r-1]` (counted back from `r - 1`) of elements less than `p`. -/
  @[specialize] blocks (p : α) (v : Vector α n) (l r : Nat) (offL offR : ByteArray)
      (sL nL sR nR : Nat) (swapped : Bool) (fuel : Nat) (hf : r - l ≤ fuel) (hl : a < l)
      (hr : r ≤ b) : Vector α n × Nat × Nat × Bool :=
    match fuel with
    | 0 => (v, l, r, swapped)
    | fuel + 1 =>
      if h : l + 2 * blockSize < r then
        let (offL, sL, nL) := if nL = 0 then
            let (offL, nL) := fillL p v l offL 0 0 (by unfold blockSize at *; omega)
            (offL, 0, nL) else (offL, sL, nL)
        let (offR, sR, nR) := if nR = 0 then
            let (offR, nR) := fillR p v r offR 0 0 (by unfold blockSize at *; omega)
            (offR, 0, nR) else (offR, sR, nR)
        let k := min nL nR
        let v := swaps v l r offL offR sL sR k (by unfold blockSize at *; omega)
        blocks p v (if nL - k = 0 then l + blockSize else l) (if nR - k = 0 then r - blockSize else r)
          offL offR (sL + k) (nL - k) (sR + k) (nR - k) (swapped || k != 0) fuel
          (by unfold blockSize at *; split <;> split <;> omega) (by split <;> omega)
          (by split <;> omega)
      else (v, l, r, swapped)
  /-- Records the offsets `i < B` with `¬ lt v[l+i] p`, branch-free in the comparison. -/
  @[specialize] fillL (p : α) (v : Vector α n) (l : Nat) (off : ByteArray) (i num : Nat)
      (h : l + blockSize ≤ n) : ByteArray × Nat :=
    if hi : i < blockSize then
      let off := off.set! num i.toUInt8
      fillL p v l off (i + 1) (num + if lt v[l + i] p then 0 else 1) h
    else (off, num)
  termination_by blockSize - i
  /-- Records the offsets `i < B` with `lt v[r-1-i] p`, branch-free in the comparison. -/
  @[specialize] fillR (p : α) (v : Vector α n) (r : Nat) (off : ByteArray) (i num : Nat)
      (h : blockSize ≤ r ∧ r ≤ n) : ByteArray × Nat :=
    if hi : i < blockSize then
      let off := off.set! num i.toUInt8
      fillR p v r off (i + 1) (num + if lt v[r - 1 - i] p then 1 else 0) h
    else (off, num)
  termination_by blockSize - i
  /-- Swaps the `k` recorded pairs. -/
  swaps (v : Vector α n) (l r : Nat) (offL offR : ByteArray) (sL sR k : Nat)
      (h : l + blockSize ≤ r ∧ r ≤ n) : Vector α n :=
    match k with
    | 0 => v
    | k + 1 =>
      let i := l + (offL.get! sL).toNat
      let j := r - 1 - (offR.get! sR).toNat
      let v := if hij : i < n ∧ j < n then v.swap i j else v
      swaps v l r offL offR (sL + 1) (sR + 1) k h
  /-- The two-ended scan on `[i, j]` with the pivot `p` at `a`, as `Pdq.partitionM`'s loop;
  `still` records that no swap happened. -/
  finish (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b)
      (still : Bool) : Vector α n × Idx a b × Bool :=
    let ⟨i, hi1, hi2, hi3⟩ := up p v i j h1 h2 h3
    let ⟨j', hj1, hj2⟩ := down p v i j hi1 hi2 h3
    if h : i < j' then
      finish p (v.swap i j' (by omega) (by omega)) (i + 1) (j' - 1) (by omega) (by omega) (by omega) false
    else (v.swap j' a (by omega) (by omega), ⟨j', by omega, by omega⟩, still)
  termination_by j + 1 - i
  up (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
      {i' : Nat // a < i' ∧ i' ≤ j + 1 ∧ i ≤ i'} :=
    if h : i ≤ j then
      if lt v[i] p then
        let ⟨i', h'⟩ := up p v (i + 1) j (by omega) (by omega) h3
        ⟨i', h'.1, h'.2.1, by omega⟩
      else ⟨i, h1, h2, Nat.le_refl _⟩
    else ⟨i, h1, h2, Nat.le_refl _⟩
  termination_by j + 1 - i
  down (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
      {j' : Nat // i ≤ j' + 1 ∧ j' ≤ j} :=
    if h : i ≤ j then
      if lt v[j] p then ⟨j, h2, Nat.le_refl _⟩
      else
        let ⟨j', hj⟩ := down p v i (j - 1) h1 (by omega) (by omega)
        ⟨j', hj.1, by omega⟩
    else ⟨j, h2, Nat.le_refl _⟩
  termination_by j + 1 - i

/-- Sorts `v[a:b]`.  `limit` is the number of unbalanced partitions left before heapsort;
`balanced` and `partitioned` describe the partition that produced this range.  `afterEqual` says
that it is what a partition into "equal" and "greater" left: then no element of the range is
equivalent to the one before it, so the test for that is skipped.  For a lawful `lt` this changes
nothing; for an unlawful one, it stops a chain of such partitions, each of which might take a
single element off the range without counting against `limit`, from costing quadratic time.
`fuel` bounds the length of the range, so that the recursion is structural. -/
@[specialize] def sort (lt : α → α → Bool) (cfg : Config) (lo : Nat) (v : Vector α n) (a b limit : Nat)
    (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel) (hlo : lo ≤ a)
    (hab : a ≤ b) (hb : b ≤ n) : Vector α n :=
  if h12 : b - a ≤ max cfg.cut 12 then Id.run (insertionSortM (fun x y => pure ⟨lt x y⟩) v a b hb)
  else if limit = 0 then Id.run (heapSortM (fun x y => pure ⟨lt x y⟩) v a b hab hb)
  else match fuel with
  | 0 => absurd hf (by omega)
  | fuel + 1 =>
    let (v, limit) := if balanced then (v, limit)
      else ((if cfg.brk9 then breakPatterns9 v a b hb else breakPatterns v a b hb), limit - 1)
    let (pivot, hint) := if cfg.median3 then median3Pivot lt v a b (by omega) hb
      else (Id.run (choosePivotM (fun x y => pure ⟨lt x y⟩) v a b (by omega) hb)).down
    let (v, pivot, hint) : Vector α n × Idx a b × Hint :=
      if hint == .decreasing then
        (reverseRange v a b hb, ⟨b - 1 - (pivot.1 - a), by omega⟩, .increasing)
      else (v, pivot, hint)
    let (v, done) :=
      if balanced && partitioned && hint == .increasing then
        if cfg.pis8 then partialInsertionSort8 lt v a b hb
        else if cfg.pisx then partialInsertionSortX lt cfg.pisWidth v a b (by omega) hb
        else Id.run (partialInsertionSortM (fun x y => pure ⟨lt x y⟩) v a b (by omega) hb)
      else (v, false)
    if done then v
    else if hp : !afterEqual ∧ lo < a ∧ !lt v[a - 1] v[pivot.1] then
      let (v, ⟨mid, hm⟩) := Id.run (partitionEqualM (fun x y => pure ⟨lt x y⟩) v a b pivot hb)
      sort lt cfg lo v mid b limit balanced partitioned true fuel (by omega) (by omega) (by omega) hb
    else
      let tried := balanced && partitioned && hint == .increasing
      let (v, ⟨mid, hm⟩, already) :=
        if cfg.hybp && tried then Id.run (Pdq.partitionM (fun x y => pure ⟨lt x y⟩) v a b pivot hb)
        else if hpairs : cfg.pairs ∧ a + 16 ≤ b then
          if locallySorted lt v a b hpairs.2 hb then Id.run (Pdq.partitionM (fun x y => pure ⟨lt x y⟩) v a b pivot hb)
          else lomutoBranchless lt v a b pivot hb
        else if cfg.lomuto || (cfg.hybrid && hint != .increasing) then
          if cfg.branchless then
            if cfg.ends && cfg.pred then lomutoEndsPred lt cfg.predMax v a b pivot hb
            else if cfg.ends then lomutoEnds lt v a b pivot hb
            else if cfg.lean2 then lomutoBranchless2 lt v a b pivot hb
            else lomutoBranchless lt v a b pivot hb
          else lomutoPartition lt v a b pivot hb
        else if cfg.hoareBl then hoareBranchless lt v a b pivot hb
        else if cfg.block then blockPartition lt v a b pivot hb
        else Id.run (Pdq.partitionM (fun x y => pure ⟨lt x y⟩) v a b pivot hb)
      if mid - a < b - mid then
        let v := sort lt cfg lo v a mid limit true cfg.childTries false fuel (by omega) hlo (by omega) (by omega)
        sort lt cfg lo v (mid + 1) b limit (mid - a ≥ (b - a) / 8) already false fuel (by omega) (by omega)
          (by omega) hb
      else
        let v := sort lt cfg lo v (mid + 1) b limit true cfg.childTries false fuel (by omega) (by omega) (by omega) hb
        sort lt cfg lo v a mid limit (b - mid ≥ (b - a) / 8) already false fuel (by omega) hlo (by omega)
          (by omega)

/-- Sorts `as[lo..=hi]` in place, with the same interface as `Array.qsort`. -/
@[inline] def qsort (cfg : Config) (as : Array α) (lt : α → α → Bool := by exact (· < ·))
    (lo := 0) (hi := as.size - 1) : Array α :=
  if h : as.size = 0 then as
  else
    let lo := min lo (as.size - 1)
    let hi := max lo (min hi (as.size - 1))
    (sort lt cfg lo as.toVector lo (hi + 1) (Nat.log2 (hi + 1 - lo) + 1) true true false (hi + 1 - lo)
      (Nat.le_refl _) (Nat.le_refl _) (by omega) (by omega)).toArray


/-- Parses a variant name: the old names `lab-base`, `lab-c24`, `lab-lomuto`, `lab-lomuto-c24`,
`lab-cNN`, or `lab:` followed by comma-separated `cNN`, `lomuto`, `hyb`, `bl`, `pairs`, `block`, `bh`, `brk9`, `bl2`,
`ends`, `pis8`, `hybp`, `pisx`, `pisx6`, `pred`,
`predN` (at most N flips), `m3`, `nochild`. -/
def Config.parse (name : String) : Option Config :=
  match name with
  | "lab-base" => some {}
  | "lab-c24" => some { cut := 24 }
  | "lab-lomuto" => some { lomuto := true }
  | "lab-lomuto-c24" => some { cut := 24, lomuto := true }
  | _ =>
    if let some c := (name.dropPrefix? "lab-c").bind (·.toString.toNat?) then some { cut := c }
    else if let some opts := name.dropPrefix? "lab:" then
      (opts.toString.splitOn ",").foldlM (init := ({} : Config)) fun cfg o =>
        match o with
        | "lomuto" => some { cfg with lomuto := true }
        | "hyb" => some { cfg with hybrid := true }
        | "block" => some { cfg with block := true }
        | "bl" => some { cfg with branchless := true }
        | "pairs" => some { cfg with pairs := true }
        | "m3" => some { cfg with median3 := true }
        | "nochild" => some { cfg with childTries := false }
        | "bh" => some { cfg with hoareBl := true }
        | "brk9" => some { cfg with brk9 := true }
        | "bl2" => some { cfg with branchless := true, lean2 := true }
        | "ends" => some { cfg with branchless := true, ends := true }
        | "pis8" => some { cfg with pis8 := true }
        | "hybp" => some { cfg with hybp := true }
        | "pisx" => some { cfg with pisx := true }
        | "pred" => some { cfg with pred := true }
        | "pisx6" => some { cfg with pisx := true, pisWidth := 6 }
        | _ =>
          if let some t := (o.dropPrefix? "pred").bind (·.toString.toNat?) then
            some { cfg with pred := true, predMax := t }
          else (o.dropPrefix? "c").bind (·.toString.toNat?) |>.map fun c => { cfg with cut := c }
    else none

end PdqLab
