/-!
Checks `Float.toFixed`, `Float.toScientific` and `Float.toPrecision`, and their `Float32`
counterparts, against a reference implementation in exact natural-number arithmetic: positional
and scientific notation with a given number of digits after the point, and `%g`-style output with
a given number of significant digits, all rounded to nearest with ties to even. The inputs are the
examples from the docstrings, special values, and pseudo-random bit patterns at several digit counts.
-/

/-- A finite floating-point number as a sign and an exact value `m * 2 ^ e`. -/
structure Exact where
  negative : Bool
  m : Nat
  e : Int

/-- Decodes IEEE 754 bits with `fractionBits` fraction bits and `exponentBits` exponent bits. -/
def decode (bits : Nat) (fractionBits exponentBits : Nat) : Exact :=
  let fraction := bits % 2 ^ fractionBits
  let biased := bits / 2 ^ fractionBits % 2 ^ exponentBits
  let negative := bits / 2 ^ (fractionBits + exponentBits) == 1
  let bias : Int := 2 ^ (exponentBits - 1) - 1 + fractionBits
  if biased == 0 then ⟨negative, fraction, 1 - bias⟩
  else ⟨negative, fraction + 2 ^ fractionBits, biased - bias⟩

/-- `num / den` rounded to nearest, ties to even. -/
def roundDiv (num den : Nat) : Nat :=
  let q := num / den
  let r := num % den
  if 2 * r > den ∨ (2 * r == den ∧ q % 2 == 1) then q + 1 else q

/-- `x * 10 ^ k` rounded to nearest, ties to even. -/
def scaled (x : Exact) (k : Int) : Nat :=
  let (num, den) := if x.e ≥ 0 then (x.m * 2 ^ x.e.toNat, 1) else (x.m, 2 ^ (-x.e).toNat)
  if k ≥ 0 then roundDiv (num * 10 ^ k.toNat) den else roundDiv num (den * 10 ^ (-k).toNat)

def sign (x : Exact) : String := if x.negative then "-" else ""

def padLeft (s : String) (n : Nat) : String := "".pushn '0' (n - s.length) ++ s

def refFixed (x : Exact) (d : Nat) : String :=
  let s := (padLeft (toString (scaled x d)) (d + 1)).toList
  let intPart := String.ofList (s.take (s.length - d))
  let fracPart := String.ofList (s.drop (s.length - d))
  sign x ++ intPart ++ (if d == 0 then "" else "." ++ fracPart)

/-- Whether `|x| ≥ 10 ^ k`. -/
def atLeast (x : Exact) (k : Int) : Bool :=
  let (num, den) := if x.e ≥ 0 then (x.m * 2 ^ x.e.toNat, 1) else (x.m, 2 ^ (-x.e).toNat)
  if k ≥ 0 then num ≥ 10 ^ k.toNat * den else num * 10 ^ (-k).toNat ≥ den

/-- The digits of `x` rounded to `d + 1` significant digits, and the decimal exponent. -/
def sigDigits (x : Exact) (d : Nat) : Nat × Int := Id.run do
  if x.m == 0 then return (0, 0)
  -- the exponent `k` with `10 ^ k ≤ |x| < 10 ^ (k + 1)`, from a rough start
  let mut k : Int := (Int.ofNat (Nat.log2 x.m) + x.e) * 30103 / 100000
  for _ in [0:8] do
    if !atLeast x k then k := k - 1
    else if atLeast x (k + 1) then k := k + 1
  let n := scaled x (d - k)
  if n == 10 ^ (d + 1) then return (n / 10, k + 1) else return (n, k)

def exponent (k : Int) : String :=
  (if k < 0 then "e-" else "e+") ++ padLeft (toString k.natAbs) 2

def refScientific (x : Exact) (d : Nat) : String :=
  let (n, k) := sigDigits x d
  let s := (padLeft (toString n) (d + 1)).toList
  sign x ++ String.ofList (s.take 1) ++ (if d == 0 then "" else "." ++ String.ofList (s.drop 1)) ++
    exponent k

/-- Removes trailing zeros after a decimal point, and the point if nothing follows it. -/
def stripZeros (s : List Char) : List Char :=
  if s.contains '.' then
    let r := s.reverse.dropWhile (· == '0')
    (if r.head? == some '.' then r.tail else r).reverse
  else s

def refPrecision (x : Exact) (p : Nat) : String :=
  let p := max p 1
  let (_, k) := sigDigits x (p - 1)
  if k < -4 ∨ k ≥ p then
    let (mantissa, exp) := (refScientific x (p - 1)).toList.span (· != 'e')
    String.ofList (stripZeros mantissa ++ exp)
  else
    String.ofList (stripZeros (refFixed x (p - 1 - k).toNat).toList)

def randomBits (n : Nat) : Array UInt64 := Id.run do
  let mut state : UInt64 := 0x9e3779b97f4a7c15
  let mut out := #[]
  for _ in [0:n] do
    state := state * 6364136223846793005 + 1442695040888963407
    out := out.push state
  return out

def digitCounts : List Nat := [0, 1, 2, 3, 6, 10, 17, 25]

/-- Compares the three formats with the reference; prints the first few differences. -/
def report (label : String) (xs : Array (Exact × (Nat → String × String × String))) :
    IO Bool := do
  let mut checked := 0
  let mut failures := 0
  for (x, run) in xs do
    for d in digitCounts do
      let (fixed, sci, prec) := run d
      for (got, want) in [(fixed, refFixed x d), (sci, refScientific x d), (prec, refPrecision x d)] do
        checked := checked + 1
        if got != want then
          if failures < 5 then IO.println s!"{label}: got {got}, expected {want}"
          failures := failures + 1
  IO.println s!"{label}: {checked} checks, {failures} failures"
  return failures == 0

def main : IO UInt32 := do
  IO.println ((2 / 3 : Float).toFixed 2)
  IO.println ((1234.5 : Float).toScientific 2)
  IO.println ((2 / 3 : Float).toPrecision 3)
  IO.println ((1234567 : Float).toPrecision 3)
  IO.println ((0.125 : Float).toFixed 2)
  IO.println ((-0.0 : Float).toFixed 2)
  IO.println ((1e22 : Float).toFixed 0)
  IO.println ((5e-324 : Float).toScientific 3)
  IO.println ((100000 : Float).toPrecision 6)
  IO.println ((100000 : Float).toPrecision 5)
  IO.println ((0.0001 : Float).toPrecision 3)
  IO.println ((0.00001 : Float).toPrecision 3)
  IO.println ((0.1 : Float).toFixed 30)
  IO.println [(1.0 / 0.0 : Float).toFixed 2, (-1.0 / 0.0 : Float).toScientific 2,
    (0.0 / 0.0 : Float).toPrecision 2]
  IO.println ((2 / 3 : Float32).toFixed 2)
  IO.println ((1234567 : Float32).toPrecision 3)
  let bits := randomBits 300
  let floats := bits.filterMap fun (b : UInt64) =>
    let x := Float.ofBits b
    if x.isFinite then
      some (decode b.toNat 52 11, fun d => (x.toFixed d, x.toScientific d, x.toPrecision d))
    else none
  let floats32 := bits.filterMap fun (b : UInt64) =>
    let w : UInt32 := (b >>> 32).toUInt32
    let y := Float32.ofBits w
    if y.isFinite then
      some (decode w.toNat 23 8, fun d => (y.toFixed d, y.toScientific d, y.toPrecision d))
    else none
  let ok64 ← report "Float" floats
  let ok32 ← report "Float32" floats32
  return if ok64 && ok32 then 0 else 1
