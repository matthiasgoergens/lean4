/-!
`Nat.repr` at runtime (`Nat.reprFast`) agrees with `Nat.toDigits` on numbers around the boundaries
of its code paths: the table of small numbers, `USize.size` on 32- and 64-bit platforms, the leaf
chunks of 9 and 18 digits and their squares, and lower halves that need many leading zeros. Numbers
with a million digits are checked against their known decimal forms.
-/

def viaToDigits (n : Nat) : String := String.ofList (Nat.toDigits 10 n)

def cases : Array Nat := Id.run do
  let mut ns := #[]
  for e in [0:160] do
    ns := ns.push (10 ^ e - 1) |>.push (10 ^ e) |>.push (10 ^ e + 1)
  for e in [0:300] do
    ns := ns.push (2 ^ e - 1) |>.push (2 ^ e) |>.push (2 ^ e + 1)
  for a in [1:80] do
    for b in [1:80] do
      ns := ns.push (7 * 10 ^ (a + b) + 3 * 10 ^ b + 1)
  ns := ns.push (3 ^ 5000) |>.push (7 ^ 20000) |>.push (10 ^ 20000 - 1) |>.push (10 ^ 20000 + 1)
  return ns

def main : IO Unit := do
  let mut mismatches := 0
  for n in cases do
    unless toString n == viaToDigits n do
      mismatches := mismatches + 1
      IO.println s!"mismatch: {viaToDigits n}"
  IO.println s!"{cases.size} cases, {mismatches} mismatches"
  for k in [100000, 1000000] do
    IO.println s!"10 ^ {k} - 1: {toString (10 ^ k - 1) == "".pushn '9' k}"
    IO.println s!"10 ^ {k}: {toString (10 ^ k) == "1".pushn '0' k}"
  -- The compiler folds these at compile time, through `Nat.reprFast`.
  IO.println (toString (2 ^ 64))
  IO.println (toString (10 ^ 40 + 10 ^ 3))
