import Sorts.Pdq
import Sorts.Adaptive
import Std.Data.HashMap

/-! Scratch harness for trying to break `Pdq.qsort` and `Adaptive.qsort`. -/

/-! ## Instrumented comparisons -/

/-- McIlroy's adversary state ("A Killer Adversary for Quicksort", 1999). -/
structure Adv where
  val : Array Nat
  gas : Nat
  nsolid : Nat
  candidate : Nat
  ncmp : Nat
  policy : Nat := 0

unsafe def advCmpImpl (r : IO.Ref Adv) (x y : Nat) : Bool := unsafeBaseIO do
  r.modifyGet fun ⟨val, gas, nsolid, cand, ncmp, policy⟩ =>
    let ncmp := ncmp + 1
    let (val, nsolid) :=
      if x == y then
        if val[x]! == gas then (val.set! x nsolid, nsolid + 1) else (val, nsolid)
      else if val[x]! == gas && val[y]! == gas then
        let z := if policy == 1 then x else if policy == 2 then y else if x == cand then x else y
        (val.set! z nsolid, nsolid + 1)
      else (val, nsolid)
    let cand := if val[x]! == gas then x else if val[y]! == gas then y else cand
    (decide (val[x]! < val[y]!), ⟨val, gas, nsolid, cand, ncmp, policy⟩)

@[implemented_by advCmpImpl] opaque advCmp (r : IO.Ref Adv) (x y : Nat) : Bool

unsafe def cntImpl (r : IO.Ref Nat) (b : Bool) : Bool := unsafeBaseIO do
  r.modify (· + 1)
  pure b

/-- Returns `b`, counting one comparison in `r`. -/
@[implemented_by cntImpl] opaque cnt (r : IO.Ref Nat) (b : Bool) : Bool

/-! ## Algorithms, all on `Array Nat` with an arbitrary `lt` -/

def pdqLimit (as : Array α) (lt : α → α → Bool) (lo hi limit : Nat) : Array α :=
  if h : as.size = 0 then as
  else
    let lo := min lo (as.size - 1)
    let hi := max lo (min hi (as.size - 1))
    (Pdq.sort lt lo as.toVector lo (hi + 1) limit true true true (hi + 1 - lo)
      (Nat.le_refl _) (Nat.le_refl _) (by omega) (by omega)).toArray

def heapRange (as : Array α) (lt : α → α → Bool) (a b : Nat) : Array α :=
  if h : a ≤ b ∧ b ≤ as.size then (Pdq.heapSort lt as.toVector a b h.1 h.2).toArray else as

def runAlgo (algo : String) (lt : Nat → Nat → Bool) (a : Array Nat) : Array Nat :=
  match algo with
  | "core" => a.qsort lt
  | "pdq" => Pdq.qsort a lt
  | "adaptive" => Adaptive.qsort a lt
  | "merge" => a.mergeSort fun x y => !lt y x
  | "heap" => heapRange a lt 0 a.size
  | _ => a

def log2f (n : Nat) : Float := Float.log2 n.toFloat

/-- Counts the comparisons `algo` makes on `a` under `lt`, and times it. -/
def measureAlgo (algo : String) (lt : Nat → Nat → Bool) (a : Array Nat) : IO (Array Nat × Nat × Nat) := do
  let r ← IO.mkRef 0
  let a := a.map (· + 0)
  let t0 ← IO.monoNanosNow
  let s := if let some algo := algo.dropPrefix? "raw-" then
      match algo.toString with
      | "pdq" => Pdq.qsort a (· < ·)
      | "adaptive" => Adaptive.qsort a (· < ·)
      | "merge" => a.mergeSort (· ≤ ·)
      | "core" => a.qsort (· < ·)
      | "heap" => heapRange a (· < ·) 0 a.size
      | _ => a
    else runAlgo algo (fun x y => cnt r (lt x y)) a
  unless s.size = a.size do throw <| .userError "size changed"
  let t1 ← IO.monoNanosNow
  return (s, ← r.get, t1 - t0)

def isPerm (a b : Array Nat) : Bool := a.mergeSort (· ≤ ·) == b.mergeSort (· ≤ ·)

/-! ## McIlroy -/

def mcilroy (algo : String) (n : Nat) (policy : Nat := 0) : IO (Array Nat × Nat) := do
  let r ← IO.mkRef (⟨Array.replicate n (n - 1), n - 1, 0, 0, 0, policy⟩ : Adv)
  let idx := (Array.range n).map (· + 0)
  let s := runAlgo algo (advCmp r) idx
  unless s.size = n do throw <| .userError "size changed"
  let st ← r.get
  return (st.val, st.ncmp)

def xorshift (x : UInt64) : UInt64 :=
  let x := x ^^^ (x <<< 13)
  let x := x ^^^ (x >>> 7)
  x ^^^ (x <<< 17)

def hash2 (seed x y : Nat) : UInt64 :=
  xorshift (xorshift (xorshift (seed.toUInt64 + 0x9E3779B97F4A7C15) ^^^ x.toUInt64) ^^^ (y.toUInt64 * 0x100000001B3))

/-- Unlawful (or lawful-but-odd) comparisons. -/
def unlawful (kind : String) (n : Nat) : Option (Nat → Nat → Bool) :=
  match kind with
  | "true" => some fun _ _ => true
  | "false" => some fun _ _ => false
  | "le" => some fun x y => x ≤ y
  | "ne" => some fun x y => x != y
  -- Every pair answered at random (both directions independently).
  | "random" => some fun x y => hash2 1 x y % 2 == 0
  -- A random tournament: asymmetric and total on distinct values, not transitive.
  | "tournament" => some fun x y =>
      x != y && ((hash2 2 (min x y) (max x y) % 2 == 0) == (x < y))
  -- Cyclic: y is "greater" when it is within half the cycle above x.
  | "cyclic" => some fun x y => let d := (y + n - x) % n; 0 < d && d ≤ n / 2
  -- Mostly `<`, but 1% of pairs flipped.
  | "noisy" => some fun x y => if hash2 3 (min x y) (max x y) % 100 == 0 then y < x else x < y
  | "gt" => some fun x y => x > y
  | _ => none

def checkSorted (lt : Nat → Nat → Bool) (s : Array Nat) : Bool := Id.run do
  for i in [1:s.size] do
    if lt s[i]! s[i-1]! then return false
  return true

def runMcilroy (gen : String) (n : Nat) (policy : Nat := 0) : IO Unit := do
  let t0 ← IO.monoNanosNow
  let (input, advCmps) ← mcilroy gen n policy
  let t1 ← IO.monoNanosNow
  let nlogn := n.toFloat * log2f n
  IO.println s!"adversary (policy {policy}) against {gen}, n={n}: {advCmps} comparisons = {advCmps.toFloat / nlogn} n log2 n ({(t1 - t0) / 1000000} ms)"
  for algo in ["core", "pdq", "adaptive", "merge", "heap"] do
    if algo == "core" && n > 20000 then continue
    let (s, c, ns) ← measureAlgo algo (· < ·) input
    let ok := s == input.mergeSort (· ≤ ·)
    IO.println s!"  {algo}: {c} comparisons = {c.toFloat / nlogn} n log2 n, {ns / 1000} us, ok={ok}"

def randPerm (n : Nat) : Array Nat := Id.run do
  let mut x : UInt64 := 12345
  let mut a := Array.range n
  for i in [0:n] do
    x := xorshift x
    let j := i + (x % (n - i).toUInt64).toNat
    a := a.swapIfInBounds i j
  return a

def runUnlawful (kind : String) (n : Nat) : IO Unit := do
  let some lt := unlawful kind n | throw <| .userError s!"unknown kind {kind}"
  -- Distinct values, a permutation of 0..n-1, and a version with few distinct values.
  for (name, input) in [("perm", randPerm n),
      ("dups4", (Array.range n).map fun i => (hash2 9 i 0 % 4).toNat),
      ("sorted", Array.range n), ("reversed", (Array.range n).reverse)] do
    for algo in ["core", "pdq", "adaptive", "merge"] do
      let (s, c, ns) ← measureAlgo algo lt input
      IO.println s!"{kind} {name} n={n} {algo}: {c} comparisons = {c.toFloat / (n.toFloat * log2f n)} n log2 n, {ns / 1000} us, perm={isPerm s input}"

/-! ## Correctness sweep -/

def spec (as : Array Nat) (key : Nat → Nat) (lo hi : Nat) : Array Nat :=
  if as.size = 0 then as
  else
    let lo := min lo (as.size - 1)
    let hi := max lo (min hi (as.size - 1))
    as.extract 0 lo ++ (as.extract lo (hi + 1)).mergeSort (key · ≤ key ·) ++ as.extract (hi + 1) as.size

/-- Same size, outside untouched, inside a permutation, keys sorted. -/
def contractOk (as got : Array Nat) (key : Nat → Nat) (lo hi : Nat) : Bool :=
  let want := spec as key lo hi
  if as.size = 0 then got.size = 0
  else
    let lo' := min lo (as.size - 1)
    let hi' := max lo' (min hi (as.size - 1))
    got.size == as.size &&
    got.extract 0 lo' == as.extract 0 lo' &&
    got.extract (hi' + 1) got.size == as.extract (hi' + 1) as.size &&
    isPerm (got.extract lo' (hi' + 1)) (as.extract lo' (hi' + 1)) &&
    got.map key == want.map key

def genInput (kind : Nat) (n keys : Nat) (x : UInt64) : Array Nat := Id.run do
  let mut x := x
  let mut a : Array Nat := Array.mkEmpty n
  for i in [0:n] do
    x := xorshift x
    let r := (x >>> 3).toNat
    let v := match kind % 9 with
      | 0 => r % keys
      | 1 => i
      | 2 => n - i
      | 3 => if r % 50 == 0 then r % n else i                -- nearly sorted
      | 4 => if r % 50 == 0 then r % n else n - i            -- nearly reversed
      | 5 => (i / (keys + 1)) % 2 * 1000000 + (if (i / (keys + 1)) % 2 == 0 then i else n - i)  -- alternating runs
      | 6 => (i % (keys + 1)) * 1000 + i / (keys + 1)        -- interleaved runs
      | 7 => 7
      | _ => if i < n / 2 then i else n - i                  -- organ pipe
    -- A tag in the low 20 bits, so that the key `x >>> 20` has equal keys with distinct values.
    a := a.push (v * 2 ^ 20 + r % 2 ^ 20)
  return a

def sweep (sizes : List Nat) (reps : Nat) : IO Nat := do
  let mut x : UInt64 := 0xDEADBEEF12345
  let mut fails := 0
  let mut cases := 0
  let key : Nat → Nat := (· >>> 20)
  for n in sizes do
    for rep in [0:reps] do
      x := xorshift x
      let keys := (x % 70).toNat + 1
      x := xorshift x
      let as := genInput rep n keys x
      -- Ranges: the whole array, and random subranges, and near-full ones.
      x := xorshift x
      let lo1 := (x % (n.toUInt64 + 3)).toNat
      x := xorshift x
      let hi1 := (x % (n.toUInt64 + 3)).toNat
      for (lo, hi) in [(0, n - 1), (lo1, hi1), (1, n - 1), (0, n - 2), (1, n - 2), (lo1, n + 5)] do
        for (name, got) in [("pdq", Pdq.qsort as (key · < key ·) lo hi),
            ("adaptive", Adaptive.qsort as (key · < key ·) lo hi),
            ("pdqheap", pdqLimit as (key · < key ·) lo hi 0),
            ("pdqlimit1", pdqLimit as (key · < key ·) lo hi 1)] do
          cases := cases + 1
          unless contractOk as got key lo hi do
            fails := fails + 1
            if fails ≤ 5 then
              IO.eprintln s!"FAIL {name} n={n} kind={rep % 9} keys={keys} lo={lo} hi={hi}\n input={as.map key}\n got={got.map key}"
  IO.println s!"sweep: {cases} cases, {fails} failures"
  return fails

/-! ## Patterns aimed at the adaptive front end -/

def minRunOf (total : Nat) : Nat := if total ≤ 4096 then min (total - total / 2) 64 else Nat.sqrt total

def advPattern (name : String) (n : Nat) : Array Nat :=
  let m := minRunOf n
  let r := (Array.range n).map fun i => (hash2 7 i 0 >>> 4).toNat
  match name with
  -- √n interleaved ascending runs of length ≥ minRun: maximal merge work.
  | "interleave" =>
    let k := n / m
    (Array.range n).map fun i => (i % (n / k + 1)) * k + i / (n / k + 1)
  -- Runs of length minRun - 1 (never detected), ascending, random offsets.
  | "short" => (Array.range n).map fun i => (i % (m - 1)) + r[i / (m - 1)]! % n
  -- Alternating ascending/descending runs of exactly minRun, interleaved values.
  | "altdesc" =>
    let k := n / m + 1
    (Array.range n).map fun i =>
      let run := i / m
      let pos := i % m
      let pos := if run % 2 == 0 then pos else m - 1 - pos
      pos * k + run
  -- Sorted runs of minRun alternating with random chunks of minRun.
  | "sortedjunk" =>
    (Array.range n).map fun i => if (i / m) % 2 == 0 then (i % m) * (n / m + 1) + i / m else r[i]! % (n * n)
  -- One big run of n/2, then √n-length runs whose values spread across it.
  | "bigsmall" =>
    (Array.range n).map fun i =>
      if i < n / 2 then 2 * i * m
      else let j := i - n / 2; (j % m) * (n / m) * 2 + 1 + (j / m)
  -- Geometric run lengths n/2, n/4, ..., each interleaving with all the others.
  | "geometric" => Id.run do
    let mut out : Array Nat := #[]
    let mut len := n / 2
    let mut run := 0
    while out.size < n do
      let l := max len m
      for p in [0:l] do
        if out.size < n then out := out.push (p * 64 + run)
      len := len / 2
      run := run + 1
    return out
  | "random" => r
  -- Ascending runs of minRun - 1 that never join (each starts below the previous one's end).
  | "shortasc" => (Array.range n).map fun i => (n / (m - 1) + 1 - i / (m - 1)) * m + i % (m - 1)
  -- Alternating ascending and descending runs of minRun - 1, random levels.
  | "zigzag" => (Array.range n).map fun i =>
      let run := i / (m - 1)
      let pos := i % (m - 1)
      r[run]! % (n * n) + (if run % 2 == 0 then pos else m - 1 - pos)
  -- Strictly descending runs of exactly minRun, interleaved: every run needs reversing, then merging.
  | "alldesc" =>
    let k := n / m + 1
    (Array.range n).map fun i => (m - 1 - i % m) * k + i / m
  -- k = 2^⌊log2 (n / minRun)⌋ ascending runs of n/k; run j holds the values p*k + bitrev(j), so
  -- that every merge in a balanced merge tree interleaves its two sides element by element.
  | "bitrev" =>
    let bits := Nat.log2 (n / m)
    let k := 2 ^ bits
    let s := n / k
    let bitrev (j : Nat) : Nat := (List.range bits).foldl (fun acc b => acc * 2 + (j >>> b) % 2) 0
    (Array.range n).map fun i => if i < s * k then (i % s) * k + bitrev (i / s) else i * k
  | _ => #[]

def runPattern (pat : String) (n : Nat) (algos : List String) (reps : Nat) : IO Unit := do
  let input := advPattern pat n
  if input.size != n then throw <| .userError s!"unknown pattern {pat}"
  for _ in [0:reps] do
    let mut line := s!"{pat} n={n} minRun={minRunOf n}:"
    for algo in algos do
      let (s, c, ns) ← measureAlgo algo (· < ·) input
      let ok := s == input.mergeSort (· ≤ ·)
      line := line ++ s!"  {algo} {ns / 1000}us {c}cmp{if ok then "" else " WRONG"}"
    IO.println line

def mainDump (args : List String) : IO Unit := do
  let [gen, n] := args | return
  let (input, c) ← mcilroy gen n.toNat!
  IO.println s!"{c} {input}"

def saveInput (path : String) (a : Array Nat) : IO Unit :=
  IO.FS.writeFile path (" ".intercalate (a.toList.map toString))

def loadInput (path : String) : IO (Array Nat) := do
  let s ← IO.FS.readFile path
  return ((s.splitOn " ").filter (· ≠ "")).toArray.map String.toNat!

def runReplay (path : String) (algos : List String) (reps : Nat) : IO Unit := do
  let input ← loadInput path
  let n := input.size
  let nlogn := n.toFloat * log2f n
  for _ in [0:reps] do
    let mut line := s!"{path} n={n}:"
    for algo in algos do
      let (s, c, ns) ← measureAlgo algo (· < ·) input
      let ok := s == input.mergeSort (· ≤ ·)
      line := line ++ s!"  {algo} {ns / 1000}us {c}cmp={(c.toFloat / nlogn * 100).round / 100}nlgn{if ok then "" else " WRONG"}"
    IO.println line


/-! ## An unconstrained adversary (for unlawful `lt`) aimed at the partition-equal path.

It needs a hooked copy of `Pdq.sort` that compares `v[a-1]` with itself just before the
"element before the range" test; the self-comparison is answered `false` (so the hooked copy
takes the same path as the original) and tells the adversary that the next query is that test.
Answers are recorded, so that the replay with a pure table lookup takes the same path. -/

structure Adv2 where
  table : Std.HashMap (Nat × Nat) Bool
  gateNext : Bool
  cur : Nat
  designate : Bool
  ncmp : Nat

unsafe def adv2Impl (r : IO.Ref Adv2) (x y : Nat) : Bool := unsafeBaseIO do
  r.modifyGet fun ⟨table, gateNext, cur, designate, ncmp⟩ =>
    let ncmp := ncmp + 1
    if x == y then (false, ⟨table, true, cur, designate, ncmp⟩)
    else match table[(x, y)]? with
    | some b => (b, ⟨table, gateNext, cur, designate, ncmp⟩)
    | none =>
      let (b, gateNext, cur, designate) :=
        if gateNext then (false, false, y, true)
        else if cur != 0 && x == cur then
          if designate then (false, gateNext, cur, false) else (true, gateNext, cur, designate)
        else (decide (x < y), gateNext, cur, designate)
      (b, ⟨table.insert (x, y) b, gateNext, cur, designate, ncmp⟩)

@[implemented_by adv2Impl] opaque adv2 (r : IO.Ref Adv2) (x y : Nat) : Bool

def runAdv2 (n : Nat) (path : String) : IO Unit := do
  -- The adversary sees values shifted by one, so that `cur = 0` means no current pivot.
  let input := randPerm n
  let r ← IO.mkRef (⟨{}, false, 0, false, 0⟩ : Adv2)
  let s := Pdq.qsort input (fun x y => adv2 r (x + 1) (y + 1))
  unless s.size = n do throw <| .userError "size"
  let st ← r.get
  IO.println s!"adv2 n={n}: {st.ncmp} comparisons = {st.ncmp.toFloat / (n.toFloat * log2f n)} n log2 n, table {st.table.size}"
  let rows := st.table.toList.filterMap fun ((x, y), b) => if b != decide (x - 1 < y - 1) then some s!"{x - 1} {y - 1} {b}" else none
  IO.FS.writeFile (path ++ ".input") (" ".intercalate (input.toList.map toString))
  IO.FS.writeFile (path ++ ".table") ("\n".intercalate rows)

/-- Replays: `lt` is the recorded table where it disagrees with `<`, and `<` elsewhere. -/
def replayAdv2 (path : String) : IO Unit := do
  let input ← loadInput (path ++ ".input")
  let rows := (← IO.FS.readFile (path ++ ".table")).splitOn "\n" |>.filter (· ≠ "")
  let table : Std.HashMap (Nat × Nat) Bool := rows.foldl (init := {}) fun t row =>
    match row.splitOn " " with
    | [x, y, b] => t.insert (x.toNat!, y.toNat!) (b == "true")
    | _ => t
  let lt (x y : Nat) : Bool := (table[(x, y)]?).getD (decide (x < y))
  let n := input.size
  for algo in ["pdq", "adaptive", "merge"] do
    let (s, c, ns) ← measureAlgo algo lt input
    IO.println s!"  replay {algo} n={n}: {c} comparisons = {c.toFloat / (n.toFloat * log2f n)} n log2 n, {ns / 1000} us, perm={isPerm s input}"


/-! ## Floats with NaN: `<` is not a strict weak order. -/

def runFloat (n pct : Nat) : IO Unit := do
  let nan : Float := 0.0 / 0.0
  let input : Array Float := (Array.range n).map fun i =>
    let h := hash2 11 i 0
    if (h % 100).toNat < pct then nan else (h >>> 11).toFloat
  let bits (a : Array Float) : Array UInt64 := (a.map Float.toBits).mergeSort (· ≤ ·)
  for algo in ["core", "pdq", "adaptive", "merge"] do
    let r ← IO.mkRef 0
    let lt (x y : Float) : Bool := cnt r (x < y)
    let a := input.map (· + 0)
    let t0 ← IO.monoNanosNow
    let s := match algo with
      | "core" => a.qsort lt
      | "pdq" => Pdq.qsort a lt
      | "adaptive" => Adaptive.qsort a lt
      | _ => a.mergeSort fun x y => !lt y x
    unless s.size = n do throw <| .userError "size"
    let t1 ← IO.monoNanosNow
    let c ← r.get
    -- Are the non-NaN elements in order among themselves?
    let nonNan := s.filter (!·.isNaN)
    let sortedNonNan := (List.range (nonNan.size - 1)).all fun i => !(nonNan[i+1]! < nonNan[i]!)
    IO.println s!"float n={n} nan={pct}% {algo}: {c} comparisons = {c.toFloat / (n.toFloat * log2f n)} n log2 n, {(t1 - t0) / 1000} us, perm={bits s == bits input}, non-NaN sorted={sortedNonNan}"

def main (args : List String) : IO UInt32 := do
  match args with
  | ["gen", gen, n, p, path] =>
    let (input, c) ← mcilroy gen n.toNat! p.toNat!
    saveInput path input
    IO.println s!"saved {path}: adversary made {c} comparisons"
    return 0
  | ["adv2", n, path] => runAdv2 n.toNat! path; return 0
  | ["float", n, pct] => runFloat n.toNat! pct.toNat!; return 0
  | ["replay2", path] => replayAdv2 path; return 0
  | "replay" :: path :: reps :: algos => runReplay path algos reps.toNat!; return 0
  | ["mcilroy", gen, n] => runMcilroy gen n.toNat!; return 0
  | ["mcilroy", gen, n, p] => runMcilroy gen n.toNat! p.toNat!; return 0
  | ["unlawful", kind, n] => runUnlawful kind n.toNat!; return 0
  | ["sweep"] =>
    let small := List.range 80
    let big := [127, 128, 129, 255, 256, 257, 1000, 4090, 4095, 4096, 4097, 4098, 4100, 4225, 5000, 10000, 16384, 16385]
    let f1 ← sweep small 200
    let f2 ← sweep big 20
    return if f1 + f2 = 0 then 0 else 1
  | "pattern" :: pat :: n :: reps :: algos => runPattern pat n.toNat! algos reps.toNat!; return 0
  | "dump" :: rest => mainDump rest; return 0
  | _ => IO.eprintln "usage"; return 2
