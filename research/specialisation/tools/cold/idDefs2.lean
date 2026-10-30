/-! Rarely used helpers at `Id`, with the comparison called through a closure: compiled once
here, and passed to `sortCoreM` by `Array.qsort`, so that call sites do not get copies of them. -/

/-- `heapSortM` at `Id`, compiled once. -/
@[noinline] def heapSortId (lt : α → α → Bool) (xs : Vector α n) (a b : Nat) (hab : a ≤ b)
    (hb : b ≤ n) : Id (Vector α n) :=
  heapSortM (fun x y => pure ⟨lt x y⟩) xs a b hab hb

/-- `partialInsertionSortM` at `Id`, compiled once. -/
@[noinline] def partialInsertionSortId (lt : α → α → Bool) (xs : Vector α n) (a b : Nat)
    (hab : a < b) (hb : b ≤ n) : Id (Vector α n × Bool) :=
  partialInsertionSortM (fun x y => pure ⟨lt x y⟩) xs a b hab hb

/-- `partitionEqualM` at `Id`, compiled once. -/
@[noinline] def partitionEqualId (lt : α → α → Bool) (xs : Vector α n) (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) : Id (Vector α n × {mid : Nat // a < mid ∧ mid ≤ b}) :=
  partitionEqualM (fun x y => pure ⟨lt x y⟩) xs a b pivot hb

