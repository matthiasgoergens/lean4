import Sorts.Pdq
import Sorts.PdqLab
import Sorts.PdqCost

/-! Scratch harness for breaking the lab variants (review only, never committed). -/

initialize cmpCount : IO.Ref Nat ← IO.mkRef 0
initialize rngState : IO.Ref UInt64 ← IO.mkRef 0x9E3779B97F4A7C15
initialize advVal : IO.Ref (Array Nat) ← IO.mkRef #[]
initialize advCand : IO.Ref Nat ← IO.mkRef 0
initialize advSolid : IO.Ref Nat ← IO.mkRef 0

def xorshift (x : UInt64) : UInt64 :=
  let x := x ^^^ (x <<< 13)
  let x := x ^^^ (x >>> 7)
  x ^^^ (x <<< 17)

unsafe def ltCImpl (x y : Nat) : Bool :=
  unsafeBaseIO do cmpCount.modify (· + 1); pure (decide (x < y))
@[implemented_by ltCImpl] def ltC (x y : Nat) : Bool := x < y

/-- McIlroy's adversary over indices. -/
unsafe def advLtImpl (x y : Nat) : Bool :=
  unsafeBaseIO do
    cmpCount.modify (· + 1)
    let mut val ← advVal.swap #[]
    let gas := val.size
    let mut cand ← advCand.get
    if val[x]! == gas && val[y]! == gas then
      let s ← advSolid.get
      if x == cand then val := val.set! x s else val := val.set! y s
      advSolid.set (s + 1)
    if val[x]! == gas then cand := x
    else if val[y]! == gas then cand := y
    advCand.set cand
    let r := decide (val[x]! < val[y]!)
    advVal.set val
    pure r
@[implemented_by advLtImpl] def advLt (x y : Nat) : Bool := x < y

unsafe def randLtImpl (x y : Nat) : Bool :=
  unsafeBaseIO do
    cmpCount.modify (· + 1)
    let s ← rngState.modifyGet fun s => let s := xorshift (s ^^^ (x.toUInt64 <<< 1) ^^^ (y.toUInt64 <<< 33)); (s, s)
    pure (s % 2 == 0)
@[implemented_by randLtImpl] def randLt (x y : Nat) : Bool := x < y

unsafe def trueLtImpl (x y : Nat) : Bool :=
  unsafeBaseIO do cmpCount.modify (· + 1); pure (x != 18446744073709551557 || y != 3)
@[implemented_by trueLtImpl] def trueLt (_x _y : Nat) : Bool := true

unsafe def falseLtImpl (x y : Nat) : Bool :=
  unsafeBaseIO do cmpCount.modify (· + 1); pure (x == 18446744073709551557 && y == 3)
@[implemented_by falseLtImpl] def falseLt (_x _y : Nat) : Bool := false

unsafe def leLtImpl (x y : Nat) : Bool :=
  unsafeBaseIO do cmpCount.modify (· + 1); pure (decide (x ≤ y))
@[implemented_by leLtImpl] def leLt (x y : Nat) : Bool := x ≤ y

/-- Rock-paper-scissors on `x % 3`. -/
unsafe def rpsLtImpl (x y : Nat) : Bool :=
  unsafeBaseIO do cmpCount.modify (· + 1); pure (y % 3 == (x % 3 + 1) % 3)
@[implemented_by rpsLtImpl] def rpsLt (x y : Nat) : Bool := y % 3 == (x % 3 + 1) % 3

unsafe def fltLtImpl (x y : Float) : Bool :=
  unsafeBaseIO do cmpCount.modify (· + 1); pure (x < y)
@[implemented_by fltLtImpl] def fltLt (x y : Float) : Bool := x < y

@[inline] def pick [Inhabited α] (algo : String) (lt : α → α → Bool) (lo hi : Nat) :
    IO (Array α → Array α) :=
  match algo with
  | "core" => pure fun a => a.qsort lt lo hi
  | "pdq" => pure fun a => Pdq.qsort a lt lo hi
  | _ =>
    match PdqLab.Config.parse algo with
    | some cfg => pure fun a => PdqLab.qsort cfg a lt lo hi
    | none => throw <| .userError s!"unknown algorithm {algo}"

def readNats (path : String) : IO (Array Nat) := do
  let s ← IO.FS.readFile path
  let mut a := #[]
  for w in s.split (fun c => c == ' ' || c == '\n') do
    if let some k := w.toString.toNat? then a := a.push k
  return a

def isSorted (a : Array Nat) : Bool := Id.run do
  for i in [1:a.size] do
    if a[i]! < a[i-1]! then return false
  return true

def countRun (sort : Array Nat → Array Nat) (a : Array Nat) : IO (Nat × Nat × Array Nat) := do
  cmpCount.set 0
  let a := a.map (· + 0)
  let t0 ← IO.monoNanosNow
  let r := sort a
  unless r.size = a.size do throw <| .userError "size"
  let t1 ← IO.monoNanosNow
  return (← cmpCount.get, t1 - t0, r)

def log2f (n : Nat) : Float := Float.log2 n.toFloat

def main (args : List String) : IO UInt32 := do
  match args with
  | ["count", algo, path] | ["count", algo, path, _] =>
    let reps := match args with | [_, _, _, r] => r.toNat! | _ => 1
    let a ← readNats path
    let sort ← pick algo ltC 0 (a.size - 1)
    let mut best := 0
    let mut c := 0
    let mut ok := true
    for i in [0:reps] do
      let (c', ns, r) ← countRun sort a
      c := c'
      if i == 0 || ns < best then best := ns
      ok := ok && isSorted r && r == a.mergeSort
    let n := a.size
    IO.println s!"algo={algo} n={n} cmps={c} perNlogN={c.toFloat / (n.toFloat * log2f n)} minns={best} ok={ok}"
    return if ok then 0 else 1
  | ["adv", algo, nS, out] =>
    let n := nS.toNat!
    advVal.set (Array.replicate n n)
    advCand.set 0; advSolid.set 0; cmpCount.set 0
    let sort ← pick algo advLt 0 (n - 1)
    let r := sort ((Array.range n).map (· + 0))
    unless r.size = n do throw <| .userError "size"
    let c ← cmpCount.get
    let val ← advVal.get
    IO.FS.writeFile out (" ".intercalate (val.toList.map toString) ++ "\n")
    IO.println s!"adv algo={algo} n={n} cmps={c} perNlogN={c.toFloat / (n.toFloat * log2f n)}"
    return 0
  | ["unlawful", algo, kind, nS, seedS, loS, hiS] =>
    let n := nS.toNat!
    let lo := loS.toNat!
    let hi := hiS.toNat!
    rngState.set (seedS.toNat!.toUInt64 * 2654435761 + 1)
    -- Input: pseudo-random values with duplicates.
    let mut x : UInt64 := seedS.toNat!.toUInt64 + 12345
    let mut a : Array Nat := #[]
    for _ in [0:n] do
      x := xorshift x
      a := a.push (x % (n.toUInt64 / 4 + 1)).toNat
    cmpCount.set 0
    let t0 ← IO.monoNanosNow
    let (r, outsideOk) ← match kind with
      | "float" =>
        let fa : Array Float := a.mapIdx fun i k => if i % 7 == 3 then (0.0 / 0.0 : Float) else k.toFloat
        let s ← pick algo fltLt lo hi
        let fr := s (fa.map id)
        -- Map back by bits so that the permutation check sees NaNs.
        let toN (f : Float) : Nat := f.toBits.toNat
        let cl := min lo (n - 1)
        let ch := max cl (min hi (n - 1))
        let outside := (List.range n).all fun i => i ≥ cl && i ≤ ch || (fa[i]!).toBits == (fr[i]!).toBits
        pure (fr.map toN, (outside, fa.map toN))
      | _ =>
        let s ← match kind with
          | "true" => pick algo trueLt lo hi
          | "false" => pick algo falseLt lo hi
          | "random" => pick algo randLt lo hi
          | "le" => pick algo leLt lo hi
          | "rps" => pick algo rpsLt lo hi
          | "lawful" => pick algo ltC lo hi
          | _ => throw <| .userError "kind"
        let r := s (a.map (· + 0))
        let cl := min lo (n - 1)
        let ch := max cl (min hi (n - 1))
        let outside := (List.range n).all fun i => i ≥ cl && i ≤ ch || a[i]! == r[i]!
        pure (r, (outside, a))
    let t1 ← IO.monoNanosNow
    let (outside, orig) := outsideOk
    let perm := r.mergeSort == orig.mergeSort
    let c ← cmpCount.get
    IO.println s!"unlawful algo={algo} kind={kind} n={n} lo={lo} hi={hi} cmps={c} perNlogN={c.toFloat / (n.toFloat * log2f n)} ns={t1-t0} perm={perm} outsideUnchanged={outside}"
    return if perm && outside then 0 else 1
  | ["time", algo, path, repsS] =>
    let a ← readNats path
    let sort ← pick algo (fun x y : Nat => decide (x < y)) 0 (a.size - 1)
    let mut ts : Array Nat := #[]
    let mut h : UInt64 := 0
    for _ in [0:repsS.toNat!] do
      let b := a.map (· + 0)
      let t0 ← IO.monoNanosNow
      let r := sort b
      unless r.size = a.size do throw <| .userError "size"
      let t1 ← IO.monoNanosNow
      h := r.foldl (fun h x => (h ^^^ x.toUInt64) * 1099511628211) 0
      ts := ts.push (t1 - t0)
    IO.println s!"time algo={algo} n={a.size} ns={ts.toList} hash={h}"
    return 0
  | ["climb", algo, ref, nS, itersS, seedS, init, dupsS, out] =>
    let n := nS.toNat!
    let sa ← pick algo ltC 0 (n - 1)
    let sr ← pick ref ltC 0 (n - 1)
    let score (a : Array Nat) : IO (Float × Nat × Nat) := do
      cmpCount.set 0
      let r := sa (a.map (· + 0))
      unless r.size = n do throw <| .userError "size"
      let ca ← cmpCount.get
      cmpCount.set 0
      let r := sr (a.map (· + 0))
      unless r.size = n do throw <| .userError "size"
      let cr ← cmpCount.get
      return (ca.toFloat / cr.toFloat, ca, cr)
    let mut x : UInt64 := seedS.toNat!.toUInt64 * 6364136223846793005 + 1442695040888963407
    let mut cur : Array Nat ← match init with
      | "sorted" => pure (Array.range n)
      | "random" => do
        let mut a := Array.range n
        for i in [0:n] do
          x := xorshift x
          a := a.swapIfInBounds i (i + (x % (n - i).toUInt64).toNat)
        pure a
      | path => do
        let a ← readNats path
        unless a.size = n do throw <| .userError "init size"
        pure a
    let (s0, a0, r0) ← score cur
    let mut best := s0
    IO.println s!"climb start score={s0} {algo}={a0} {ref}={r0}"
    let dups := dupsS == "1"
    for it in [0:itersS.toNat!] do
      x := xorshift x
      let op := (x % (if dups then 6 else 5)).toNat
      x := xorshift x
      let i := (x % n.toUInt64).toNat
      x := xorshift x
      let j := (x % n.toUInt64).toNat
      x := xorshift x
      let near := min (n - 1) (i + 1 + (x % 16).toNat)
      let cand := match op with
        | 0 => cur.swapIfInBounds i j
        | 1 => cur.swapIfInBounds i near
        | 2 =>
          let (l, h) := (min i j, min (max i j) (min i j + n / 8))
          (List.range ((h - l + 1) / 2)).foldl (fun a t => a.swapIfInBounds (l + t) (h - t)) cur
        | 3 =>
          -- move element i to position j
          let v := cur[i]!
          (cur.eraseIdx! i).insertIdx! (min j (n - 1)) v
        | 4 =>
          -- swap two blocks of 16 starting at i and j (if disjoint)
          if i + 16 ≤ j ∧ j + 16 ≤ n then
            (List.range 16).foldl (fun a t => a.swapIfInBounds (i + t) (j + t)) cur
          else cur.swapIfInBounds i j
        | _ => cur.set! i cur[j]!
      let (sc, ca, cr) ← score cand
      if sc ≥ best then
        if sc > best && (it % 1 == 0) then
          IO.println s!"it={it} op={op} score={sc} {algo}={ca} {ref}={cr}"
        best := sc
        cur := cand
    IO.FS.writeFile out (" ".intercalate (cur.toList.map toString) ++ "\n")
    let (s1, a1, r1) ← score cur
    IO.println s!"climb end score={s1} {algo}={a1} {ref}={r1}"
    return 0
  | ["part", trialsS, mfS] =>
    let mut x : UInt64 := 777
    let mut bad := 0
    let mut alreadyMoved := 0
    let mut alreadyCount := 0
    for _ in [0:trialsS.toNat!] do
      x := xorshift x
      let n := (x % 400).toNat + 2
      x := xorshift x
      let keys := (x % 40).toNat + 1
      x := xorshift x
      let mode := x % 3
      let mut l : List Nat := []
      for i in [0:n] do
        x := xorshift x
        l := (if mode == 0 then (x % keys.toUInt64).toNat else if mode == 1 then i / 3 + (if x % 17 == 0 then 50 else 0) else (n - i) / 2) :: l
      let arr := l.toArray
      x := xorshift x
      let a := (x % (n - 1).toUInt64).toNat
      x := xorshift x
      let b := a + 1 + (x % (n - a).toUInt64).toNat
      x := xorshift x
      let pv := a + (x % (b - a).toUInt64).toNat
      if h : b ≤ n ∧ a ≤ pv ∧ pv < b then
        let v : Vector Nat n := ⟨arr, by simp [arr, l]; sorry⟩
        let (w, ⟨mid, _⟩, already) := PdqLab.lomutoEndsPred (fun x y : Nat => decide (x < y)) mfS.toNat! v a b ⟨pv, h.2.1, h.2.2⟩ h.1
        let p := arr[pv]!
        let w := w.toArray
        let ok := w[mid]! == p
          && (List.range n).all (fun k => if k < a || k ≥ b then w[k]! == arr[k]! else if k < mid then w[k]! < p else if k > mid then !(w[k]! < p) else true)
          && w.qsort (· < ·) == arr.qsort (· < ·)
        if !ok then
          bad := bad + 1
          if bad ≤ 3 then IO.println s!"BAD a={a} b={b} pv={pv} in={arr} out={w} mid={mid}"
        if already then
          alreadyCount := alreadyCount + 1
          -- "already": nothing but the pivot moved?
          let moved := (List.range n).any fun k => k != mid && k != pv && w[k]! != arr[k]!
          if moved then alreadyMoved := alreadyMoved + 1
    IO.println s!"part lomutoEndsPred maxFlips={mfS} trials={trialsS} bad={bad} already={alreadyCount} alreadyButMoved={alreadyMoved}"
    return if bad == 0 then 0 else 1
  | ["refcount", path] =>
    let a ← readNats path
    let n := a.size
    let (_, ⟨c⟩) := (Pdq.sortM (Pdq.count (fun x y : Nat => decide (x < y))) 0 a.toVector 0 n
      (Nat.log2 n + 1) true true false n (Nat.le_refl _) (Nat.le_refl _) (by omega) (Nat.le_refl _)).run ⟨0⟩
    IO.println s!"refcount pdq n={n} cmps={c}"
    return 0
  | _ =>
    IO.eprintln "usage: brk count ALGO FILE [REPS] | adv ALGO N OUT | unlawful ALGO KIND N SEED LO HI"
    return 2
