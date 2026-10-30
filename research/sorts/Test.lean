import Sorts.Pdq
import Sorts.Adaptive
import Sorts.PdqLab

/-!
`sorttest`: sorts random subranges `[lo, hi]` of random arrays (including `lo`/`hi` past the end and
`hi < lo`) and checks the result against `Array.qsort`'s contract: same size, the elements outside
the clamped range unchanged, and the range sorted and a permutation of what it held.  Keys come
from small ranges, so that equal keys are common.
-/

def xorshift (x : UInt64) : UInt64 :=
  let x := x ^^^ (x <<< 13)
  let x := x ^^^ (x >>> 7)
  x ^^^ (x <<< 17)

/-- What `Array.qsort as lt lo hi` must return, by core's (proved) merge sort. -/
def spec (as : Array Nat) (lo hi : Nat) : Array Nat :=
  if as.size = 0 then as
  else
    let lo := min lo (as.size - 1)
    let hi := max lo (min hi (as.size - 1))
    as.extract 0 lo ++ (as.extract lo (hi + 1)).mergeSort ++ as.extract (hi + 1) as.size

def main : IO UInt32 := do
  let mut x : UInt64 := 0x9E3779B97F4A7C15
  let mut failures := 0
  let mut cases := 0
  for _ in [0:20000] do
    x := xorshift x
    let n := (x % 300).toNat
    x := xorshift x
    let keys := (x % 64).toNat + 1
    let mut as : Array Nat := #[]
    -- Half the arrays carry runs, so that the adaptive front end merges.
    x := xorshift x
    let runny := x % 2 == 0
    for i in [0:n] do
      x := xorshift x
      as := as.push (if runny then (i * 7 + (x % 3).toNat) % (keys * 8) else (x % keys.toUInt64).toNat)
    x := xorshift x
    let lo := (x % (n.toUInt64 + 3)).toNat
    x := xorshift x
    let hi := (x % (n.toUInt64 + 3)).toNat
    let want := spec as lo hi
    let lab (name : String) : String × Array Nat :=
      (name, match PdqLab.Config.parse name with
        | some cfg => PdqLab.qsort cfg as (· < ·) lo hi
        | none => #[])
    for (name, got) in [("pdq", Pdq.qsort as (· < ·) lo hi), ("adaptive", Adaptive.qsort as (· < ·) lo hi),
        ("onerun", Adaptive.qsortK 1 as (· < ·) lo hi), ("fewruns4", Adaptive.qsortK 4 as (· < ·) lo hi),
        lab "lab:bh", lab "lab:bh,c24", lab "lab:brk9", lab "lab:lomuto,bl,c24,brk9",
        lab "lab:hyb,bl,c24,brk9", lab "lab:lomuto,bl2,c24", lab "lab:lomuto,ends,c24,brk9",
        lab "lab:hyb,ends,c24,brk9", lab "lab:hyb,bl2,c24,brk9", lab "lab:lomuto,ends,c24,brk9,pis8",
        lab "lab:pis8", lab "lab:lomuto,ends,c24,brk9,hybp", lab "lab:lomuto,ends,c24,brk9,nochild",
        lab "lab:pisx,c24", lab "lab:lomuto,ends,c24,brk9,pisx", lab "lab:lomuto,ends,c24,brk9,pisx,pred",
        lab "lab:lomuto,ends,brk9,pisx,pred", lab "lab:lomuto,ends,c24,brk9,pisx6,pred6",
        lab "lab:lomuto,ends,c24,brk9,pisx6,pred8", lab "lab:pisx6,c24"] do
      cases := cases + 1
      if got != want then
        failures := failures + 1
        if failures ≤ 5 then
          IO.eprintln s!"{name} lo={lo} hi={hi} input={as}\n  got  {got}\n  want {want}"
    -- And the default range.
    cases := cases + 2
    unless Pdq.qsort as (· < ·) == as.mergeSort && Adaptive.qsort as (· < ·) == as.mergeSort do
      failures := failures + 1
  IO.println s!"{cases} cases, {failures} failures"
  return if failures = 0 then 0 else 1
