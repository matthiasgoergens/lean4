/-!
Pattern-defeating quicksort (Orson Peters, "Pattern-defeating Quicksort", arXiv 2106.05123), on
`Vector` with every index proved in bounds.  It sorts `v[a:b]` (half-open) using only `lt`:

* insertion sort on ranges of at most `insertionCutoff` (24) elements;
* the pivot is the median of three, or Tukey's ninther from 50 elements up, and the number of
  out-of-order pairs seen while choosing it hints at an ascending or descending input;
* a descending hint reverses the range, and an ascending one tries a bounded partial insertion sort,
  which finishes nearly sorted input in linear time;
* when the element before the range is not less than the pivot, every element of the range is at
  least the pivot, so the range is split into "equal to the pivot" and "greater", and the equal part
  is never touched again: many equal keys cost linear time;
* an unbalanced partition shuffles a few elements, and after log₂ n unbalanced partitions the range
  falls back to heapsort, so the worst case is O(n log n).

`lo` is the start of the whole subrange being sorted: elements before it belong to the caller and
are never read, which is what the "element before the range" test needs on a subrange.

The comparison returns in a monad: `qsort` runs the code at `Id`, and `Sorts.PdqCost` runs the same
code in a state monad that counts the comparisons.
-/

namespace Pdq

variable {α : Type u} {n : Nat}

/-- An index into `[a, b)`. -/
abbrev Idx (a b : Nat) := {x : Nat // a ≤ x ∧ x < b}

/-- Reverses `v[a:b]`. -/
def reverseRange (v : Vector α n) (i j : Nat) (hj : j ≤ n) : Vector α n :=
  if h : i + 1 < j then reverseRange (v.swap i (j - 1)) (i + 1) (j - 1) (by omega) else v
termination_by j - i

@[inline] def xorshift (r : UInt64) : UInt64 :=
  let r := r ^^^ (r <<< 13)
  let r := r ^^^ (r >>> 7)
  r ^^^ (r <<< 17)

/-- Swaps three elements in the middle of `v[a:b]` with pseudo-random ones, to break up patterns
that made the last partition unbalanced.  The random index is `r % len`; Go masks `r` to a power
of two above `len` and subtracts `len` once, which picks other elements but needs a bit-level
argument to stay in range. -/
def breakPatterns (v : Vector α n) (a b : Nat) (hb : b ≤ n) : Vector α n :=
  if h8 : 8 ≤ b - a then go v 0 (b - a).toUInt64 h8 else v
where
  go (v : Vector α n) (t : Nat) (r : UInt64) (h8 : 8 ≤ b - a) : Vector α n :=
    if ht : t < 3 then
      let r := xorshift r
      have := Nat.mod_lt r.toNat (show b - a > 0 by omega)
      go (v.swap (a + (b - a) / 4 * 2 - 1 + t) (a + r.toNat % (b - a)) (by omega) (by omega))
        (t + 1) r h8
    else v
  termination_by 3 - t

inductive Hint where
  | unknown | increasing | decreasing
  deriving BEq

/-! ### The functions that compare

Their comparison `lt` returns in a monad `m`.  Results that live in `Type` are wrapped in `ULift`,
which the compiler erases. -/

section Monadic

variable {m : Type u → Type v} [Monad m]

/-- Sorts `v[a:b]` by insertion. -/
@[specialize] def insertionSortM (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (a b : Nat)
    (hb : b ≤ n) : m (Vector α n) :=
  outer v (a + 1)
where
  /-- Moves `v[j]` down while it is less than its left neighbour, not below `a`. -/
  @[specialize] sink (v : Vector α n) (j : Nat) (hj : j < n) : m (Vector α n) :=
    if h : a < j then do
      if (← lt v[j] v[j - 1]).down then sink (v.swap j (j - 1)) (j - 1) (by omega) else pure v
    else pure v
  @[specialize] outer (v : Vector α n) (i : Nat) : m (Vector α n) :=
    if h : i < b then do outer (← sink v i (by omega)) (i + 1) else pure v
  termination_by b - i

/-- Restores the max-heap property below `root` in the heap `v[first:first+hi]`. -/
@[specialize] def siftDownM (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (root hi first : Nat)
    (h : first + hi ≤ n) : m (Vector α n) :=
  if hc : 2 * root + 1 < hi then do
    let ⟨⟨c, hc⟩⟩ ← (if hc' : 2 * root + 2 < hi then do
        if (← lt v[first + (2 * root + 1)] v[first + (2 * root + 2)]).down then
          pure ⟨⟨2 * root + 2, by omega⟩⟩
        else pure ⟨⟨2 * root + 1, by omega⟩⟩
      else pure ⟨⟨2 * root + 1, by omega⟩⟩ : m (ULift.{u} {c : Nat // c < hi ∧ root < c}))
    if (← lt v[first + root] v[first + c]).down then
      siftDownM lt (v.swap (first + root) (first + c)) c hi first h
    else pure v
  else pure v
termination_by hi - root

/-- Sorts `v[a:b]` by heapsort. -/
@[specialize] def heapSortM (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (a b : Nat)
    (hab : a ≤ b) (hb : b ≤ n) : m (Vector α n) := do
  pop (← build v ((b - a - 1) / 2 + 1)) (b - a) (Nat.le_refl _)
where
  /-- Sifts down the roots `k - 1, …, 0`. -/
  @[specialize] build (v : Vector α n) : Nat → m (Vector α n)
    | 0 => pure v
    | k + 1 => do build (← siftDownM lt v k (b - a) a (by omega)) k
  /-- Moves the maximum of the heap `v[a:a+i]` to its end, `i` times. -/
  @[specialize] pop (v : Vector α n) : (i : Nat) → i ≤ b - a → m (Vector α n)
    | 0, _ => pure v
    | i + 1, hi => do pop (← siftDownM lt (v.swap a (a + i)) 0 i a (by omega)) i (by omega)

/-- Insertion sort that gives up after moving five elements: returns whether `v[a:b]` ended up
sorted.  Ranges under 50 elements are only checked, not changed. -/
@[specialize] def partialInsertionSortM (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n)
    (a b : Nat) (hab : a < b) (hb : b ≤ n) : m (Vector α n × Bool) :=
  step v (a + 1) 0 (by omega) (by omega)
where
  /-- The first `i' ≥ i` with `v[i'] < v[i' - 1]`, or `b`. -/
  @[specialize] scan (v : Vector α n) (i : Nat) (h1 : a < i) (h2 : i ≤ b) :
      m (ULift.{u} {i' : Nat // a < i' ∧ i' ≤ b}) :=
    if h : i < b then do
      if (← lt v[i] v[i - 1]).down then pure ⟨⟨i, h1, h2⟩⟩
      else scan v (i + 1) (by omega) (by omega)
    else pure ⟨⟨i, h1, h2⟩⟩
  termination_by b - i
  @[specialize] sinkLeft (v : Vector α n) (j : Nat) (hj : j < b) : m (Vector α n) :=
    if h : a < j then do
      if (← lt v[j] v[j - 1]).down then sinkLeft (v.swap j (j - 1)) (j - 1) (by omega)
      else pure v
    else pure v
  @[specialize] riseRight (v : Vector α n) (j : Nat) (hj : a < j) : m (Vector α n) :=
    if h : j < b then do
      if (← lt v[j] v[j - 1]).down then riseRight (v.swap j (j - 1)) (j + 1) (by omega)
      else pure v
    else pure v
  termination_by b - j
  @[specialize] step (v : Vector α n) (i steps : Nat) (h1 : a < i) (h2 : i ≤ b) :
      m (Vector α n × Bool) :=
    if steps < 5 then do
      let ⟨⟨i, hi⟩⟩ ← scan v i h1 h2
      if h : i = b then pure (v, true)
      else if b - a < 50 then pure (v, false)
      else
        let v := v.swap i (i - 1)
        let v ← if hl : 2 ≤ i - a then sinkLeft v (i - 1) (by omega) else pure v
        let v ← if 2 ≤ b - i then riseRight v (i + 1) (by omega) else pure v
        step v i (steps + 1) hi.1 hi.2
    else pure (v, false)
  termination_by 5 - steps

/-- `x` and `y` ordered by their elements, and `swaps` counting the pairs found out of order. -/
@[inline] def order2M (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (hb : b ≤ n)
    (x y : Idx a b) (swaps : Nat) : m (ULift.{u} (Idx a b × Idx a b × Nat)) := do
  if (← lt v[y.1] v[x.1]).down then pure ⟨(y, x, swaps + 1)⟩ else pure ⟨(x, y, swaps)⟩

/-- The index of the median of the elements at `x`, `y` and `z`, and `swaps` counting the pairs
found out of order. -/
@[inline] def medianM (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (hb : b ≤ n)
    (x y z : Idx a b) (swaps : Nat) : m (ULift.{u} (Idx a b × Nat)) := do
  let ⟨(x, y, swaps)⟩ ← order2M lt v hb x y swaps
  let ⟨(y, _, swaps)⟩ ← order2M lt v hb y z swaps
  let ⟨(_, y, swaps)⟩ ← order2M lt v hb x y swaps
  pure ⟨(y, swaps)⟩

/-- Chooses a pivot in `v[a:b]`, and hints whether the range looked ascending (no pair out of
order) or descending (every pair out of order). -/
@[inline] def choosePivotM (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (a b : Nat)
    (hab : a < b) (hb : b ≤ n) : m (ULift.{u} (Idx a b × Hint)) :=
  -- The candidates are `a + (b - a) / 4 * t` for `t = 1, 2, 3`, each with its neighbours when the
  -- ninther is used: `ad q d` is `a + q` moved by `d - 1`.
  let ad (q d : Nat) (h : (q = (b - a) / 4 ∨ q = (b - a) / 4 * 2 ∨ q = (b - a) / 4 * 3) ∧ d ≤ 2)
      (h50 : 50 ≤ b - a ∨ d = 1) : Idx a b :=
    ⟨a + q + d - 1, by omega⟩
  if h8 : 8 ≤ b - a then do
    let ⟨(i, j, k, swaps)⟩ ← (if h50 : 50 ≤ b - a then do
        let ⟨(i, s)⟩ ← medianM lt v hb (ad ((b - a) / 4) 0 (by omega) (.inl h50)) (ad ((b - a) / 4) 1 (by omega) (.inr rfl))
          (ad ((b - a) / 4) 2 (by omega) (.inl h50)) 0
        let ⟨(j, s)⟩ ← medianM lt v hb (ad ((b - a) / 4 * 2) 0 (by omega) (.inl h50)) (ad ((b - a) / 4 * 2) 1 (by omega) (.inr rfl))
          (ad ((b - a) / 4 * 2) 2 (by omega) (.inl h50)) s
        let ⟨(k, s)⟩ ← medianM lt v hb (ad ((b - a) / 4 * 3) 0 (by omega) (.inl h50)) (ad ((b - a) / 4 * 3) 1 (by omega) (.inr rfl))
          (ad ((b - a) / 4 * 3) 2 (by omega) (.inl h50)) s
        pure ⟨(i, j, k, s)⟩
      else pure ⟨(ad ((b - a) / 4) 1 (by omega) (.inr rfl), ad ((b - a) / 4 * 2) 1 (by omega) (.inr rfl), ad ((b - a) / 4 * 3) 1 (by omega) (.inr rfl), 0)⟩
      : m (ULift.{u} (Idx a b × Idx a b × Idx a b × Nat)))
    let ⟨(j, swaps)⟩ ← medianM lt v hb i j k swaps
    pure ⟨(j, if swaps == 0 then .increasing else if swaps == 12 then .decreasing else .unknown)⟩
  else pure ⟨(ad ((b - a) / 4 * 2) 1 (by omega) (.inr rfl), .increasing)⟩

/-- Partitions `v[a:b]` around `v[pivot]`: returns `mid` with `v[mid]` the pivot, everything before
it less and everything after it not less, and whether no element had to move. -/
@[specialize] def partitionM (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) : m (Vector α n × Idx a b × Bool) := do
  let v := v.swap a pivot.1 (by omega) (by omega)
  let p := v[a]
  -- `[a+1, i)` is less than `p`, `(j, b)` is not less, and `[i, j]` is unexamined.
  let ⟨⟨i, hi⟩⟩ ← scanUp p v (a + 1) (b - 1) (by omega) (by omega) (by omega)
  let ⟨⟨j, hj⟩⟩ ← scanDown p v i (b - 1) hi.1 (by omega) (by omega)
  if h : i < j then
    loop p (v.swap i j) (i + 1) (j - 1) (by omega) (by omega) (by omega)
  else pure (v.swap j a, ⟨j, by omega⟩, true)
where
  @[specialize] scanUp (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1)
      (h3 : j < b) : m (ULift.{u} {i' : Nat // a < i' ∧ i' ≤ j + 1 ∧ i ≤ i'}) :=
    if h : i ≤ j then do
      if (← lt v[i] p).down then
        let ⟨⟨i', h⟩⟩ ← scanUp p v (i + 1) j (by omega) (by omega) h3
        pure ⟨⟨i', h.1, h.2.1, by omega⟩⟩
      else pure ⟨⟨i, h1, h2, Nat.le_refl _⟩⟩
    else pure ⟨⟨i, h1, h2, Nat.le_refl _⟩⟩
  termination_by j + 1 - i
  @[specialize] scanDown (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1)
      (h3 : j < b) : m (ULift.{u} {j' : Nat // i ≤ j' + 1 ∧ j' ≤ j}) :=
    if h : i ≤ j then do
      if (← lt v[j] p).down then pure ⟨⟨j, h2, Nat.le_refl _⟩⟩
      else
        let ⟨⟨j', hj⟩⟩ ← scanDown p v i (j - 1) h1 (by omega) (by omega)
        pure ⟨⟨j', hj.1, by omega⟩⟩
    else pure ⟨⟨j, h2, Nat.le_refl _⟩⟩
  termination_by j + 1 - i
  @[specialize] loop (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1)
      (h3 : j < b) : m (Vector α n × Idx a b × Bool) := do
    let ⟨⟨i, hi⟩⟩ ← scanUp p v i j h1 h2 h3
    let ⟨⟨j', hj⟩⟩ ← scanDown p v i j hi.1 hi.2.1 h3
    if h : i < j' then
      loop p (v.swap i j') (i + 1) (j' - 1) (by omega) (by omega) (by omega)
    else pure (v.swap j' a, ⟨j', by omega⟩, false)
  termination_by j + 1 - i

/-- Given that no element of `v[a:b]` is less than `v[pivot]`, moves the elements equal to it to the
front and returns where the greater ones start. -/
@[specialize] def partitionEqualM (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) : m (Vector α n × {m : Nat // a < m ∧ m ≤ b}) :=
  let v := v.swap a pivot.1 (by omega) (by omega)
  loop v[a] v (a + 1) (b - 1) (by omega) (by omega) (by omega)
where
  @[specialize] loop (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1)
      (h3 : j < b) : m (Vector α n × {m : Nat // a < m ∧ m ≤ b}) := do
    let ⟨⟨i, hi⟩⟩ ← scanUp p v i j h1 h2 h3
    let ⟨⟨j', hj⟩⟩ ← scanDown p v i j hi.1 hi.2.1 h3
    if h : i < j' then
      loop p (v.swap i j') (i + 1) (j' - 1) (by omega) (by omega) (by omega)
    else pure (v, ⟨i, hi.1, by omega⟩)
  termination_by j + 1 - i
  @[specialize] scanUp (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1)
      (h3 : j < b) : m (ULift.{u} {i' : Nat // a < i' ∧ i' ≤ j + 1 ∧ i ≤ i'}) :=
    if h : i ≤ j then do
      if (← lt p v[i]).down then pure ⟨⟨i, h1, h2, Nat.le_refl _⟩⟩
      else
        let ⟨⟨i', h⟩⟩ ← scanUp p v (i + 1) j (by omega) (by omega) h3
        pure ⟨⟨i', h.1, h.2.1, by omega⟩⟩
    else pure ⟨⟨i, h1, h2, Nat.le_refl _⟩⟩
  termination_by j + 1 - i
  @[specialize] scanDown (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1)
      (h3 : j < b) : m (ULift.{u} {j' : Nat // i ≤ j' + 1 ∧ j' ≤ j}) :=
    if h : i ≤ j then do
      if (← lt p v[j]).down then
        let ⟨⟨j', hj⟩⟩ ← scanDown p v i (j - 1) h1 (by omega) (by omega)
        pure ⟨⟨j', hj.1, by omega⟩⟩
      else pure ⟨⟨j, h2, Nat.le_refl _⟩⟩
    else pure ⟨⟨j, h2, Nat.le_refl _⟩⟩
  termination_by j + 1 - i

/-- Ranges of at most this many elements are insertion-sorted.  The value was chosen by measurement:
rounds five to seven of `sorts/PLAN.md` timed 12 to 48 (`logs/2026-10-27/qsort-round{5,6,7}`).
The proofs hold for every value of at least 12; the constant of `Pdq.qsortComparisons_le` grows
with it. -/
def insertionCutoff : Nat := 24

/-- Sorts `v[a:b]`.  `limit` is the number of unbalanced partitions left before heapsort;
`balanced` and `partitioned` describe the partition that produced this range.  `afterEqual` says
that it is what a partition into "equal" and "greater" left: then no element of the range is
equivalent to the one before it, so the test for that is skipped (it compares only when
`afterEqual` is false and `lo < a`).  For a lawful `lt` this changes nothing; for an unlawful one,
it stops a chain of such partitions, each of which might take a single element off the range
without counting against `limit`, from costing quadratic time.  `fuel` bounds the length of the
range, so that the recursion is structural. -/
@[specialize] def sortM (lt : α → α → m (ULift.{u} Bool)) (lo : Nat) (v : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) : m (Vector α n) :=
  if h12 : b - a ≤ insertionCutoff then insertionSortM lt v a b hb
  else if limit = 0 then heapSortM lt v a b hab hb
  else match fuel with
  | 0 => absurd hf (by omega)
  | fuel + 1 => do
    let (v, limit) := if balanced then (v, limit) else (breakPatterns v a b hb, limit - 1)
    let ⟨(pivot, hint)⟩ ← choosePivotM lt v a b (by omega) hb
    let (v, pivot, hint) : Vector α n × Idx a b × Hint :=
      if hint == .decreasing then
        (reverseRange v a b hb, ⟨b - 1 - (pivot.1 - a), by omega⟩, .increasing)
      else (v, pivot, hint)
    let (v, done) ←
      if balanced && partitioned && hint == .increasing then
        partialInsertionSortM lt v a b (by omega) hb
      else pure (v, false)
    if done then pure v
    else
      let ⟨equal⟩ ← (if !afterEqual && decide (lo < a) then do
          pure ⟨!(← lt v[a - 1] v[pivot.1]).down⟩
        else pure ⟨false⟩ : m (ULift.{u} Bool))
      if equal then
        let (v, ⟨mid, hm⟩) ← partitionEqualM lt v a b pivot hb
        sortM lt lo v mid b limit balanced partitioned true fuel (by omega) (by omega) (by omega) hb
      else
        let (v, ⟨mid, hm⟩, already) ← partitionM lt v a b pivot hb
        if mid - a < b - mid then
          let v ← sortM lt lo v a mid limit true true false fuel (by omega) hlo (by omega) (by omega)
          sortM lt lo v (mid + 1) b limit (mid - a ≥ (b - a) / 8) already false fuel (by omega)
            (by omega) (by omega) hb
        else
          let v ← sortM lt lo v (mid + 1) b limit true true false fuel (by omega) (by omega)
            (by omega) hb
          sortM lt lo v a mid limit (b - mid ≥ (b - a) / 8) already false fuel (by omega) hlo
            (by omega) (by omega)

end Monadic

/-- Sorts `as[lo..=hi]` in place, with the same interface as `Array.qsort`, by running `sortM` at
`Id`. -/
@[inline] def qsort (as : Array α) (lt : α → α → Bool := by exact (· < ·))
    (lo := 0) (hi := as.size - 1) : Array α :=
  if h : as.size = 0 then as
  else
    let lo := min lo (as.size - 1)
    let hi := max lo (min hi (as.size - 1))
    (Id.run (sortM (fun x y => pure ⟨lt x y⟩) lo as.toVector lo (hi + 1)
      (Nat.log2 (hi + 1 - lo) + 1) true true false (hi + 1 - lo) (Nat.le_refl _) (Nat.le_refl _)
      (by omega) (by omega))).toArray

end Pdq

namespace Pdq

/-- Sorts an array with `compare`, as `Array.qsortOrd` does. -/
def qsortOrd [Ord α] (xs : Array α) : Array α :=
  qsort xs fun x y => compare x y |>.isLT

end Pdq
