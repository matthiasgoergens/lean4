import SplitProd
import Std

/-!
Deterministic semantic workload for the experimental `SplitProd` compiler pass.

The pass is enabled by the compiler option `compiler.splitProd`; this file is
compiled once with that option off and once with it on. Every reported value
and effect trace is independent of wall-clock time. Keep the input at most 50:
the default is deliberately small because several cases recurse directly.

Positive cases exercise three representative native scalar pair forms used by the pass,
recursive pair state, a returned pair (the wrapper boundary), aliases and
escaping values, non-tail recursion, partial application, and an `IO.Ref`
trace. The object/scalar pair and two-pair cases are negative controls: the
current pass should leave them unchanged.
-/

namespace CompilerStudy

@[inline] def mix (i x : UInt64) : UInt64 :=
  let x := (x ^^^ (i + 0x9e3779b97f4a7c15)) * 0xbf58476d1ce4e5b9
  let x := x ^^^ (x >>> 29)
  let x := x * 0x94d049bb133111eb
  x ^^^ (x >>> 31)

@[noinline] partial def tailPair (n : USize) (s : USize × UInt64) : UInt64 :=
  if s.1 < n then
    tailPair n (s.1 + 1, mix s.1.toUInt64 s.2)
  else
    s.2

@[noinline] partial def returnPair (n : USize) (s : USize × UInt64) : USize × UInt64 :=
  if s.1 < n then
    returnPair n (s.1 + 1, mix s.1.toUInt64 s.2)
  else
    s

/- The alias exercises projection and let-bound state in the worker body. -/
@[noinline] partial def sharedPair (n : USize) (s : USize × UInt64) : UInt64 :=
  let shared := s
  if shared.1 < n then
    sharedPair n (shared.1 + 1, mix shared.1.toUInt64 shared.2)
  else
    shared.2

@[noinline] partial def nonTailPair (n : USize) (s : USize × UInt64) : UInt64 :=
  if s.1 < n then
    let rest := nonTailPair n (s.1 + 1, mix s.1.toUInt64 s.2)
    mix s.1.toUInt64 rest
  else
    s.2

@[noinline, nospecialize] def applyPair (worker : USize × UInt64 → UInt64)
    (s : USize × UInt64) : UInt64 :=
  worker s

/- The recursive helper is partially applied before its pair argument arrives;
   the adapter prevents immediate beta reduction of the closure call. -/
@[noinline] def partialApplied (n : USize) (s : USize × UInt64) : UInt64 :=
  applyPair (tailPair n) s

@[noinline] partial def pair32 (n : USize) (s : UInt32 × UInt16) : UInt64 :=
  if s.1.toUInt64 < n.toUInt64 then
    let x := mix s.1.toUInt64 s.2.toUInt64
    pair32 n (s.1 + 1, x.toUInt16)
  else
    s.2.toUInt64

@[noinline] partial def pair8 (n : USize) (s : UInt8 × UInt64) : UInt64 :=
  if s.1.toUInt64 < n.toUInt64 then
    pair8 n (s.1 + 1, mix s.1.toUInt64 s.2)
  else
    s.2

@[noinline] partial def effectPair (log : IO.Ref (Array UInt64)) (n : USize)
    (s : USize × UInt64) : IO UInt64 := do
  if s.1 < n then
    log.modify fun xs => xs.push s.1.toUInt64
    effectPair log n (s.1 + 1, mix s.1.toUInt64 s.2)
  else
    return s.2

def observeEffect (n : USize) (seed : UInt64) : IO (UInt64 × Array UInt64) := do
  let log ← IO.mkRef (#[] : Array UInt64)
  let result ← effectPair log n (0, seed)
  let trace ← log.get
  return (result, trace)

/- The pair escapes into an object array on every recursive step. -/
@[noinline] partial def escapingPair (n : USize) (seen : Array (USize × UInt64))
    (s : USize × UInt64) : Array (USize × UInt64) :=
  let seen := seen.push s
  if s.1 < n then
    escapingPair n seen (s.1 + 1, mix s.1.toUInt64 s.2)
  else
    seen

/- Loop control-flow cases are separate so small inputs can exercise each
   construct without one early exit hiding another construct. -/
@[noinline] def whileBreakContinue (n : USize) (seed : UInt64) : UInt64 := Id.run do
  let mut i : USize := 0
  let mut x := seed
  while i < n do
    i := i + 1
    if i % 3 == 0 then
      continue
    if i > 3 && i % 7 == 0 then
      break
    x := mix i.toUInt64 x
  return x

@[noinline] def whileEarlyReturn (n : USize) (seed : UInt64) : UInt64 := Id.run do
  let mut i : USize := 0
  let mut x := seed
  while i < n do
    if n > 3 && i == n / 2 then
      return x
    x := mix i.toUInt64 x
    i := i + 1
  return x

@[noinline] def nestedLoops (n : USize) (seed : UInt64) : UInt64 := Id.run do
  let mut outer : USize := 0
  let mut x := seed
  while outer < n do
    let mut inner : USize := 0
    while inner <= outer do
      x := mix (outer.toUInt64 + inner.toUInt64) x
      inner := inner + 1
    outer := outer + 1
  return x

structure Box where
  label : String
  value : UInt64

/- Negative control: `Box` is an object, so `Box × UInt64` is not a scalar pair.
   The separate fuel argument keeps this case bounded without depending on the
   evolving scalar payload. -/
@[noinline] partial def mixedObjectPair (fuel : USize) (s : Box × UInt64) : UInt64 :=
  if fuel == 0 then
    s.1.value + s.1.label.utf8ByteSize.toUInt64
  else
    mixedObjectPair (fuel - 1)
      ((⟨s.1.label ++ ".", s.1.value + 1⟩ : Box), mix s.2 s.1.value)

/- Negative control: two pair parameters make the candidate set non-singleton. -/
@[noinline] partial def multiplePairs (n : USize) (a : USize × UInt64)
    (b : UInt32 × UInt16) : UInt64 :=
  if a.1 < n then
    multiplePairs n (a.1 + 1, mix a.1.toUInt64 a.2) b
  else
    b.1.toUInt64 + b.2.toUInt64 + a.2

/- Independent references for the scalar-pair results. They use a `Nat` range
   and one scalar accumulator, rather than reproducing the recursive pair
   state or its `USize` loop condition. -/
@[noinline] def referenceTail (n : USize) (seed : UInt64) : UInt64 := Id.run do
  let mut x := seed
  for i in [0:n.toNat] do
    x := mix i.toUInt64 x
  return x

@[noinline] def reference32 (n : USize) (seed : UInt16) : UInt64 := Id.run do
  let mut x := seed
  for i in [0:n.toNat] do
    x := (mix i.toUInt64 x.toUInt64).toUInt16
  return x.toUInt64

@[noinline] def reference8 (n : USize) (seed : UInt64) : UInt64 := Id.run do
  let mut x := seed
  for i in [0:n.toNat] do
    x := mix i.toUInt64 x
  return x

def parseNat (s : String) (fallback : Nat) : Nat :=
  s.toNat?.getD fallback

def formatTrace (xs : Array UInt64) : String :=
  "[" ++ String.intercalate "," (xs.toList.map fun x => s!"{x}") ++ "]"

def formatPairs (xs : Array (USize × UInt64)) : String :=
  "[" ++ String.intercalate "," (xs.toList.map fun x => s!"({x.1},{x.2})") ++ "]"

def check (name : String) (actual expected : UInt64) : IO Unit := do
  unless actual == expected do
    throw (IO.userError s!"check failed: {name}: {actual} != {expected}")
  IO.println s!"check.{name}=ok"

def main (args : List String) : IO Unit := do
  let nNat := min (parseNat (args.getD 0 "8") 8) 50
  let n := nNat.toUSize
  let seed := (parseNat (args.getD 1 "2611923443488327891") 2611923443488327891).toUInt64
  let tail := tailPair n (0, seed)
  let returned := returnPair n (0, seed)
  let shared := sharedPair n (0, seed)
  let nonTail := nonTailPair n (0, seed)
  let partialResult := partialApplied n (0, seed)
  let escaped := escapingPair n #[] (0, seed)
  let out32 := pair32 n (0, seed.toUInt16)
  let out8 := pair8 n (0, seed)
  let (effect, trace) ← observeEffect n seed
  let controls := whileBreakContinue n seed
  let early := whileEarlyReturn n seed
  let nested := nestedLoops n seed
  let mixed := mixedObjectPair n ((⟨"seed", seed⟩ : Box), seed)
  let many := multiplePairs n (0, seed) (0, seed.toUInt16)
  IO.println s!"input.n={nNat} input.seed={seed}"
  IO.println s!"tailPair={tail}"
  IO.println s!"returnPair=({returned.1},{returned.2})"
  IO.println s!"sharedPair={shared}"
  IO.println s!"nonTailPair={nonTail}"
  IO.println s!"partialApplied={partialResult}"
  IO.println s!"escapingPair={formatPairs escaped}"
  IO.println s!"pair32={out32}"
  IO.println s!"pair8={out8}"
  IO.println s!"effectPair={effect} effectTrace={formatTrace trace}"
  IO.println s!"whileBreakContinue={controls}"
  IO.println s!"whileEarlyReturn={early}"
  IO.println s!"nestedLoops={nested}"
  IO.println s!"mixedObjectPair={mixed}"
  IO.println s!"multiplePairs={many}"
  check "tailPair" tail (referenceTail n seed)
  check "returnPair" returned.2 (referenceTail n seed)
  check "sharedPair" shared (referenceTail n seed)
  check "partialApplied" partialResult (referenceTail n seed)
  check "pair32" out32 (reference32 n seed.toUInt16)
  check "pair8" out8 (reference8 n seed)
  check "effectPair" effect (referenceTail n seed)

end CompilerStudy

def main (args : List String) : IO Unit :=
  CompilerStudy.main args
