import Sorts.Pdq

-- Mathlib's `Mathlib.MoveAdd.weight`, copied with `Int` for `ℤ`.
def weight [BEq α] (L : List (α × Bool)) (a : α) : Int :=
  let l := L.length
  match L.find? (Prod.fst · == a) with
    | some (_, b) => if b then - l + (L.idxOf (a, b) : Int) else (L.idxOf (a, b) + 1 : Int)
    | none => 0

def main : IO Unit := do
  let dat := [(0, true), (1, false), (2, true)]
  let lt : Nat → Nat → Bool := (weight dat · ≤ weight dat ·)
  IO.println s!"weights: {(#[0, 1, 2, 3, 4] : Array Nat).map (weight dat)}"
  IO.println s!"old Array.qsort: {(#[0, 1, 2, 3, 4] : Array Nat).qsort lt}"
  IO.println s!"new Pdq.qsort:   {Pdq.qsort (#[0, 1, 2, 3, 4] : Array Nat) lt}"
  IO.println s!"Mathlib expects: #[0, 2, 3, 4, 1]"
