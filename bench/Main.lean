/-!
`qsortbench ALGO TYPE PATTERN N [CHUNK [nocheck]]`: sorts one generated array (or, given a non-zero
CHUNK, its consecutive pieces of CHUNK elements, each as its own array) with core's `Array.qsort`,
prints `ns=<time of the sort alone> hash=<hash of the result>`, then checks the result against
core's `Array.mergeSort` on a fresh copy of the input (so that the timed array is unshared) and
fails loudly if it differs; `nocheck` skips that check, for timing runs whose hashes are compared
across toolchains instead.

The same source is compiled by each toolchain, so `core` is the old `Array.qsort` in one binary
and the new one in the other.  Adapted from `sorts/Main.lean` of the research harness (b629463),
with the lab's own sorts and the `pair` type left out.

ALGO: `none` (the identity, a baseline that does everything but sort), `core` (`Array.qsort`, or
`Array.qsortOrd` for `u64`).
TYPE: `nat` (unboxed `Nat`), `u64` (boxed `UInt64` through `Ord`, as Lean's `io_compute` benchmark
sorts), `str` (zero-padded decimal `String`s, so string order is numeric order), `rec` (a structure
with a `Nat` key and a `String`, sorted by the key).
-/

def xorshift (x : UInt64) : UInt64 :=
  let x := x ^^^ (x <<< 13)
  let x := x ^^^ (x >>> 7)
  x ^^^ (x <<< 17)

/-- `n` pseudo-random 64-bit values. -/
def randoms (n : Nat) (seed : UInt64 := 88172645463325252) : Array UInt64 := Id.run do
  let mut x := seed
  let mut a := Array.mkEmpty n
  for _ in [0:n] do
    x := xorshift x
    a := a.push x
  return a

/-- Sorted, then `k` pseudo-random pairs swapped. -/
def nearlyK (n k : Nat) : Array Nat := Id.run do
  let mut a := Array.range n
  let mut x : UInt64 := 12345
  for _ in [0:k] do
    x := xorshift x
    let i := (x % n.toUInt64).toNat
    x := xorshift x
    let j := (x % n.toUInt64).toNat
    a := a.swapIfInBounds i j
  return a

/-- The input patterns, as 62-bit values. -/
def pattern (name : String) (n : Nat) : Except String (Array Nat) :=
  let r := randoms n
  let ofFn (f : Nat → Nat) : Array Nat := (Array.range n).map f
  match name with
  | "random" => .ok <| r.map fun (x : UInt64) => (x >>> 2).toNat
  | "dups4" => .ok <| r.map fun (x : UInt64) => (x % 4).toNat
  | "constant" => .ok <| Array.replicate n 0
  | "sorted" => .ok <| ofFn id
  | "reversed" => .ok <| ofFn (n - ·)
  | "organ" => .ok <| ofFn fun i => if i < n / 2 then i else n - i
  -- Sorted, then eight random pairs swapped (somombo's first case on PR 14653).
  | "nearly" => .ok <| nearlyK n 8
  -- `[1, …, n-1, 0]`, the order of `Array.range' 1 n |>.push 0` (#8087; Bubbler-4's case on PR
  -- 14653): median of three always picks the second smallest.
  | "pathological" => .ok <| ofFn fun i => if i + 1 = n then 0 else i + 1
  | "runs2" => .ok <| ofFn fun i => if i < n / 2 then 2 * i else 2 * (i - n / 2) + 1
  -- Skewed duplicates: log-uniform ranks (key k has probability about proportional to 1/k), so a few
  -- keys are very frequent and the rest form a long tail (word counts, ids, status codes).
  | "zipf" => .ok <| r.map fun (x : UInt64) =>
    (Float.exp ((x >>> 11).toFloat / 9007199254740992.0 * Float.log n.toFloat)).toUInt64.toNat
  | _ =>
    -- `nearlyK`: sorted, then K pseudo-random pairs swapped (`nearly` is K = 8).
    if let some k := (name.dropPrefix? "nearly").bind (·.toString.toNat?) then
      .ok <| nearlyK n k
    -- `jitterD`: sorted, but every key moved by a pseudo-random amount below D, so every element is
    -- within about D places of its sorted position (timestamps from several clocks, buffered logs).
    else if let some d := (name.dropPrefix? "jitter").bind (·.toString.toNat?) then
      .ok <| (r.zipIdx).map fun ((x : UInt64), i) => i * 4 + (x % (4 * d.toUInt64 + 1)).toNat
    else .error s!"unknown pattern {name}"

def mix (h x : UInt64) : UInt64 := (h ^^^ x) * 1099511628211

def pad (k : Nat) : String :=
  let s := toString k
  "".pushn '0' (20 - s.length) ++ s

/-- Splits `a` into consecutive arrays of `chunk` elements (all of it when `chunk = 0`). -/
def chunks (a : Array α) (chunk : Nat) : Array (Array α) :=
  if chunk = 0 then #[a]
  else (Array.range ((a.size + chunk - 1) / chunk)).map fun j => a.extract (j * chunk) (j * chunk + chunk)

/-- Sorts every chunk in place and returns the time it took. -/
def timed [Inhabited α] (cs : Array (Array α)) (sort : Array α → Array α) :
    IO (Array (Array α) × Nat) := do
  let size := cs.foldl (· + ·.size) 0
  let t0 ← IO.monoNanosNow
  let mut cs := cs
  for i in [0:cs.size] do
    cs := cs.modify i sort
  unless cs.foldl (· + ·.size) 0 = size do throw <| .userError "the sort changed the size"
  let t1 ← IO.monoNanosNow
  return (cs, t1 - t0)

def report (ns : Nat) (h : UInt64) (ok : Bool) : IO Unit := do
  unless ok do throw <| .userError "the result differs from Array.mergeSort"
  IO.println s!"ns={ns} hash={h}"

/-- The algorithms, at a comparison known at the call site (so that `qsort` is specialised to it). -/
@[inline] def pick (algo : String) (lt : α → α → Bool) : IO (Array α → Array α) :=
  match algo with
  | "none" => pure id
  | "core" => pure fun a => a.qsort lt
  | _ => throw <| .userError s!"unknown algorithm {algo}"

/-- Times `sort` on the chunks of `input ()`, then checks every chunk against core's merge sort
on a fresh copy, comparing the results through `key`. -/
@[inline] def run [Inhabited α] [BEq β] (sort : Array α → Array α) (le : α → α → Bool)
    (key : α → β) (hash : α → UInt64) (input : Unit → Array α) (chunk : Nat) (check : Bool) :
    IO Unit := do
  let (s, ns) ← timed (chunks (input ()) chunk) sort
  let ok := !check || s.map (·.map key) == (chunks (input ()) chunk).map fun c => (c.mergeSort le).map key
  report ns (s.foldl (fun h c => c.foldl (fun h x => mix h (hash x)) h) 0) ok

/-- A record sorted by one field, as programs often sort. -/
structure Item where
  key : Nat
  name : String
  deriving Inhabited

def itemLt (x y : Item) : Bool := x.key < y.key
def itemLe (x y : Item) : Bool := x.key ≤ y.key

def main (args : List String) : IO Unit := do
  let (algo, type, pat, n, chunk, check) ← match args with
    | [algo, type, pat, n] => pure (algo, type, pat, n, "0", true)
    | [algo, type, pat, n, chunk] => pure (algo, type, pat, n, chunk, true)
    | [algo, type, pat, n, chunk, "nocheck"] => pure (algo, type, pat, n, chunk, false)
    | _ => throw <| .userError "usage: qsortbench ALGO TYPE PATTERN N [CHUNK [nocheck]]"
  let some n := n.toNat? | throw <| .userError s!"not a number: {n}"
  let some chunk := chunk.toNat? | throw <| .userError s!"not a number: {chunk}"
  let base ← IO.ofExcept (pattern pat n)
  -- `base` stays alive for the regeneration below; every copy handed to a sort is fresh.
  match type with
  | "nat" => run (← pick algo (· < ·)) (· ≤ ·) id (·.toUInt64) (fun _ => base.map (· + 0)) chunk check
  | "u64" =>
    let input := if pat == "random" then fun _ => randoms n else fun _ => base.map (·.toUInt64)
    -- Through `Ord`, as Lean's `io_compute` benchmark sorts.
    let sort : Array UInt64 → Array UInt64 ← match algo with
      | "none" => pure id
      | "core" => pure fun a => a.qsortOrd
      | _ => throw <| .userError s!"unknown algorithm {algo}"
    run sort (· ≤ ·) id id input chunk check
  | "str" => run (← pick algo (· < ·)) (· ≤ ·) id hash (fun _ => base.map pad) chunk check
  | "rec" =>
    run (← pick algo itemLt) itemLe (·.key) (·.key.toUInt64)
      (fun _ => base.map fun k => ({ key := k, name := pad k } : Item)) chunk check
  | _ => throw <| .userError s!"unknown type {type}"
