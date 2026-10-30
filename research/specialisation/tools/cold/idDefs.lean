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

