/-! Rarely used helpers at `Id`, compiled once here with the comparison called through a closure,
for `Array.qsort` to pass to `sortCoreM` so that call sites do not get copies of them. -/

/-- `heapSortM` at `Id`, compiled once. -/
@[noinline] def heapSortId (lt : α → α → Id (ULift.{u} Bool)) (xs : Vector α n) (a b : Nat)
    (hab : a ≤ b) (hb : b ≤ n) : Id (Vector α n) :=
  heapSortM lt xs a b hab hb

/-- `partialInsertionSortM` at `Id`, compiled once. -/
@[noinline] def partialInsertionSortId (lt : α → α → Id (ULift.{u} Bool)) (xs : Vector α n)
    (a b : Nat) (hab : a < b) (hb : b ≤ n) : Id (Vector α n × Bool) :=
  partialInsertionSortM lt xs a b hab hb

/-- `partitionEqualM` at `Id`, compiled once. -/
@[noinline] def partitionEqualId (lt : α → α → Id (ULift.{u} Bool)) (xs : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) : Id (Vector α n × {mid : Nat // a < mid ∧ mid ≤ b}) :=
  partitionEqualM lt xs a b pivot hb

