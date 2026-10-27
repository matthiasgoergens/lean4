/-!
Checks that the runtime implementations of `Float.toString` and `Float32.toString` agree with their
logical models, `Float.Model.toString` and `Float32.Model.toString`, on special values, the boundaries of
the layout, subnormals, powers of two, and pseudo-random bit patterns.
-/

def model64 (x : Float) : String :=
  x.toModel.toString

def model32 (x : Float32) : String :=
  x.toModel.toString

def specials64 : List Float :=
  [0.0, -0.0, 1.0 / 0.0, -1.0 / 0.0, 0.0 / 0.0, 0.1, 0.1 + 0.2, 1e-4, 1e16, 1e22, 5e-324,
   2.2250738585072014e-308, 1.7976931348623157e308, 9007199254740993.0, 1024.0, 0.5]

def specials32 : List Float32 :=
  [0.0, -0.0, 1.0 / 0.0, 0.0 / 0.0, 0.1, 16777217.0, 3.4028235e38, 1e-45, 1.17549435e-38]

def randomBits (n : Nat) : Array UInt64 := Id.run do
  let mut state : UInt64 := 0x9e3779b97f4a7c15
  let mut out := #[]
  for _ in [0:n] do
    state := state * 6364136223846793005 + 1442695040888963407
    out := out.push state
  return out

def main : IO UInt32 := do
  let bits := randomBits 2000
  let xs := specials64 ++ (bits.toList.map Float.ofBits)
    ++ ((List.range 2098).map fun (i : Nat) => Float.ofBits (i.toUInt64 <<< (52 : UInt64)))
  let ys := specials32 ++ (bits.toList.map fun (b : UInt64) => Float32.ofBits (b >>> 32).toUInt32)
  let bad64 := xs.filter fun x => x.toString != model64 x
  let bad32 := ys.filter fun y => y.toString != model32 y
  for x in bad64.take 5 do IO.println s!"Float: runtime {x.toString}, model {model64 x}"
  for y in bad32.take 5 do IO.println s!"Float32: runtime {y.toString}, model {model32 y}"
  IO.println s!"Float: {xs.length} values, {bad64.length} differences"
  IO.println s!"Float32: {ys.length} values, {bad32.length} differences"
  return if bad64.isEmpty && bad32.isEmpty then 0 else 1
