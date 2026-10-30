/-- Instantiates the unspecialised helpers at `Id` in this module, for callers to reuse
(an experiment: the specialisation cache is keyed on the monad instance alone for them). -/
def warmHeap {α : Type} (lt : α → α → Bool) (v : Vector α n) (a b : Nat) (hab : a ≤ b)
    (hb : b ≤ n) : Vector α n :=
  Id.run (heapSortM (fun x y => pure ⟨lt x y⟩) v a b hab hb)

