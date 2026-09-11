import SplitProd
import Std

/-!
Application-adjacent ByteArray scan workload for the loop-state diagnostic.

The four variants share the same checked byte access and checksum recurrence:
`x := (x + byte + 0x9e3779b9) * 0x100000001b3`, followed by a round-final
`x ^^^ (x >>> 33)`. Only the inner iteration/state representation differs.
This is a transfer diagnostic, not a claim about a real application.
-/

namespace CompilerStudy.ByteWork

@[inline] def checksumByte (x : UInt64) (byte : UInt8) : UInt64 :=
  (x + UInt64.ofNat byte.toNat + 0x9e3779b9) * 0x100000001b3

@[inline] def finishRound (x : UInt64) : UInt64 := x ^^^ (x >>> 33)

def makeBuf (size : Nat) : ByteArray :=
  Id.run do
    let mut b := ByteArray.empty
    for i in [0:size] do
      b := b.push (UInt8.ofNat ((i * 31 + 7) % 256))
    return b

/- The original Nat-indexed inner while is retained as the expected skip case. -/
@[noinline] def natWhile (rounds : Nat) (buf : ByteArray) (seed : UInt64) : UInt64 :=
  Id.run do
    let mut r : Nat := 0
    let mut x := seed
    while r < rounds do
      let mut i : Nat := 0
      while i < buf.size do
        x := checksumByte x (buf[i]!)
        i := i + 1
      x := finishRound x
      r := r + 1
    return x

/- Two mutable native scalars in the inner loop: the pass-eligible shape. -/
@[noinline] def usizeWhile (rounds : Nat) (buf : ByteArray) (seed : UInt64) : UInt64 :=
  Id.run do
    let mut r : Nat := 0
    let mut x := seed
    while r < rounds do
      let mut i : USize := 0
      while i < buf.size.toUSize do
        x := checksumByte x (buf[i.toNat]!)
        i := i + 1
      x := finishRound x
      r := r + 1
    return x

@[noinline] def usizeFor (rounds : Nat) (buf : ByteArray) (seed : UInt64) : UInt64 :=
  Id.run do
    let mut r : Nat := 0
    let mut x := seed
    while r < rounds do
      for i in (0 : USize)...buf.size.toUSize do
        x := checksumByte x (buf[i.toNat]!)
      x := finishRound x
      r := r + 1
    return x

structure State where
  i : USize
  x : UInt64

@[noinline] def stateWhile (rounds : Nat) (buf : ByteArray) (seed : UInt64) : UInt64 :=
  Id.run do
    let mut r : Nat := 0
    let mut s : State := ⟨0, seed⟩
    while r < rounds do
      while s.i < buf.size.toUSize do
        s := ⟨s.i + 1, checksumByte s.x (buf[s.i.toNat]!)⟩
      s := ⟨0, finishRound s.x⟩
      r := r + 1
    return s.x

def runVariant (name : String) (rounds : Nat) (buf : ByteArray) (seed : UInt64) : IO UInt64 := do
  match name with
  | "nat-while" => return natWhile rounds buf seed
  | "usize-while" => return usizeWhile rounds buf seed
  | "usize-for" => return usizeFor rounds buf seed
  | "state-while" => return stateWhile rounds buf seed
  | _ => throw (IO.userError s!"unknown variant: {name}")

def parseNat (s : String) (fallback : Nat) : Nat :=
  s.toNat?.getD fallback

def runMain (args : List String) : IO Unit := do
  let variant := args.getD 0 "nat-while"
  let size := parseNat (args.getD 1 "1048576") 1048576
  let rounds := parseNat (args.getD 2 "1") 1
  let seed := (parseNat (args.getD 3 "2611923443488327891")
    2611923443488327891).toUInt64
  let buf := makeBuf size
  let warmup ← runVariant variant (rounds / 2) buf seed
  let start ← IO.monoNanosNow
  let result ← runVariant variant rounds buf seed
  let stop ← IO.monoNanosNow
  IO.println s!"{stop - start} {result} {warmup}"

end CompilerStudy.ByteWork

def main (args : List String) : IO Unit :=
  CompilerStudy.ByteWork.runMain args
