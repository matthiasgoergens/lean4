/-- Instantiates the unspecialised helpers at `Id` in this module, so that callers reuse these
copies (experiment). -/
def warmHeap {α : Type} (lt : α → α → Bool) (xs : Vector α n) (a b : Nat) (hab : a ≤ b)
    (hb : b ≤ n) : Vector α n :=
  Id.run (heapSortM (fun x y => pure ⟨lt x y⟩) xs a b hab hb)
/-- See `warmHeap`. -/
def warmPis {α : Type} (lt : α → α → Bool) (xs : Vector α n) (a b : Nat) (hab : a < b)
    (hb : b ≤ n) : Vector α n × Bool :=
  Id.run (partialInsertionSortM (fun x y => pure ⟨lt x y⟩) xs a b hab hb)
/-- See `warmHeap`. -/
def warmPivot {α : Type} (lt : α → α → Bool) (xs : Vector α n) (a b : Nat) (hab : a < b)
    (hb : b ≤ n) : Idx a b × Hint :=
  (Id.run (choosePivotM (fun x y => pure ⟨lt x y⟩) xs a b hab hb)).down

