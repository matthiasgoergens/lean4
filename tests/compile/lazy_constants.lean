/-!
Top-level constants are initialised lazily: a constant is computed when it is first read, not by
the module initialiser before `main` runs, and a constant nothing reads is never computed. The
side effects below (hidden behind `unsafeBaseIO`, which is allowed to run them at any time, or
never) make the evaluation order visible; the interpreter has always evaluated constants on demand,
so compiled and interpreted runs print the same.
-/

unsafe def noisyNatImpl : Nat := unsafeBaseIO do
  discard <| (IO.println "computing noisyNat").toBaseIO
  return (List.range 1000).foldl (· + ·) 0

@[implemented_by noisyNatImpl] opaque noisyNat : Nat

unsafe def noisyU64Impl : UInt64 := unsafeBaseIO do
  discard <| (IO.println "computing noisyU64").toBaseIO
  return ((List.range 100).foldl (· + ·) 0).toUInt64

@[implemented_by noisyU64Impl] opaque noisyU64 : UInt64

unsafe def noisyFloatImpl : Float := unsafeBaseIO do
  discard <| (IO.println "computing noisyFloat").toBaseIO
  return 1.5

@[implemented_by noisyFloatImpl] opaque noisyFloat : Float

unsafe def neverReadImpl : Nat := unsafeBaseIO do
  discard <| (IO.println "computing neverRead (must not happen)").toBaseIO
  return 0

@[implemented_by neverReadImpl] opaque neverRead : Nat

/-- Reads another lazy constant. -/
def derived : Nat := noisyNat + 1

def main : IO Unit := do
  IO.println "main started"
  IO.println s!"noisyNat = {noisyNat}"
  IO.println s!"noisyNat again = {noisyNat}"
  IO.println s!"derived = {derived}"
  IO.println s!"noisyU64 = {noisyU64}"
  IO.println s!"noisyFloat = {noisyFloat}"
