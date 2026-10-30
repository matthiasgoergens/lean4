/-
Copyright (c) 2019 Microsoft Corporation. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Leonardo de Moura, Matthias Goergens
-/
module

prelude
public import Init.Data.Vector.Basic
public import Init.Data.Ord.Basic
public import Init.Data.Nat.Log2
public import Init.Data.UInt.Basic
import Init.Omega
import Init.WFTactics

public section

/-!
# Pattern-defeating quicksort

`Array.qsort` is a pattern-defeating quicksort (Orson Peters, "Pattern-defeating Quicksort",
arXiv:2106.05123) on a `Vector`, with every index proved in bounds. The helpers sort `xs[a:b]`
(half-open) using only `lt`:

* ranges of at most `insertionCutoff` elements are insertion-sorted;
* the pivot is the median of three, or Tukey's ninther from 50 elements up, and the number of
  out-of-order pairs seen while choosing it hints at an ascending or descending input;
* a descending hint reverses the range, and an ascending one tries a bounded partial insertion sort,
  which finishes nearly sorted input in linear time;
* when the element before the range is not less than the pivot, every element of the range is at
  least the pivot, so the range is split into "equal to the pivot" and "greater", and the equal part
  is never touched again: many equal keys cost linear time;
* an unbalanced partition swaps a few elements to break up patterns, and after `log₂ n` unbalanced
  partitions the range falls back to heapsort, so the worst case is `O(n log n)` comparisons, for
  every `lt`.

The comparison returns in a monad, so that the comparisons can be counted in a state monad;
`Array.qsort` runs the code at `Id`.
-/

set_option linter.listVariables true -- Enforce naming conventions for `List`/`Array`/`Vector` variables.
-- We do not enable `linter.indexVariables` because it is helpful to name index variables `lo`, `mid`, `hi`, etc.

namespace Array.QSort.Internal

variable {α : Type u} {n : Nat}

/-- An index into `[a, b)`. -/
abbrev Idx (a b : Nat) := {x : Nat // a ≤ x ∧ x < b}

/-- Reverses `xs[i:j]`. -/
def reverseRange (xs : Vector α n) (i j : Nat) (hj : j ≤ n) : Vector α n :=
  if h : i + 1 < j then reverseRange (xs.swap i (j - 1)) (i + 1) (j - 1) (by omega) else xs
termination_by j - i

/-- One step of Marsaglia's xorshift generator. -/
@[inline] def xorshift (r : UInt64) : UInt64 :=
  let r := r ^^^ (r <<< 13)
  let r := r ^^^ (r >>> 7)
  r ^^^ (r <<< 17)

/-- Swaps three elements in the middle of `xs[a:b]` with pseudo-random ones, to break up patterns
that made the last partition unbalanced. -/
def breakPatterns (xs : Vector α n) (a b : Nat) (hb : b ≤ n) : Vector α n :=
  if h8 : 8 ≤ b - a then go xs 0 (b - a).toUInt64 h8 else xs
where
  /-- Swaps the `t`-th of the three elements, and the ones after it. -/
  go (xs : Vector α n) (t : Nat) (r : UInt64) (h8 : 8 ≤ b - a) : Vector α n :=
    if ht : t < 3 then
      let r := xorshift r
      have := Nat.mod_lt r.toNat (show b - a > 0 by omega)
      go (xs.swap (a + (b - a) / 4 * 2 - 1 + t) (a + r.toNat % (b - a)) (by omega) (by omega))
        (t + 1) r h8
    else xs
  termination_by 3 - t

/-- What choosing the pivot suggests about the order of a range. -/
inductive Hint where
  /-- Neither ascending nor descending. -/
  | unknown
  /-- No pair compared was out of order. -/
  | increasing
  /-- Every pair compared was out of order. -/
  | decreasing
  deriving BEq

/-! ### The functions that compare

Their comparison `lt` returns in a monad `m`. Results that live in `Type` are wrapped in `ULift`,
which the compiler erases. -/

section Monadic

variable {m : Type u → Type v} [Monad m]

/-- Sorts `xs[a:b]` by insertion. -/
@[specialize] def insertionSortM (lt : α → α → m (ULift.{u} Bool)) (xs : Vector α n) (a b : Nat)
    (hb : b ≤ n) : m (Vector α n) :=
  outer xs (a + 1)
where
  /-- Moves `xs[j]` down while it is less than its left neighbour, not below `a`. -/
  @[specialize] sink (xs : Vector α n) (j : Nat) (hj : j < n) : m (Vector α n) :=
    if h : a < j then do
      if (← lt xs[j] xs[j - 1]).down then sink (xs.swap j (j - 1)) (j - 1) (by omega) else pure xs
    else pure xs
  /-- Sinks `xs[i]`, then the elements after it. -/
  @[specialize] outer (xs : Vector α n) (i : Nat) : m (Vector α n) :=
    if h : i < b then do outer (← sink xs i (by omega)) (i + 1) else pure xs
  termination_by b - i

/-- Restores the max-heap property below `root` in the heap `xs[first:first+hi]`. -/
@[specialize] def siftDownM (lt : α → α → m (ULift.{u} Bool)) (xs : Vector α n)
    (root hi first : Nat) (h : first + hi ≤ n) : m (Vector α n) :=
  if hc : 2 * root + 1 < hi then do
    let ⟨⟨c, hc⟩⟩ ← (if hc' : 2 * root + 2 < hi then do
        if (← lt xs[first + (2 * root + 1)] xs[first + (2 * root + 2)]).down then
          pure ⟨⟨2 * root + 2, by omega⟩⟩
        else pure ⟨⟨2 * root + 1, by omega⟩⟩
      else pure ⟨⟨2 * root + 1, by omega⟩⟩ : m (ULift.{u} {c : Nat // c < hi ∧ root < c}))
    if (← lt xs[first + root] xs[first + c]).down then
      siftDownM lt (xs.swap (first + root) (first + c)) c hi first h
    else pure xs
  else pure xs
termination_by hi - root

/-- Sorts `xs[a:b]` by heapsort. -/
@[specialize] def heapSortM (lt : α → α → m (ULift.{u} Bool)) (xs : Vector α n) (a b : Nat)
    (hab : a ≤ b) (hb : b ≤ n) : m (Vector α n) := do
  pop (← build xs ((b - a - 1) / 2 + 1)) (b - a) (Nat.le_refl _)
where
  /-- Sifts down the roots `k - 1, …, 0`. -/
  @[specialize] build (xs : Vector α n) : Nat → m (Vector α n)
    | 0 => pure xs
    | k + 1 => do build (← siftDownM lt xs k (b - a) a (by omega)) k
  /-- Moves the maximum of the heap `xs[a:a+i]` to its end, `i` times. -/
  @[specialize] pop (xs : Vector α n) : (i : Nat) → i ≤ b - a → m (Vector α n)
    | 0, _ => pure xs
    | i + 1, hi => do pop (← siftDownM lt (xs.swap a (a + i)) 0 i a (by omega)) i (by omega)

/-- Insertion sort that gives up after moving five elements: returns whether `xs[a:b]` ended up
sorted. Ranges under 50 elements are only checked, not changed. -/
@[specialize] def partialInsertionSortM (lt : α → α → m (ULift.{u} Bool)) (xs : Vector α n)
    (a b : Nat) (hab : a < b) (hb : b ≤ n) : m (Vector α n × Bool) :=
  step xs (a + 1) 0 (by omega) (by omega)
where
  /-- The first `i' ≥ i` with `xs[i'] < xs[i' - 1]`, or `b`. -/
  @[specialize] scan (xs : Vector α n) (i : Nat) (h1 : a < i) (h2 : i ≤ b) :
      m (ULift.{u} {i' : Nat // a < i' ∧ i' ≤ b}) :=
    if h : i < b then do
      if (← lt xs[i] xs[i - 1]).down then pure ⟨⟨i, h1, h2⟩⟩
      else scan xs (i + 1) (by omega) (by omega)
    else pure ⟨⟨i, h1, h2⟩⟩
  termination_by b - i
  /-- Moves `xs[j]` down while it is less than its left neighbour, not below `a`. -/
  @[specialize] sinkLeft (xs : Vector α n) (j : Nat) (hj : j < b) : m (Vector α n) :=
    if h : a < j then do
      if (← lt xs[j] xs[j - 1]).down then sinkLeft (xs.swap j (j - 1)) (j - 1) (by omega)
      else pure xs
    else pure xs
  /-- Moves `xs[j - 1]` up while its right neighbour is less than it, not past `b`. -/
  @[specialize] riseRight (xs : Vector α n) (j : Nat) (hj : a < j) : m (Vector α n) :=
    if h : j < b then do
      if (← lt xs[j] xs[j - 1]).down then riseRight (xs.swap j (j - 1)) (j + 1) (by omega)
      else pure xs
    else pure xs
  termination_by b - j
  /-- Finds the next pair out of order from `i` on and moves it into place, at most `5 - steps`
  times. -/
  @[specialize] step (xs : Vector α n) (i steps : Nat) (h1 : a < i) (h2 : i ≤ b) :
      m (Vector α n × Bool) :=
    if steps < 5 then do
      let ⟨⟨i, hi⟩⟩ ← scan xs i h1 h2
      if h : i = b then pure (xs, true)
      else if b - a < 50 then pure (xs, false)
      else
        let xs := xs.swap i (i - 1)
        let xs ← if hl : 2 ≤ i - a then sinkLeft xs (i - 1) (by omega) else pure xs
        let xs ← if 2 ≤ b - i then riseRight xs (i + 1) (by omega) else pure xs
        step xs i (steps + 1) hi.1 hi.2
    else pure (xs, false)
  termination_by 5 - steps

/-- `x` and `y` ordered by their elements, and `swaps` counting the pairs found out of order. -/
@[inline] def order2M (lt : α → α → m (ULift.{u} Bool)) (xs : Vector α n) (hb : b ≤ n)
    (x y : Idx a b) (swaps : Nat) : m (ULift.{u} (Idx a b × Idx a b × Nat)) := do
  if (← lt xs[y.1] xs[x.1]).down then pure ⟨(y, x, swaps + 1)⟩ else pure ⟨(x, y, swaps)⟩

/-- The index of the median of the elements at `x`, `y` and `z`, and `swaps` counting the pairs
found out of order. -/
@[inline] def medianM (lt : α → α → m (ULift.{u} Bool)) (xs : Vector α n) (hb : b ≤ n)
    (x y z : Idx a b) (swaps : Nat) : m (ULift.{u} (Idx a b × Nat)) := do
  let ⟨(x, y, swaps)⟩ ← order2M lt xs hb x y swaps
  let ⟨(y, _, swaps)⟩ ← order2M lt xs hb y z swaps
  let ⟨(_, y, swaps)⟩ ← order2M lt xs hb x y swaps
  pure ⟨(y, swaps)⟩

/-- Chooses a pivot in `xs[a:b]`, and hints whether the range looked ascending (no pair out of
order) or descending (every pair out of order). -/
@[inline] def choosePivotM (lt : α → α → m (ULift.{u} Bool)) (xs : Vector α n) (a b : Nat)
    (hab : a < b) (hb : b ≤ n) : m (ULift.{u} (Idx a b × Hint)) :=
  -- The candidates are `a + (b - a) / 4 * t` for `t = 1, 2, 3`, each with its neighbours when the
  -- ninther is used: `ad q d` is `a + q` moved by `d - 1`.
  let ad (q d : Nat) (h : (q = (b - a) / 4 ∨ q = (b - a) / 4 * 2 ∨ q = (b - a) / 4 * 3) ∧ d ≤ 2)
      (h50 : 50 ≤ b - a ∨ d = 1) : Idx a b :=
    ⟨a + q + d - 1, by omega⟩
  if h8 : 8 ≤ b - a then do
    let ⟨(i, j, k, swaps)⟩ ← (if h50 : 50 ≤ b - a then do
        let ⟨(i, s)⟩ ← medianM lt xs hb (ad ((b - a) / 4) 0 (by omega) (.inl h50))
          (ad ((b - a) / 4) 1 (by omega) (.inr rfl)) (ad ((b - a) / 4) 2 (by omega) (.inl h50)) 0
        let ⟨(j, s)⟩ ← medianM lt xs hb (ad ((b - a) / 4 * 2) 0 (by omega) (.inl h50))
          (ad ((b - a) / 4 * 2) 1 (by omega) (.inr rfl))
          (ad ((b - a) / 4 * 2) 2 (by omega) (.inl h50)) s
        let ⟨(k, s)⟩ ← medianM lt xs hb (ad ((b - a) / 4 * 3) 0 (by omega) (.inl h50))
          (ad ((b - a) / 4 * 3) 1 (by omega) (.inr rfl))
          (ad ((b - a) / 4 * 3) 2 (by omega) (.inl h50)) s
        pure ⟨(i, j, k, s)⟩
      else pure ⟨(ad ((b - a) / 4) 1 (by omega) (.inr rfl),
        ad ((b - a) / 4 * 2) 1 (by omega) (.inr rfl), ad ((b - a) / 4 * 3) 1 (by omega) (.inr rfl),
        0)⟩
      : m (ULift.{u} (Idx a b × Idx a b × Idx a b × Nat)))
    let ⟨(j, swaps)⟩ ← medianM lt xs hb i j k swaps
    pure ⟨(j, if swaps == 0 then .increasing else if swaps == 12 then .decreasing else .unknown)⟩
  else pure ⟨(ad ((b - a) / 4 * 2) 1 (by omega) (.inr rfl), .increasing)⟩

/-- Partitions `xs[a:b]` around `xs[pivot]`: returns `mid` with `xs[mid]` the pivot, everything
before it less and everything after it not less, and whether no element had to move. -/
@[specialize] def partitionM (lt : α → α → m (ULift.{u} Bool)) (xs : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) : m (Vector α n × Idx a b × Bool) := do
  let xs := xs.swap a pivot.1 (by omega) (by omega)
  let p := xs[a]
  -- `[a+1, i)` is less than `p`, `(j, b)` is not less, and `[i, j]` is unexamined.
  let ⟨⟨i, hi⟩⟩ ← scanUp p xs (a + 1) (b - 1) (by omega) (by omega) (by omega)
  let ⟨⟨j, hj⟩⟩ ← scanDown p xs i (b - 1) hi.1 (by omega) (by omega)
  if h : i < j then
    loop p (xs.swap i j) (i + 1) (j - 1) (by omega) (by omega) (by omega)
  else pure (xs.swap j a, ⟨j, by omega⟩, true)
where
  /-- The first `i' ≥ i` with `xs[i']` not less than `p`, or `j + 1`. -/
  @[specialize] scanUp (p : α) (xs : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1)
      (h3 : j < b) : m (ULift.{u} {i' : Nat // a < i' ∧ i' ≤ j + 1 ∧ i ≤ i'}) :=
    if h : i ≤ j then do
      if (← lt xs[i] p).down then
        let ⟨⟨i', h⟩⟩ ← scanUp p xs (i + 1) j (by omega) (by omega) h3
        pure ⟨⟨i', h.1, h.2.1, by omega⟩⟩
      else pure ⟨⟨i, h1, h2, Nat.le_refl _⟩⟩
    else pure ⟨⟨i, h1, h2, Nat.le_refl _⟩⟩
  termination_by j + 1 - i
  /-- The last `j' ≤ j` with `xs[j']` less than `p`, or `i - 1`. -/
  @[specialize] scanDown (p : α) (xs : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1)
      (h3 : j < b) : m (ULift.{u} {j' : Nat // i ≤ j' + 1 ∧ j' ≤ j}) :=
    if h : i ≤ j then do
      if (← lt xs[j] p).down then pure ⟨⟨j, h2, Nat.le_refl _⟩⟩
      else
        let ⟨⟨j', hj⟩⟩ ← scanDown p xs i (j - 1) h1 (by omega) (by omega)
        pure ⟨⟨j', hj.1, by omega⟩⟩
    else pure ⟨⟨j, h2, Nat.le_refl _⟩⟩
  termination_by j + 1 - i
  /-- Partitions the unexamined `xs[i:j+1]`. -/
  @[specialize] loop (p : α) (xs : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1)
      (h3 : j < b) : m (Vector α n × Idx a b × Bool) := do
    let ⟨⟨i, hi⟩⟩ ← scanUp p xs i j h1 h2 h3
    let ⟨⟨j', hj⟩⟩ ← scanDown p xs i j hi.1 hi.2.1 h3
    if h : i < j' then
      loop p (xs.swap i j') (i + 1) (j' - 1) (by omega) (by omega) (by omega)
    else pure (xs.swap j' a, ⟨j', by omega⟩, false)
  termination_by j + 1 - i

/-- Given that no element of `xs[a:b]` is less than `xs[pivot]`, moves the elements equal to it to
the front and returns where the greater ones start. -/
@[specialize] def partitionEqualM (lt : α → α → m (ULift.{u} Bool)) (xs : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) : m (Vector α n × {mid : Nat // a < mid ∧ mid ≤ b}) :=
  let xs := xs.swap a pivot.1 (by omega) (by omega)
  loop xs[a] xs (a + 1) (b - 1) (by omega) (by omega) (by omega)
where
  /-- Partitions the unexamined `xs[i:j+1]`. -/
  @[specialize] loop (p : α) (xs : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1)
      (h3 : j < b) : m (Vector α n × {mid : Nat // a < mid ∧ mid ≤ b}) := do
    let ⟨⟨i, hi⟩⟩ ← scanUp p xs i j h1 h2 h3
    let ⟨⟨j', hj⟩⟩ ← scanDown p xs i j hi.1 hi.2.1 h3
    if h : i < j' then
      loop p (xs.swap i j') (i + 1) (j' - 1) (by omega) (by omega) (by omega)
    else pure (xs, ⟨i, hi.1, by omega⟩)
  termination_by j + 1 - i
  /-- The first `i' ≥ i` with `p` less than `xs[i']`, or `j + 1`. -/
  @[specialize] scanUp (p : α) (xs : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1)
      (h3 : j < b) : m (ULift.{u} {i' : Nat // a < i' ∧ i' ≤ j + 1 ∧ i ≤ i'}) :=
    if h : i ≤ j then do
      if (← lt p xs[i]).down then pure ⟨⟨i, h1, h2, Nat.le_refl _⟩⟩
      else
        let ⟨⟨i', h⟩⟩ ← scanUp p xs (i + 1) j (by omega) (by omega) h3
        pure ⟨⟨i', h.1, h.2.1, by omega⟩⟩
    else pure ⟨⟨i, h1, h2, Nat.le_refl _⟩⟩
  termination_by j + 1 - i
  /-- The last `j' ≤ j` with `p` not less than `xs[j']`, or `i - 1`. -/
  @[specialize] scanDown (p : α) (xs : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1)
      (h3 : j < b) : m (ULift.{u} {j' : Nat // i ≤ j' + 1 ∧ j' ≤ j}) :=
    if h : i ≤ j then do
      if (← lt p xs[j]).down then
        let ⟨⟨j', hj⟩⟩ ← scanDown p xs i (j - 1) h1 (by omega) (by omega)
        pure ⟨⟨j', hj.1, by omega⟩⟩
      else pure ⟨⟨j, h2, Nat.le_refl _⟩⟩
    else pure ⟨⟨j, h2, Nat.le_refl _⟩⟩
  termination_by j + 1 - i

/-- Ranges of at most this many elements are insertion-sorted. The value was chosen by measurement;
the proofs hold for every value of at least 12, and the constant in the bound on comparisons grows
with it. -/
def insertionCutoff : Nat := 24

/-- Sorts `xs[a:b]`. `lo` is the start of the whole subrange being sorted: elements before it
belong to the caller and are never read.

`limit` is the number of unbalanced partitions left before heapsort; `balanced` and `partitioned`
describe the partition that produced this range. `afterEqual` says that it is what a partition
into "equal" and "greater" left: then no element of the range is equivalent to the one before it,
so the test for that is skipped (it compares only when `afterEqual` is false and `lo < a`). For a
lawful `lt` this changes nothing; for an unlawful one, it stops a chain of such partitions, each of
which might take a single element off the range without counting against `limit`, from costing
quadratic time. `fuel` bounds the length of the range, so that the recursion is structural. -/
@[specialize] def sortM (lt : α → α → m (ULift.{u} Bool)) (lo : Nat) (xs : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) : m (Vector α n) :=
  if h12 : b - a ≤ insertionCutoff then insertionSortM lt xs a b hb
  else if limit = 0 then heapSortM lt xs a b hab hb
  else match fuel with
  | 0 => absurd hf (by omega)
  | fuel + 1 => do
    let (xs, limit) := if balanced then (xs, limit) else (breakPatterns xs a b hb, limit - 1)
    let ⟨(pivot, hint)⟩ ← choosePivotM lt xs a b (by omega) hb
    let (xs, pivot, hint) : Vector α n × Idx a b × Hint :=
      if hint == .decreasing then
        (reverseRange xs a b hb, ⟨b - 1 - (pivot.1 - a), by omega⟩, .increasing)
      else (xs, pivot, hint)
    let (xs, done) ←
      if balanced && partitioned && hint == .increasing then
        partialInsertionSortM lt xs a b (by omega) hb
      else pure (xs, false)
    if done then pure xs
    else
      let ⟨equal⟩ ← (if !afterEqual && decide (lo < a) then do
          pure ⟨!(← lt xs[a - 1] xs[pivot.1]).down⟩
        else pure ⟨false⟩ : m (ULift.{u} Bool))
      if equal then
        let (xs, ⟨mid, hm⟩) ← partitionEqualM lt xs a b pivot hb
        sortM lt lo xs mid b limit balanced partitioned true fuel (by omega) (by omega) (by omega)
          hb
      else
        let (xs, ⟨mid, hm⟩, already) ← partitionM lt xs a b pivot hb
        if mid - a < b - mid then
          let xs ← sortM lt lo xs a mid limit true true false fuel (by omega) hlo (by omega)
            (by omega)
          sortM lt lo xs (mid + 1) b limit (mid - a ≥ (b - a) / 8) already false fuel (by omega)
            (by omega) (by omega) hb
        else
          let xs ← sortM lt lo xs (mid + 1) b limit true true false fuel (by omega) (by omega)
            (by omega) hb
          sortM lt lo xs a mid limit (b - mid ≥ (b - a) / 8) already false fuel (by omega) hlo
            (by omega) (by omega)

/-- `sortM` with its helpers as parameters: `sortM lt` is `sortCoreM` applied to the helpers at
`lt`.  `Array.qsort` runs it with some helpers compiled once, at `Id`, instead of specialised at
every call site. -/
@[specialize] def sortCoreM
    (part : (xs : Vector α n) → (a b : Nat) → Idx a b → b ≤ n → m (Vector α n × Idx a b × Bool))
    (partEq : (xs : Vector α n) → (a b : Nat) → Idx a b → b ≤ n →
      m (Vector α n × {mid : Nat // a < mid ∧ mid ≤ b}))
    (ins : (xs : Vector α n) → (a b : Nat) → b ≤ n → m (Vector α n))
    (heap : (xs : Vector α n) → (a b : Nat) → a ≤ b → b ≤ n → m (Vector α n))
    (pis : (xs : Vector α n) → (a b : Nat) → a < b → b ≤ n → m (Vector α n × Bool))
    (choose : (xs : Vector α n) → (a b : Nat) → a < b → b ≤ n → m (ULift.{u} (Idx a b × Hint)))
    (lt : α → α → m (ULift.{u} Bool)) (lo : Nat) (xs : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) : m (Vector α n) :=
  if h12 : b - a ≤ insertionCutoff then ins xs a b hb
  else if limit = 0 then heap xs a b hab hb
  else match fuel with
  | 0 => absurd hf (by omega)
  | fuel + 1 => do
    let (xs, limit) := if balanced then (xs, limit) else (breakPatterns xs a b hb, limit - 1)
    let ⟨(pivot, hint)⟩ ← choose xs a b (by omega) hb
    let (xs, pivot, hint) : Vector α n × Idx a b × Hint :=
      if hint == .decreasing then
        (reverseRange xs a b hb, ⟨b - 1 - (pivot.1 - a), by omega⟩, .increasing)
      else (xs, pivot, hint)
    let (xs, done) ←
      if balanced && partitioned && hint == .increasing then
        pis xs a b (by omega) hb
      else pure (xs, false)
    if done then pure xs
    else
      let ⟨equal⟩ ← (if !afterEqual && decide (lo < a) then do
          pure ⟨!(← lt xs[a - 1] xs[pivot.1]).down⟩
        else pure ⟨false⟩ : m (ULift.{u} Bool))
      if equal then
        let (xs, ⟨mid, hm⟩) ← partEq xs a b pivot hb
        sortCoreM part partEq ins heap pis choose lt lo xs mid b limit balanced partitioned true fuel
          (by omega) (by omega) (by omega) hb
      else
        let (xs, ⟨mid, hm⟩, already) ← part xs a b pivot hb
        if mid - a < b - mid then
          let xs ← sortCoreM part partEq ins heap pis choose lt lo xs a mid limit true true false fuel
            (by omega) hlo (by omega) (by omega)
          sortCoreM part partEq ins heap pis choose lt lo xs (mid + 1) b limit
            (mid - a ≥ (b - a) / 8) already false fuel (by omega) (by omega) (by omega) hb
        else
          let xs ← sortCoreM part partEq ins heap pis choose lt lo xs (mid + 1) b limit true true
            false fuel (by omega) (by omega) (by omega) hb
          sortCoreM part partEq ins heap pis choose lt lo xs a mid limit (b - mid ≥ (b - a) / 8)
            already false fuel (by omega) hlo (by omega) (by omega)

end Monadic

/-! The rarely used helpers at `Id`, with the comparison called through a closure: compiled once
here, and passed to `sortCoreM` by `Array.qsort`, so that call sites do not get copies of them. -/

/-- `heapSortM` at `Id`, compiled once. -/
@[noinline] def heapSortId (lt : α → α → Bool) (xs : Vector α n) (a b : Nat) (hab : a ≤ b)
    (hb : b ≤ n) : Id (Vector α n) :=
  heapSortM (fun x y => pure ⟨lt x y⟩) xs a b hab hb

/-- `partialInsertionSortM` at `Id`, compiled once. -/
@[noinline] def partialInsertionSortId (lt : α → α → Bool) (xs : Vector α n) (a b : Nat)
    (hab : a < b) (hb : b ≤ n) : Id (Vector α n × Bool) :=
  partialInsertionSortM (fun x y => pure ⟨lt x y⟩) xs a b hab hb

/-- `choosePivotM` at `Id`, compiled once. -/
@[noinline] def choosePivotId (lt : α → α → Bool) (xs : Vector α n) (a b : Nat) (hab : a < b)
    (hb : b ≤ n) : Id (ULift.{u} (Idx a b × Hint)) :=
  choosePivotM (fun x y => pure ⟨lt x y⟩) xs a b hab hb

/-- The recursion at `Id`, compiled once, calling the partitions, insertion sort and partial
insertion sort it is given (which `Array.qsort` specialises at the call site) through closures. -/
@[noinline] def sortLeavesId
    (part : (xs : Vector α n) → (a b : Nat) → Idx a b → b ≤ n → Id (Vector α n × Idx a b × Bool))
    (partEq : (xs : Vector α n) → (a b : Nat) → Idx a b → b ≤ n →
      Id (Vector α n × {mid : Nat // a < mid ∧ mid ≤ b}))
    (ins : (xs : Vector α n) → (a b : Nat) → b ≤ n → Id (Vector α n))
    (pis : (xs : Vector α n) → (a b : Nat) → a < b → b ≤ n → Id (Vector α n × Bool))
    (lt : α → α → Bool) (lo : Nat) (xs : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) : Id (Vector α n) :=
  sortCoreM part partEq ins (heapSortId lt) pis (choosePivotId lt) (fun x y => pure ⟨lt x y⟩) lo xs
    a b limit balanced partitioned afterEqual fuel hf hlo hab hb


end Array.QSort.Internal

namespace Array

/-- What `qsort` compiles to (prototype). -/
@[inline] def qsortImpl (as : Array α) (lt : α → α → Bool := by exact (· < ·))
    (lo := 0) (hi := as.size - 1) : Array α :=
  if h : as.size = 0 then as
  else
    let lo := min lo (as.size - 1)
    let hi := max lo (min hi (as.size - 1))
    (Id.run (QSort.Internal.sortLeavesId (QSort.Internal.partitionM (fun x y => pure ⟨lt x y⟩))
      (QSort.Internal.partitionEqualM (fun x y => pure ⟨lt x y⟩)) (QSort.Internal.insertionSortM (fun x y => pure ⟨lt x y⟩))
      (QSort.Internal.partialInsertionSortId lt) lt lo as.toVector lo (hi + 1)
      (Nat.log2 (hi + 1 - lo) + 1) true true false (hi + 1 - lo) (Nat.le_refl _) (Nat.le_refl _)
      (by omega) (by omega))).toArray

/--
In-place quicksort.

`qsort as lt lo hi` sorts the subarray `as[lo...=hi]` in-place using `lt` to compare elements.
`lo` and `hi` are clamped to the array, and a range with `hi ≤ lo` is left alone.

The sort is not stable. It makes `O(n log n)` comparisons on a range of `n` elements whatever `lt`
is, and sorts the range when `lt` is a strict weak order (see `Array.qsort_sorted'`). It is a
pattern-defeating quicksort, which is fast on inputs that are sorted, reversed, or have many equal
elements.
-/
@[implemented_by qsortImpl, inline] def qsort (as : Array α) (lt : autoParam (α → α → Bool) qsortImpl._auto_1)
    (lo := 0) (hi := as.size - 1) : Array α :=
  if h : as.size = 0 then as
  else
    let lo := min lo (as.size - 1)
    let hi := max lo (min hi (as.size - 1))
    (Id.run (QSort.Internal.sortM (fun x y => pure ⟨lt x y⟩) lo as.toVector lo (hi + 1)
      (Nat.log2 (hi + 1 - lo) + 1) true true false (hi + 1 - lo) (Nat.le_refl _) (Nat.le_refl _)
      (by omega) (by omega))).toArray

set_option linter.unusedVariables.funArgs false in
/--
Sort an array using `compare` to compare elements.
-/
def qsortOrd [ord : Ord α] (xs : Array α) : Array α :=
  xs.qsort fun x y => compare x y |>.isLT

end Array
