/-- `sortM` with its helpers as parameters: `sortM lt` is `sortCoreM` applied to the helpers at
`lt`.  `Array.qsort` runs it with some helpers compiled once, at `Id`, instead of specialised at
every call site. -/
@[specialize] def sortCoreM
    (part : (xs : Vector α n) → (a b : Nat) → Idx a b → b ≤ n → m (Vector α n × Idx a b × Bool))
    (partEq : (xs : Vector α n) → (a b : Nat) → Idx a b → b ≤ n →
      m (Vector α n × {mid : Nat // a < mid ∧ mid ≤ b}))
    (ins : (xs : Vector α n) → (a b : Nat) → b ≤ n → m (Vector α n))
    (heap : (xs : Vector α n) → (a b : Nat) → a ≤ b → b ≤ n → m (Vector α n))
    (pis : (xs : Vector α n) → (a b : Nat) → a < b → b ≤ n → m (Vector α n × Bool))
    (choose : (xs : Vector α n) → (a b : Nat) → a < b → b ≤ n → m (ULift.{u} (Idx a b × Hint)))
    (lt : α → α → m (ULift.{u} Bool)) (lo : Nat) (xs : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) : m (Vector α n) :=
  if h12 : b - a ≤ insertionCutoff then ins xs a b hb
  else if limit = 0 then heap xs a b hab hb
  else match fuel with
  | 0 => absurd hf (by omega)
  | fuel + 1 => do
    let (xs, limit) := if balanced then (xs, limit) else (breakPatterns xs a b hb, limit - 1)
    let ⟨(pivot, hint)⟩ ← choose xs a b (by omega) hb
    let (xs, pivot, hint) : Vector α n × Idx a b × Hint :=
      if hint == .decreasing then
        (reverseRange xs a b hb, ⟨b - 1 - (pivot.1 - a), by omega⟩, .increasing)
      else (xs, pivot, hint)
    let (xs, done) ←
      if balanced && partitioned && hint == .increasing then
        pis xs a b (by omega) hb
      else pure (xs, false)
    if done then pure xs
    else
      let ⟨equal⟩ ← (if !afterEqual && decide (lo < a) then do
          pure ⟨!(← lt xs[a - 1] xs[pivot.1]).down⟩
        else pure ⟨false⟩ : m (ULift.{u} Bool))
      if equal then
        let (xs, ⟨mid, hm⟩) ← partEq xs a b pivot hb
        sortCoreM part partEq ins heap pis choose lt lo xs mid b limit balanced partitioned true fuel
          (by omega) (by omega) (by omega) hb
      else
        let (xs, ⟨mid, hm⟩, already) ← part xs a b pivot hb
        if mid - a < b - mid then
          let xs ← sortCoreM part partEq ins heap pis choose lt lo xs a mid limit true true false fuel
            (by omega) hlo (by omega) (by omega)
          sortCoreM part partEq ins heap pis choose lt lo xs (mid + 1) b limit
            (mid - a ≥ (b - a) / 8) already false fuel (by omega) (by omega) (by omega) hb
        else
          let xs ← sortCoreM part partEq ins heap pis choose lt lo xs (mid + 1) b limit true true
            false fuel (by omega) (by omega) (by omega) hb
          sortCoreM part partEq ins heap pis choose lt lo xs a mid limit (b - mid ≥ (b - a) / 8)
            already false fuel (by omega) hlo (by omega) (by omega)

