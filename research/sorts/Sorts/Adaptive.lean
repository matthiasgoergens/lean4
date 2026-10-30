import Sorts.Pdq

/-!
Pattern-defeating quicksort behind a natural-run front end, in place.

The range is cut into logical runs, left to right: an existing ascending (or strictly descending,
then reversed) run of at least `minRun` elements is a sorted run, and anything else becomes an
unsorted run of `minRun` elements.  Runs are combined in the order of Munro and Wild's powersort
("Nearly-optimal mergesorts", ESA 2018).  Two unsorted neighbours are simply concatenated, so
random input ends as one unsorted run, sorted by one call of `Pdq.sortM`.  Otherwise any unsorted
side is sorted with `Pdq.sortM` and the two sorted runs are merged in place: the elements already
in position at either end are skipped by binary search, and the rest is merged by splitting the
longer side in half, finding the split point in the other side by binary search, and rotating
(three reversals), recursively.  The merge needs few comparisons, O(m log(n/m + 1)) for runs of
lengths m ≤ n, but Θ((m + n) log(m + n)) swaps in the worst case.

The run-length threshold follows Rust's driftsort: about √n from 4096 elements up, so there are at
most about √n runs, and up to 64 below that.
-/

namespace Adaptive

open Pdq (Idx)

variable {α : Type u} {n : Nat}

/-- The first index in `[i, j)` whose element is not less than `p`, or `j`. -/
@[specialize] def lowerBound (lt : α → α → Bool) (v : Vector α n) (p : α) (i j : Nat) (hj : j ≤ n)
    (hij : i ≤ j) : {k : Nat // i ≤ k ∧ k ≤ j} :=
  if h : i < j then
    let mid := i + (j - i) / 2
    if lt v[mid] p then
      let ⟨k, hk⟩ := lowerBound lt v p (mid + 1) j hj (by omega)
      ⟨k, by omega, hk.2⟩
    else
      let ⟨k, hk⟩ := lowerBound lt v p i mid (by omega) (by omega)
      ⟨k, hk.1, by omega⟩
  else ⟨i, Nat.le_refl _, hij⟩
termination_by j - i

/-- The first index in `[i, j)` whose element is greater than `p`, or `j`. -/
@[specialize] def upperBound (lt : α → α → Bool) (v : Vector α n) (p : α) (i j : Nat) (hj : j ≤ n)
    (hij : i ≤ j) : {k : Nat // i ≤ k ∧ k ≤ j} :=
  if h : i < j then
    let mid := i + (j - i) / 2
    if lt p v[mid] then
      let ⟨k, hk⟩ := upperBound lt v p i mid (by omega) (by omega)
      ⟨k, hk.1, by omega⟩
    else
      let ⟨k, hk⟩ := upperBound lt v p (mid + 1) j hj (by omega)
      ⟨k, by omega, hk.2⟩
  else ⟨i, Nat.le_refl _, hij⟩
termination_by j - i

/-- Turns `v[f:m] ++ v[m:l]` into `v[m:l] ++ v[f:m]`. -/
def rotate (v : Vector α n) (f m l : Nat) (hl : l ≤ n) (hm : m ≤ l) : Vector α n :=
  Pdq.reverseRange (Pdq.reverseRange (Pdq.reverseRange v f m (by omega)) m l hl) f l hl

/-- Merges the sorted ranges `v[a:m]` and `v[m:b]` without a buffer.  `fuel` bounds `b - a`. -/
@[specialize] def mergeRot (lt : α → α → Bool) (v : Vector α n) (a m b fuel : Nat)
    (hf : b - a ≤ fuel) (ham : a ≤ m) (hmb : m ≤ b) (hb : b ≤ n) : Vector α n :=
  if h0 : a = m ∨ m = b then v
  else match fuel with
  | 0 => absurd hf (by omega)
  | fuel + 1 =>
    if h2 : b - a = 2 then
      if lt v[m] v[a] then v.swap a m else v
    else if hl : m - a > b - m then
      let c1 := a + (m - a) / 2
      let ⟨c2, hc2⟩ := lowerBound lt v v[c1] m b hb hmb
      let v := rotate v c1 m c2 (by omega) (by omega)
      let nm := c1 + (c2 - m)
      let v := mergeRot lt v a c1 nm fuel (by omega) (by omega) (by omega) (by omega)
      mergeRot lt v nm c2 b fuel (by omega) (by omega) (by omega) hb
    else
      let c2 := m + (b - m) / 2
      let ⟨c1, hc1⟩ := upperBound lt v v[c2] a m (by omega) ham
      let v := rotate v c1 m c2 (by omega) (by omega)
      let nm := c1 + (c2 - m)
      let v := mergeRot lt v a c1 nm fuel (by omega) (by omega) (by omega) (by omega)
      mergeRot lt v nm c2 b fuel (by omega) (by omega) (by omega) hb

/-- Merges the sorted ranges `v[a:m]` and `v[m:b]` in place, first skipping the elements of the
left run that are not greater than `v[m]` and those of the right run that are not less than
`v[m - 1]`. -/
@[specialize] def merge (lt : α → α → Bool) (v : Vector α n) (a m b : Nat) (ham : a < m)
    (hmb : m < b) (hb : b ≤ n) : Vector α n :=
  if lt v[m] v[m - 1] then
    let ⟨a', ha'⟩ := upperBound lt v v[m] a m (by omega) (by omega)
    let ⟨b', hb'⟩ := lowerBound lt v v[m - 1] m b hb (by omega)
    mergeRot lt v a' m b' (b' - a') (Nat.le_refl _) ha'.2 hb'.1 (by omega)
  else v

/-- A logical run: `v[start:start+len]`, sorted or not. -/
structure Run where
  start : Nat
  len : Nat
  sorted : Bool

/-- The length of the run starting at `i`, and whether it is strictly descending. -/
@[specialize] def findRun (lt : α → α → Bool) (v : Vector α n) (i b : Nat) (hi : i < b)
    (hb : b ≤ n) : {k : Nat // 1 ≤ k ∧ i + k ≤ b} × Bool :=
  if h : i + 1 < b then
    if lt v[i + 1] v[i] then
      let ⟨j, hj⟩ := down (i + 2) (by omega)
      (⟨j - i, by omega, by omega⟩, true)
    else
      let ⟨j, hj⟩ := up (i + 2) (by omega)
      (⟨j - i, by omega, by omega⟩, false)
  else (⟨1, Nat.le_refl _, by omega⟩, false)
where
  @[specialize] down (j : Nat) (hj : i + 2 ≤ j) : {j' : Nat // j ≤ j' ∧ j' ≤ max j b} :=
    if h : j < b then
      if lt v[j] v[j - 1] then
        let ⟨j', h'⟩ := down (j + 1) (by omega)
        ⟨j', by omega, by omega⟩
      else ⟨j, Nat.le_refl _, by omega⟩
    else ⟨j, Nat.le_refl _, by omega⟩
  termination_by b - j
  @[specialize] up (j : Nat) (hj : i + 2 ≤ j) : {j' : Nat // j ≤ j' ∧ j' ≤ max j b} :=
    if h : j < b then
      if !lt v[j] v[j - 1] then
        let ⟨j', h'⟩ := up (j + 1) (by omega)
        ⟨j', by omega, by omega⟩
      else ⟨j, Nat.le_refl _, by omega⟩
    else ⟨j, Nat.le_refl _, by omega⟩
  termination_by b - j

/-- The powersort priority of the boundary between runs `[s₁, s₁+n₁)` and `[s₁+n₁, s₁+n₁+n₂)`
of a range of length `total`, positions relative to its start: the first binary digit in which
the two runs' midpoints, as fractions of `total`, differ. -/
def power (s₁ n₁ n₂ total : Nat) : Nat :=
  go (2 * s₁ + n₁) (2 * s₁ + 2 * n₁ + n₂) 1 70
where
  go (l r k : Nat) : Nat → Nat
    | 0 => k
    | fuel + 1 =>
      let l := 2 * l
      let r := 2 * r
      let dl := l ≥ 2 * total
      if dl != (r ≥ 2 * total) then k
      else if dl then go (l - 2 * total) (r - 2 * total) (k + 1) fuel
      else go l r (k + 1) fuel

/-- Sorts `v[r.start:r.start+r.len]` if it is not sorted yet. -/
@[inline] def sortRun (lt : α → α → Bool) (v : Vector α n) (r : Run) (h : r.start + r.len ≤ n) :
    Vector α n :=
  if r.sorted then v
  else
    Id.run (Pdq.sortM (fun x y => pure ⟨lt x y⟩) r.start v r.start (r.start + r.len)
      (Nat.log2 r.len + 1) true true false r.len (by omega) (Nat.le_refl _) (by omega) h)

/-- Combines the neighbouring runs `l` and `r` (with `r` starting where `l` ends). -/
@[specialize] def combine (lt : α → α → Bool) (v : Vector α n) (l r : Run)
    (hlr : l.start + l.len = r.start) (hr : r.start + r.len ≤ n) : Vector α n × Run :=
  if !l.sorted && !r.sorted then (v, ⟨l.start, l.len + r.len, false⟩)
  else
    let v := sortRun lt v l (by omega)
    let v := sortRun lt v r hr
    let v :=
      if h : 0 < l.len ∧ 0 < r.len then merge lt v l.start r.start (r.start + r.len) (by omega) (by omega) hr
      else v
    (v, ⟨l.start, l.len + r.len, true⟩)

/-- A run on the powersort stack, with the priority of its boundary to the next run. -/
structure Entry where
  run : Run
  power : Nat

/-- Sorts `v[lo:b]`.  With `k = 0` the shortest run trusted as sorted follows driftsort (about
√n); with `k > 0` it is a `k`-th of the range (but at least 32 elements), so that at most `k` runs
are merged and everything else is sorted by `Pdq.sortM`: `k = 1` only recognises a range that is
already one run, as Rust's ipnsort does. -/
@[specialize] def sort (lt : α → α → Bool) (k : Nat) (v : Vector α n) (lo b : Nat) (hlo : lo ≤ b)
    (hb : b ≤ n) : Vector α n :=
  let total := b - lo
  let minRun :=
    if k = 0 then (if total ≤ 4096 then min (total - total / 2) 64 else Nat.sqrt total)
    else max ((total + k - 1) / k) (min total 32)
  if h : lo < b then
    let (v, ⟨cur, hcur⟩) := nextRun v lo minRun h
    loop v #[] ⟨cur, by omega, hcur.2.1, by omega⟩ minRun total
  else v
where
  /-- The logical run starting at `i`. -/
  @[specialize] nextRun (v : Vector α n) (i minRun : Nat) (hi : i < b) :
      Vector α n × {r : Run // r.start = i ∧ 0 < r.len ∧ i + r.len ≤ b} :=
    let (⟨k, hk⟩, desc) := findRun lt v i b hi hb
    if k ≥ minRun then
      let v := if desc then Pdq.reverseRange v i (i + k) (by omega) else v
      (v, ⟨⟨i, k, true⟩, rfl, by simp only; omega, by simp only; omega⟩)
    else
      let len := max 1 (min minRun (b - i))
      (v, ⟨⟨i, len, false⟩, rfl, by simp only; omega, by simp only; omega⟩)
  /-- Pops and combines while the stack's top boundary has higher priority than `p`.  The stack
  holds runs that are contiguous, each ending where the next begins, and the last ends where `cur`
  begins. -/
  @[specialize] collapse (v : Vector α n) (stack : Array Entry) (cur : Run) (p : Nat)
      (hcur : cur.start + cur.len ≤ b) : Vector α n × Array Entry × Run :=
    if h : 0 < stack.size then
      let top := stack[stack.size - 1]
      if top.power > p then
        if hc : top.run.start + top.run.len = cur.start then
          let (v, cur') := combine lt v top.run cur hc (by omega)
          if hc' : cur'.start + cur'.len ≤ b then collapse v stack.pop cur' p hc'
          else (v, stack, cur)
        else (v, stack, cur)
      else (v, stack, cur)
    else (v, stack, cur)
  termination_by stack.size
  decreasing_by simp only [Array.size_pop]; omega
  /-- Takes in runs from left to right. -/
  @[specialize] loop (v : Vector α n) (stack : Array Entry)
      (cur : {r : Run // lo ≤ r.start ∧ 0 < r.len ∧ r.start + r.len ≤ b})
      (minRun total : Nat) : Vector α n :=
    let ⟨c, hc⟩ := cur
    if h : c.start + c.len < b then
      let (v, ⟨nx, hnx⟩) := nextRun v (c.start + c.len) minRun h
      let p := power (c.start - lo) c.len nx.len total
      let (v, stack, c') := collapse v stack c p (by omega)
      let stack := stack.push ⟨c', p⟩
      loop v stack ⟨nx, by omega, hnx.2.1, by omega⟩ minRun total
    else
      finish v stack c (by omega)
  termination_by b - cur.1.start
  decreasing_by all_goals omega
  /-- Combines everything left on the stack, and sorts the result if it is still unsorted. -/
  @[specialize] finish (v : Vector α n) (stack : Array Entry) (cur : Run)
      (hcur : cur.start + cur.len ≤ b) : Vector α n :=
    if h : 0 < stack.size then
      let top := stack[stack.size - 1]
      if hc : top.run.start + top.run.len = cur.start then
        let (v, cur') := combine lt v top.run cur hc (by omega)
        if hc' : cur'.start + cur'.len ≤ b then finish v stack.pop cur' hc' else v
      else v
    else sortRun lt v cur (by omega)
  termination_by stack.size
  decreasing_by simp only [Array.size_pop]; omega

/-- Sorts `as[lo..=hi]` in place, with the same interface as `Array.qsort`; `k` as in `sort`. -/
@[inline] def qsortK (k : Nat) (as : Array α) (lt : α → α → Bool := by exact (· < ·))
    (lo := 0) (hi := as.size - 1) : Array α :=
  if h : as.size = 0 then as
  else
    let lo := min lo (as.size - 1)
    let hi := max lo (min hi (as.size - 1))
    (sort lt k as.toVector lo (hi + 1) (by omega) (by omega)).toArray

/-- The driftsort-like front end (`k = 0`). -/
@[inline] def qsort (as : Array α) (lt : α → α → Bool := by exact (· < ·))
    (lo := 0) (hi := as.size - 1) : Array α :=
  qsortK 0 as lt lo hi

end Adaptive
