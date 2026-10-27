/-!
Checks `String.toFloat?` and `String.toFloat32?`: the accepted syntax (sign, fraction, exponent,
digit separators, `inf` and `NaN`), strings that must be rejected, `toFloat!` and `toFloat32!`,
and that reading back what `Float.toString` and `Float32.toString` write gives the same bits for
pseudo-random values.
-/

def accepted : List String :=
  ["0", "-0", "0.1", "-1.5e-3", "1e400", "-1e400", "1e-400", "1_000.5", "1.", ".5", "1E+3",
   "123456789012345678901234567890", "4.9406564584124654e-324", "inf", "-inf", "NaN"]

def rejected : List String :=
  ["", "-", ".", "+1", "1e", "1e+", "e5", "0x10", " 1", "1 ", "1..2", "_1", "1_", "1__0", "1._5",
   "infinity", "nan", "1.5f", "--1"]

def randomBits (n : Nat) : Array UInt64 := Id.run do
  let mut state : UInt64 := 0x9e3779b97f4a7c15
  let mut out := #[]
  for _ in [0:n] do
    state := state * 6364136223846793005 + 1442695040888963407
    out := out.push state
  return out

def main : IO UInt32 := do
  for s in accepted do
    IO.println s!"{repr s}: {s.toFloat?.map toString}, {s.toFloat32?.map toString}"
  let wrong := rejected.filter fun s => s.toFloat?.isSome || s.toFloat32?.isSome
  IO.println s!"rejected wrongly: {wrong}"
  IO.println s!"toFloat!: {"2.5".toFloat!}, {"-1e-3".toFloat!}; toFloat32!: {"2.5".toFloat32!}"
  let bits := randomBits 2000
  let failures64 := bits.filter fun (b : UInt64) =>
    let x := Float.ofBits b
    (x.toString.toFloat?.map Float.toBits) != some x.toBits
  let failures32 := bits.filter fun (b : UInt64) =>
    let y := Float32.ofBits (b >>> 32).toUInt32
    (y.toString.toFloat32?.map Float32.toBits) != some y.toBits
  IO.println s!"Float round trip: {failures64.size} failures"
  IO.println s!"Float32 round trip: {failures32.size} failures"
  return if wrong.isEmpty && failures64.isEmpty && failures32.isEmpty then 0 else 1
