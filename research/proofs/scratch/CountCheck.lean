import Sorts.PdqCost
open Pdq

/-- Calls of `lt` counted by a side effect, to check `qsortComparisons` against the code that
`Pdq.qsort` actually runs. -/
@[noinline] unsafe def tick (r : IO.Ref Nat) (x : Nat) : Nat :=
  unsafeBaseIO (do r.modify (· + 1); pure x)

unsafe def countedCalls (as : Array Nat) (lt : Nat → Nat → Bool) (lo hi : Nat) : IO Nat := do
  let r ← IO.mkRef 0
  let lt' := fun x y => lt (tick r x) y
  let out := Pdq.qsort as lt' lo hi
  -- force the result
  if out.size == 12345678 then IO.println "?"
  r.get

def bound (as : Array Nat) (lo hi : Nat) : Nat :=
  let lo' := min lo (as.size - 1)
  let hi' := max lo' (min hi (as.size - 1))
  let len := hi' + 1 - lo'
  130 * (len * (Nat.log2 len + 1)) + 39 * len

def xs (n seed : Nat) : Array Nat := Id.run do
  let mut x : UInt64 := seed.toUInt64 * 2654435761 + 1
  let mut a := #[]
  for _ in [0:n] do
    x := x ^^^ (x <<< 13); x := x ^^^ (x >>> 7); x := x ^^^ (x <<< 17)
    a := a.push (x % 1000).toNat
  return a

def randLt (seed : Nat) (x y : Nat) : Bool := (mixHash (hash x) (mixHash (hash y) seed.toUInt64)) % 3 == 0

unsafe def main : IO Unit := do
  let lts : List (String × (Nat → Nat → Bool)) := [("lt", fun x y => decide (x < y)), ("true", fun _ _ => true), ("false", fun _ _ => false),
      ("rand", randLt 7), ("gt", fun x y => decide (x > y))]
  for (name, lt) in lts do
    for n in [0, 1, 5, 13, 50, 200, 1000, 5000] do
      let as := xs n 3
      let c ← countedCalls as lt 0 (n - 1)
      let q := qsortComparisons as lt 0 (n - 1)
      IO.println s!"{name} n={n} counted={c} qsortComparisons={q} bound={bound as 0 (n - 1)} agree={c == q}"
  -- a subrange
  let as := xs 3000 5
  let c ← countedCalls as (randLt 3) 700 2100
  IO.println s!"subrange counted={c} qsortComparisons={qsortComparisons as (randLt 3) 700 2100} bound={bound as 700 2100}"

#eval main
