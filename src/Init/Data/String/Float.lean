/-
Copyright (c) 2026 Matthias Goergens. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Matthias Goergens
-/
module

prelude
public import Init.Data.String.Search
public import Init.Data.OfScientific
import Init.Data.String.Iterate

set_option doc.verso true

public section

namespace String.Slice

/-- Splits {name}`s` at the first character satisfying {name}`p`, without that character. -/
private def splitAtFirst? (s : Slice) (p : Char → Bool) : Option (Slice × Slice) :=
  (s.find? p).map fun pos => (s.sliceTo pos, (s.sliceFrom pos).drop 1)

/--
The value and the number of digits of a possibly empty run of decimal digits, with {lit}`_` allowed
between digits as in {name}`String.Slice.toNat?`, or {name}`none` if it is not such a run.
-/
private def digitRun? (s : Slice) : Option (Nat × Nat) :=
  if s.isEmpty then some (0, 0)
  else if s.isNat then
    some (s.foldl (fun n c => if c = '_' then n else n * 10 + (c.toNat - '0'.toNat)) 0,
      s.foldl (fun k c => if c = '_' then k else k + 1) 0)
  else none

/--
Splits a decimal number with an optional {lit}`-`, fraction and exponent into
{lit}`(negative, mantissa, exponent)`, with the value {lit}`±mantissa * 10 ^ exponent`.
-/
private def decimalParts? (s : Slice) : Option (Bool × Nat × Int) := do
  let (negative, s) := match s.dropPrefix? '-' with
    | some rest => (true, rest)
    | none => (false, s)
  let (mantissa, exponent) ← match splitAtFirst? s (fun c => c = 'e' || c = 'E') with
    | some (mantissa, exp) =>
      let (expNegative, exp) := match exp.dropPrefix? '-', exp.dropPrefix? '+' with
        | some rest, _ => (true, rest)
        | none, some rest => (false, rest)
        | none, none => (false, exp)
      exp.toNat?.map fun e => (mantissa, if expNegative then -(e : Int) else e)
    | none => some (s, 0)
  let (intPart, fracPart) := match splitAtFirst? mantissa (· = '.') with
    | some parts => parts
    | none => (mantissa, mantissa.sliceFrom mantissa.endPos)
  let (i, intDigits) ← digitRun? intPart
  let (f, fracDigits) ← digitRun? fracPart
  guard (intDigits + fracDigits > 0)
  return (negative, i * 10 ^ fracDigits + f, exponent - fracDigits)

/--
Interprets a slice as a floating-point number, returning the nearest {name}`Float` (ties to even),
or {name}`none` if the slice is not a number.

Accepted are an optional {lit}`-`, decimal digits with an optional fraction after {lit}`.`, and an
optional exponent after {lit}`e` or {lit}`E` with an optional sign, as well as {lit}`inf`,
{lit}`-inf` and {lit}`NaN`. Underscores ({lit}`_`) are allowed between digits. This reads back
what {name}`Float.toString` writes.

Examples:
 * {lean}`"0.1".toSlice.toFloat? = some 0.1`
 * {lean}`"-1.5e-3".toSlice.toFloat? = some (-0.0015)`
 * {lean}`"1e400".toSlice.toFloat? = some Float.inf`
 * {lean}`"1_000.5".toSlice.toFloat? = some 1000.5`
 * {lean}`".5".toSlice.toFloat? = some 0.5`
 * {lean}`"0x10".toSlice.toFloat? = none`
-/
def toFloat? (s : Slice) : Option Float :=
  if s == "inf".toSlice then some Float.inf
  else if s == "-inf".toSlice then some (-Float.inf)
  else if s == "NaN".toSlice then some Float.nan
  else
    (decimalParts? s).map fun (negative, m, e) =>
      let x : Float := OfScientific.ofScientific m (e < 0) e.natAbs
      if negative then -x else x

/--
Interprets a slice as a floating-point number, as {name}`String.Slice.toFloat?` does, and panics if
it is not a number.

Examples:
 * {lean}`"2.5".toSlice.toFloat! = 2.5`
-/
def toFloat! (s : Slice) : Float :=
  match s.toFloat? with
  | some x => x
  | none => panic! "Float expected"

/--
Interprets a slice as a 32-bit floating-point number, returning the nearest {name}`Float32` (ties to
even), or {name}`none` if the slice is not a number. The accepted syntax is that of
{name}`String.Slice.toFloat?`, and this reads back what {name}`Float32.toString` writes.

Examples:
 * {lean}`"0.1".toSlice.toFloat32? = some 0.1`
 * {lean}`"1e40".toSlice.toFloat32? = some Float32.inf`
-/
def toFloat32? (s : Slice) : Option Float32 :=
  if s == "inf".toSlice then some Float32.inf
  else if s == "-inf".toSlice then some (-Float32.inf)
  else if s == "NaN".toSlice then some Float32.nan
  else
    (decimalParts? s).map fun (negative, m, e) =>
      let x : Float32 := OfScientific.ofScientific m (e < 0) e.natAbs
      if negative then -x else x

/--
Interprets a slice as a 32-bit floating-point number, as {name}`String.Slice.toFloat32?` does, and
panics if it is not a number.

Examples:
 * {lean}`"2.5".toSlice.toFloat32! = 2.5`
-/
def toFloat32! (s : Slice) : Float32 :=
  match s.toFloat32? with
  | some x => x
  | none => panic! "Float32 expected"

end String.Slice

namespace String

/--
Interprets a string as a floating-point number, returning the nearest {name}`Float` (ties to even),
or {name}`none` if the string is not a number. The accepted syntax is that of
{name}`String.Slice.toFloat?`; this reads back what {name}`Float.toString` writes.

Examples:
 * {lean}`"0.1".toFloat? = some 0.1`
 * {lean}`"-inf".toFloat? = some (-Float.inf)`
 * {lean}`"1.5f".toFloat? = none`
-/
@[inline] def toFloat? (s : String) : Option Float :=
  s.toSlice.toFloat?

/--
Interprets a string as a floating-point number, as {name}`String.toFloat?` does, and panics if it
is not a number.
-/
@[inline] def toFloat! (s : String) : Float :=
  s.toSlice.toFloat!

/--
Interprets a string as a 32-bit floating-point number, returning the nearest {name}`Float32` (ties
to even), or {name}`none` if the string is not a number. The accepted syntax is that of
{name}`String.Slice.toFloat?`; this reads back what {name}`Float32.toString` writes.
-/
@[inline] def toFloat32? (s : String) : Option Float32 :=
  s.toSlice.toFloat32?

/--
Interprets a string as a 32-bit floating-point number, as {name}`String.toFloat32?` does, and
panics if it is not a number.
-/
@[inline] def toFloat32! (s : String) : Float32 :=
  s.toSlice.toFloat32!

end String
