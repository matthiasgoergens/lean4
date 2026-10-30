import Sorts.Pdq

/-!
Every function in `Pdq` rearranges only the range it is given, whatever its comparison returns and
whatever monad it returns in: each result is a permutation of the input that leaves every element
outside the range where it was.  The frame lemmas say so with `SatisfiesM` (every result of the
computation has the property) for every lawful monad, so they hold for `qsort`, which runs `sortM`
at `Id`, as much as for the counting monad of `Sorts.PdqCost`.  From them follow the theorems that
`Pdq.qsort` permutes its input and leaves the elements outside `[lo, hi]` untouched, as lean4 PR
14658 proves for `Array.qsort`.
-/

namespace Pdq

/-- Every result of `x` satisfies `P`: `x` is some `x'`, whose results carry a proof of `P`, with
the proofs forgotten.  This is Batteries' `SatisfiesM`, which this project, depending on nothing
but core, defines itself. -/
def SatisfiesM {m : Type u → Type v} [Functor m] {β : Type u} (P : β → Prop) (x : m β) : Prop :=
  ∃ x' : m {r // P r}, Subtype.val <$> x' = x

namespace SatisfiesM

section
variable {m : Type u → Type v} [Monad m] [LawfulMonad m] {β γ : Type u} {P Q : β → Prop} {x : m β}

theorem pure {r : β} (h : P r) : SatisfiesM P (pure r : m β) := ⟨Pure.pure ⟨r, h⟩, by simp⟩

/-- Nothing is known about the results of `x`. -/
theorem trivial (x : m β) : SatisfiesM (fun _ => True) x :=
  ⟨(fun r => ⟨r, True.intro⟩) <$> x, by simp⟩

theorem mono (hx : SatisfiesM P x) (h : ∀ r, P r → Q r) : SatisfiesM Q x :=
  let ⟨x', e⟩ := hx
  ⟨(fun r => ⟨r.1, h _ r.2⟩) <$> x', by rw [← e]; simp⟩

theorem bind {f : β → m γ} {Q : γ → Prop} (hx : SatisfiesM P x)
    (hf : ∀ r, P r → SatisfiesM Q (f r)) : SatisfiesM Q (x >>= f) := by
  obtain ⟨x', rfl⟩ := hx
  refine ⟨x' >>= fun r => Classical.choose (hf r.1 r.2), ?_⟩
  simp only [map_bind, bind_map_left]
  congr 1
  funext r
  exact Classical.choose_spec (hf r.1 r.2)

/-- `x` followed by something that satisfies `Q` whatever `x` returned, such as a comparison. -/
theorem bind_any {f : β → m γ} {Q : γ → Prop} (hf : ∀ r, SatisfiesM Q (f r)) :
    SatisfiesM Q (x >>= f) :=
  (trivial x).bind fun r _ => hf r

end

/-- At `Id`, the one result. -/
theorem run {β : Type u} {P : β → Prop} {x : Id β} (h : SatisfiesM P x) : P x.run :=
  let ⟨x', e⟩ := h
  e ▸ x'.run.2

theorem of_run {β : Type u} {P : β → Prop} {x : Id β} (h : P x.run) : SatisfiesM P x :=
  ⟨Pure.pure ⟨x.run, h⟩, rfl⟩

/-- At `Id`, two properties of the result hold together. -/
theorem and {β : Type u} {P Q : β → Prop} {x : Id β} (hp : SatisfiesM P x) (hq : SatisfiesM Q x) :
    SatisfiesM (fun r => P r ∧ Q r) x :=
  of_run ⟨hp.run, hq.run⟩

end SatisfiesM

variable {α : Type u} {n : Nat}

/-- `w` is a rearrangement of `v` that moved only elements of `[a, b)`: every element of `w` in the
range came from the range of `v`. -/
structure Frame (a b : Nat) (v w : Vector α n) : Prop where
  perm : Vector.Perm w v
  out : ∀ i (h : i < n), (i < a ∨ b ≤ i) → w[i] = v[i]
  src : ∀ i (h : i < n), a ≤ i → i < b → ∃ j, ∃ hj : j < n, a ≤ j ∧ j < b ∧ w[i] = v[j]

namespace Frame

variable {a b : Nat} {v w x : Vector α n}

@[refl] theorem refl (v : Vector α n) : Frame a b v v :=
  ⟨.rfl, fun _ _ _ => rfl, fun i h h1 h2 => ⟨i, h, h1, h2, rfl⟩⟩

theorem trans (h₁ : Frame a b v w) (h₂ : Frame a b w x) : Frame a b v x :=
  ⟨h₂.perm.trans h₁.perm, fun i h hi => (h₂.out i h hi).trans (h₁.out i h hi), fun i h h1 h2 =>
    let ⟨j, hj, hj1, hj2, e⟩ := h₂.src i h h1 h2
    let ⟨k, hk, hk1, hk2, e'⟩ := h₁.src j hj hj1 hj2
    ⟨k, hk, hk1, hk2, e.trans e'⟩⟩

theorem swap {i j : Nat} (hi : i < n) (hj : j < n) (hai : a ≤ i) (hib : i < b) (haj : a ≤ j)
    (hjb : j < b) : Frame a b v (v.swap i j hi hj) :=
  ⟨Vector.swap_perm hi hj, fun k hk hout =>
    Vector.getElem_swap_of_ne (by omega) (by omega), fun k hk h1 h2 => by
    rw [Vector.getElem_swap]
    split
    · exact ⟨j, hj, haj, hjb, rfl⟩
    · split
      · exact ⟨i, hi, hai, hib, rfl⟩
      · exact ⟨k, hk, h1, h2, rfl⟩⟩

/-- Widens the range. -/
theorem mono {a' b' : Nat} (h : Frame a b v w) (ha : a' ≤ a) (hb : b ≤ b') : Frame a' b' v w :=
  ⟨h.perm, fun i hi hout => h.out i hi (by omega), fun i hi h1 h2 =>
    if hin : a ≤ i ∧ i < b then
      let ⟨j, hj, hj1, hj2, e⟩ := h.src i hi hin.1 hin.2
      ⟨j, hj, by omega, by omega, e⟩
    else ⟨i, hi, h1, h2, h.out i hi (by omega)⟩⟩

/-- A property of every element of the range survives a rearrangement of the range. -/
theorem holds (h : Frame a b v w) {P : α → Prop}
    (hv : ∀ i (hi : i < n), a ≤ i → i < b → P v[i]) :
    ∀ i (hi : i < n), a ≤ i → i < b → P w[i] := fun i hi h1 h2 =>
  let ⟨j, hj, hj1, hj2, e⟩ := h.src i hi h1 h2
  e ▸ hv j hj hj1 hj2

/-- A swap inside the range, followed by a rearrangement of the range. -/
theorem swap_trans {i j : Nat} {hi : i < n} {hj : j < n} (hai : a ≤ i) (hib : i < b) (haj : a ≤ j)
    (hjb : j < b) (h : Frame a b (v.swap i j hi hj) w) : Frame a b v w :=
  (swap hi hj hai hib haj hjb).trans h

/-- An empty range moves nothing. -/
theorem eq_of_le (h : Frame a b v w) (hab : b ≤ a) : w = v :=
  Vector.ext fun i hi => h.out i hi (by omega)

end Frame

/-! ### Reversal and pattern breaking -/

theorem reverseRange_frame (v : Vector α n) (i j : Nat) (hj : j ≤ n) :
    Frame i j v (reverseRange v i j hj) := by
  fun_induction reverseRange v i j hj with
  | case1 v i j hj h ih =>
    exact Frame.swap_trans (by omega) (by omega) (by omega) (by omega)
      (ih.mono (by omega) (by omega))
  | case2 => exact .refl _

theorem breakPatterns.go_frame (a b : Nat) (hb : b ≤ n) (v : Vector α n) (t : Nat) (r : UInt64)
    (h8 : 8 ≤ b - a) : Frame a b v (breakPatterns.go a b hb v t r h8) := by
  fun_induction breakPatterns.go a b hb v t r h8 with
  | case1 v t r ht r' hr ih => exact Frame.swap_trans (by omega) (by omega) (by omega) (by omega) ih
  | case2 => exact .refl _

theorem breakPatterns_frame (v : Vector α n) (a b : Nat) (hb : b ≤ n) :
    Frame a b v (breakPatterns v a b hb) := by
  unfold breakPatterns
  split
  · exact breakPatterns.go_frame ..
  · exact .refl _

section helpers

variable {a b : Nat} {v v' : Vector α n}

theorem frame_breakPatterns_eq {c : Bool} {x y : Nat} {l : Nat} (hb : b ≤ n)
    (e : (if c = true then (v, x) else (breakPatterns v a b hb, y)) = (v', l)) :
    Frame a b v v' := by
  split at e <;> simp only [Prod.mk.injEq] at e <;> obtain ⟨rfl, -⟩ := e
  · exact .refl _
  · exact breakPatterns_frame ..

theorem frame_reverseRange_eq {c : Bool} {β : Type} {x y z : β} (hb : b ≤ n)
    (e : (if c = true then (reverseRange v a b hb, x) else (v, y)) = (v', z)) : Frame a b v v' := by
  split at e <;> simp only [Prod.mk.injEq] at e <;> obtain ⟨rfl, -⟩ := e
  · exact reverseRange_frame ..
  · exact .refl _

end helpers

section Monadic

variable {m : Type u → Type v} [Monad m] [LawfulMonad m]

/-! ### Insertion sort -/

theorem insertionSortM.sink_frame (lt : α → α → m (ULift.{u} Bool)) (a b : Nat) (v : Vector α n)
    (j : Nat) (hj : j < n) :
    SatisfiesM (Frame a (j + 1) v) (insertionSortM.sink lt a b v j hj) := by
  fun_induction insertionSortM.sink lt a b v j hj with
  | case1 v j hj h ih =>
    refine SatisfiesM.bind_any fun _ => ?_
    split
    · exact ih.mono fun _ hw => Frame.swap_trans (by omega) (by omega) (by omega) (by omega)
        (hw.mono (Nat.le_refl _) (by omega))
    · exact SatisfiesM.pure (.refl _)
  | case2 => exact SatisfiesM.pure (.refl _)

theorem insertionSortM.outer_frame (lt : α → α → m (ULift.{u} Bool)) (a b : Nat) (hb : b ≤ n)
    (v : Vector α n) (i : Nat) : SatisfiesM (Frame a b v) (insertionSortM.outer lt a b hb v i) := by
  fun_induction insertionSortM.outer lt a b hb v i with
  | case1 v i h ih =>
    exact (insertionSortM.sink_frame ..).bind fun w hw =>
      (ih w).mono fun _ hr => (hw.mono (Nat.le_refl _) (by omega)).trans hr
  | case2 => exact SatisfiesM.pure (.refl _)

theorem insertionSortM_frame (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (a b : Nat)
    (hb : b ≤ n) : SatisfiesM (Frame a b v) (insertionSortM lt v a b hb) :=
  insertionSortM.outer_frame ..

/-! ### Heapsort -/

theorem siftDownM_frame (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (root hi first : Nat)
    (h : first + hi ≤ n) :
    SatisfiesM (Frame (first + root) (first + hi) v) (siftDownM lt v root hi first h) := by
  fun_induction siftDownM lt v root hi first h with
  | case1 v root hc ih =>
    refine SatisfiesM.bind_any fun ⟨⟨c, hc1, hc2⟩⟩ => SatisfiesM.bind_any fun _ => ?_
    split
    · exact (ih c ⟨hc1, hc2⟩).mono fun _ hw => Frame.swap_trans (by omega) (by omega) (by omega)
        (by omega) (hw.mono (by omega) (Nat.le_refl _))
    · exact SatisfiesM.pure (.refl _)
  | case2 => exact SatisfiesM.pure (.refl _)

theorem heapSortM.build_frame (lt : α → α → m (ULift.{u} Bool)) (a b : Nat) (hab : a ≤ b)
    (hb : b ≤ n) (v : Vector α n) (k : Nat) :
    SatisfiesM (Frame a b v) (heapSortM.build lt a b hab hb v k) := by
  fun_induction heapSortM.build lt a b hab hb v k with
  | case1 => exact SatisfiesM.pure (.refl _)
  | case2 v k ih =>
    exact (siftDownM_frame ..).bind fun w hw =>
      (ih w).mono fun _ hr => (hw.mono (by omega) (by omega)).trans hr

theorem heapSortM.pop_frame (lt : α → α → m (ULift.{u} Bool)) (a b : Nat) (hab : a ≤ b)
    (hb : b ≤ n) (v : Vector α n) (i : Nat) (hi : i ≤ b - a) :
    SatisfiesM (Frame a b v) (heapSortM.pop lt a b hab hb v i hi) := by
  fun_induction heapSortM.pop lt a b hab hb v i hi with
  | case1 => exact SatisfiesM.pure (.refl _)
  | case2 v i hi ih =>
    exact (siftDownM_frame ..).bind fun w hw => (ih w).mono fun _ hr =>
      Frame.swap_trans (by omega) (by omega) (by omega) (by omega)
        ((hw.mono (by omega) (by omega)).trans hr)

theorem heapSortM_frame (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (a b : Nat)
    (hab : a ≤ b) (hb : b ≤ n) : SatisfiesM (Frame a b v) (heapSortM lt v a b hab hb) :=
  (heapSortM.build_frame ..).bind fun _ hw =>
    (heapSortM.pop_frame ..).mono fun _ hr => hw.trans hr

/-! ### Partial insertion sort -/

theorem partialInsertionSortM.sinkLeft_frame (lt : α → α → m (ULift.{u} Bool)) (a b : Nat)
    (hb : b ≤ n) (v : Vector α n) (j : Nat) (hj : j < b) :
    SatisfiesM (Frame a (j + 1) v) (partialInsertionSortM.sinkLeft lt a b hb v j hj) := by
  fun_induction partialInsertionSortM.sinkLeft lt a b hb v j hj with
  | case1 v j hj h ih =>
    refine SatisfiesM.bind_any fun _ => ?_
    split
    · exact ih.mono fun _ hw => Frame.swap_trans (by omega) (by omega) (by omega) (by omega)
        (hw.mono (Nat.le_refl _) (by omega))
    · exact SatisfiesM.pure (.refl _)
  | case2 => exact SatisfiesM.pure (.refl _)

theorem partialInsertionSortM.riseRight_frame (lt : α → α → m (ULift.{u} Bool)) (a b : Nat)
    (hb : b ≤ n) (v : Vector α n) (j : Nat) (hj : a < j) :
    SatisfiesM (Frame (j - 1) b v) (partialInsertionSortM.riseRight lt a b hb v j hj) := by
  fun_induction partialInsertionSortM.riseRight lt a b hb v j hj with
  | case1 v j hj h ih =>
    refine SatisfiesM.bind_any fun _ => ?_
    split
    · exact ih.mono fun _ hw => Frame.swap_trans (by omega) (by omega) (by omega) (by omega)
        (hw.mono (by omega) (Nat.le_refl _))
    · exact SatisfiesM.pure (.refl _)
  | case2 => exact SatisfiesM.pure (.refl _)

theorem partialInsertionSortM.step_frame (lt : α → α → m (ULift.{u} Bool)) (a b : Nat)
    (hb : b ≤ n) (v : Vector α n) (i steps : Nat) (h1 : a < i) (h2 : i ≤ b) :
    SatisfiesM (fun r => Frame a b v r.1)
      (partialInsertionSortM.step lt a b hb v i steps h1 h2) := by
  fun_induction partialInsertionSortM.step lt a b hb v i steps h1 h2 with
  | case1 v i steps h1 h2 hs ih =>
    refine SatisfiesM.bind_any fun ⟨⟨i', hi⟩⟩ => ?_
    dsimp only
    split
    · exact SatisfiesM.pure (.refl _)
    split
    · exact SatisfiesM.pure (.refl _)
    have e1 : Frame a b v (v.swap i' (i' - 1) (by omega) (by omega)) :=
      Frame.swap (by omega) (by omega) (by omega) (by omega) (by omega) (by omega)
    -- What is left after the swap, from the vector `w` that the left shift produced.
    have rest : ∀ w, Frame a b v w → SatisfiesM (fun r => Frame a b v r.1)
        (if 2 ≤ b - i' then do
          let v ← partialInsertionSortM.riseRight lt a b hb w (i' + 1) (by omega)
          partialInsertionSortM.step lt a b hb v i' (steps + 1) hi.1 hi.2
        else do
          let v ← pure w
          partialInsertionSortM.step lt a b hb v i' (steps + 1) hi.1 hi.2) := by
      intro w e2
      split
      · exact (partialInsertionSortM.riseRight_frame ..).bind fun w3 e3 =>
          (ih i' hi w3).mono fun _ hr => e2.trans ((e3.mono (by omega) (Nat.le_refl _)).trans hr)
      · rw [pure_bind]
        exact (ih i' hi w).mono fun _ hr => e2.trans hr
    split
    · exact (partialInsertionSortM.sinkLeft_frame ..).bind fun w2 e2 =>
        rest w2 (e1.trans (e2.mono (Nat.le_refl _) (by omega)))
    · rw [pure_bind]
      exact rest _ e1
  | case2 => exact SatisfiesM.pure (.refl _)

theorem partialInsertionSortM_frame (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n)
    (a b : Nat) (hab : a < b) (hb : b ≤ n) :
    SatisfiesM (fun r => Frame a b v r.1) (partialInsertionSortM lt v a b hab hb) :=
  partialInsertionSortM.step_frame ..

/-! ### Partitions -/

theorem partitionM.loop_frame (lt : α → α → m (ULift.{u} Bool)) (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    SatisfiesM (fun r => Frame a b v r.1) (partitionM.loop lt a b pivot hb p v i j h1 h2 h3) := by
  fun_induction partitionM.loop lt a b pivot hb p v i j h1 h2 h3 with
  | case1 v i j h1 h2 h3 ih =>
    refine SatisfiesM.bind_any fun ⟨⟨i', hi⟩⟩ => SatisfiesM.bind_any fun ⟨⟨j', hj⟩⟩ => ?_
    dsimp only
    split
    · exact (ih i' hi j' hj ‹_›).mono fun _ hr =>
        Frame.swap_trans (by omega) (by omega) (by omega) (by omega) hr
    · exact SatisfiesM.pure (Frame.swap (by omega) (by omega) (by omega) (by omega) (by omega)
        (by omega))

theorem partitionM_frame (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) :
    SatisfiesM (fun r => Frame a b v r.1) (partitionM lt v a b pivot hb) := by
  have := pivot.2
  unfold partitionM
  have e : Frame a b v (v.swap a pivot.1 (by omega) (by omega)) :=
    Frame.swap (by omega) (by omega) (by omega) (by omega) (by omega) (by omega)
  generalize v.swap a pivot.1 _ _ = w at e
  refine SatisfiesM.bind_any fun ⟨⟨i', hi⟩⟩ => SatisfiesM.bind_any fun ⟨⟨j', hj⟩⟩ => ?_
  dsimp only
  split
  · exact (partitionM.loop_frame ..).mono fun _ hr =>
      e.trans (Frame.swap_trans (by omega) (by omega) (by omega) (by omega) hr)
  · exact SatisfiesM.pure (e.trans (Frame.swap (by omega) (by omega) (by omega) (by omega)
      (by omega) (by omega)))

theorem partitionEqualM.loop_frame (lt : α → α → m (ULift.{u} Bool)) (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    SatisfiesM (fun r => Frame i (j + 1) v r.1)
      (partitionEqualM.loop lt a b pivot hb p v i j h1 h2 h3) := by
  fun_induction partitionEqualM.loop lt a b pivot hb p v i j h1 h2 h3 with
  | case1 v i j h1 h2 h3 ih =>
    refine SatisfiesM.bind_any fun ⟨⟨i', hi⟩⟩ => SatisfiesM.bind_any fun ⟨⟨j', hj⟩⟩ => ?_
    dsimp only
    split
    · exact (ih i' hi j' hj ‹_›).mono fun _ hr =>
        Frame.swap_trans (by omega) (by omega) (by omega) (by omega) (hr.mono (by omega) (by omega))
    · exact SatisfiesM.pure (.refl _)

theorem partitionEqualM_frame (lt : α → α → m (ULift.{u} Bool)) (v : Vector α n) (a b : Nat)
    (pivot : Idx a b) (hb : b ≤ n) :
    SatisfiesM (fun r => Frame a b v r.1) (partitionEqualM lt v a b pivot hb) := by
  have := pivot.2
  unfold partitionEqualM
  exact (partitionEqualM.loop_frame ..).mono fun _ hr =>
    Frame.swap_trans (by omega) (by omega) (by omega) (by omega) (hr.mono (by omega) (by omega))

/-! ### The main recursion -/

theorem sortM_frame (lt : α → α → m (ULift.{u} Bool)) (lo : Nat) (v : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) :
    SatisfiesM (Frame a b v)
      (sortM lt lo v a b limit balanced partitioned afterEqual fuel hf hlo hab hb) := by
  fun_induction sortM lt lo v a b limit balanced partitioned afterEqual fuel hf hlo hab hb
  case case1 => exact insertionSortM_frame ..
  case case2 => exact heapSortM_frame ..
  case case3 v a b limit bal part ae hlo hab hb h12 hl fuel hf v1 l1 e1 ih5 ih4 ih3 ih2 ih1 =>
    have F1 := frame_breakPatterns_eq hb e1
    refine SatisfiesM.bind_any fun ⟨(pivot, hint)⟩ => ?_
    split
    split
    rename_i v2 pivot2 hint2 e2
    have F2 := F1.trans (frame_reverseRange_eq hb e2)
    dsimp only
    split
    all_goals
      refine SatisfiesM.bind (P := fun r => Frame a b v r.1) ?_ fun ⟨v3, done⟩ F3 => ?_
      · first
        | exact (partialInsertionSortM_frame ..).mono fun _ hr => F2.trans hr
        | exact SatisfiesM.pure F2
      dsimp only at F3 ⊢
      split
      · exact SatisfiesM.pure F3
      refine SatisfiesM.bind_any fun ⟨equal⟩ => ?_
      dsimp only
      split
      · exact (partitionEqualM_frame ..).bind fun ⟨v4, mid, hm⟩ F4 =>
          (ih5 pivot2 pivot2 v4 mid hm).mono fun _ hr =>
            F3.trans (F4.trans (hr.mono (by omega) (Nat.le_refl _)))
      · refine (partitionM_frame ..).bind fun ⟨v4, ⟨mid, hm⟩, already⟩ F4 => ?_
        dsimp only at F4 ⊢
        split
        · exact (ih4 pivot2 pivot2 v4 mid hm).bind fun v5 F5 =>
            (ih3 pivot2 pivot2 mid hm already v5).mono fun _ hr => F3.trans (F4.trans
              ((F5.mono (Nat.le_refl _) (by omega)).trans (hr.mono (by omega) (Nat.le_refl _))))
        · exact (ih2 pivot2 pivot2 v4 mid hm).bind fun v5 F5 =>
            (ih1 pivot2 pivot2 mid hm already v5).mono fun _ hr => F3.trans (F4.trans
              ((F5.mono (by omega) (Nat.le_refl _)).trans (hr.mono (Nat.le_refl _) (by omega))))

omit [LawfulMonad m] in
/-- A range of at most one element is left alone. -/
theorem sortM_of_le_succ (lt : α → α → m (ULift.{u} Bool)) (lo : Nat) (v : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) (h : b ≤ a + 1) :
    sortM lt lo v a b limit balanced partitioned afterEqual fuel hf hlo hab hb = pure v := by
  unfold sortM
  simp only [show b - a ≤ insertionCutoff by unfold insertionCutoff; omega, ↓reduceDIte]
  unfold insertionSortM insertionSortM.outer
  simp only [show ¬a + 1 < b by omega, ↓reduceDIte]

end Monadic

/-! ### `qsort` -/

open scoped Array in
theorem qsort_perm (as : Array α) (lt : α → α → Bool) (lo hi : Nat) :
    Pdq.qsort as lt lo hi ~ as := by
  unfold qsort
  split
  · exact .rfl
  · exact (sortM_frame ..).run.perm.toArray

@[simp] theorem size_qsort (as : Array α) (lt : α → α → Bool) (lo hi : Nat) :
    (Pdq.qsort as lt lo hi).size = as.size := by
  unfold qsort
  split
  · rfl
  · simp

@[simp] theorem getElem_qsort_of_not_mem (as : Array α) (lt : α → α → Bool)
    (lo hi i : Nat) (hi' : i < as.size) (hout : i < lo ∨ hi < i) :
    getElem (Pdq.qsort as lt lo hi) i (by simpa using hi') = as[i] := by
  unfold qsort
  split
  · rfl
  · rename_i h0
    simp only [Vector.getElem_toArray]
    by_cases hs : max (min lo (as.size - 1)) (min hi (as.size - 1)) ≤ min lo (as.size - 1)
    · have hle : max (min lo (as.size - 1)) (min hi (as.size - 1)) + 1 ≤
          min lo (as.size - 1) + 1 := by omega
      simp only [sortM_of_le_succ (h := hle)]
      rfl
    · rw [(sortM_frame ..).run.out i hi' (by omega)]
      rfl

@[simp] theorem mem_qsort {x : α} (as : Array α) (lt : α → α → Bool) (lo hi : Nat) :
    x ∈ Pdq.qsort as lt lo hi ↔ x ∈ as :=
  (qsort_perm as lt lo hi).mem_iff

/-! ### `qsortOrd`

It sorts the whole array, so there is no range to leave alone. -/

open scoped Array in
theorem qsortOrd_perm [Ord α] (xs : Array α) : Pdq.qsortOrd xs ~ xs :=
  qsort_perm ..

@[simp] theorem size_qsortOrd [Ord α] (xs : Array α) : (Pdq.qsortOrd xs).size = xs.size :=
  size_qsort ..

@[simp] theorem mem_qsortOrd [Ord α] {x : α} (xs : Array α) : x ∈ Pdq.qsortOrd xs ↔ x ∈ xs :=
  mem_qsort ..

end Pdq

/-! No theorem above depends on an axiom beyond `propext`, `Classical.choice` and `Quot.sound`. -/

#print axioms Pdq.SatisfiesM.pure
#print axioms Pdq.SatisfiesM.trivial
#print axioms Pdq.SatisfiesM.mono
#print axioms Pdq.SatisfiesM.bind
#print axioms Pdq.SatisfiesM.bind_any
#print axioms Pdq.SatisfiesM.run
#print axioms Pdq.SatisfiesM.of_run
#print axioms Pdq.SatisfiesM.and
#print axioms Pdq.Frame.refl
#print axioms Pdq.Frame.trans
#print axioms Pdq.Frame.swap
#print axioms Pdq.Frame.mono
#print axioms Pdq.Frame.holds
#print axioms Pdq.Frame.swap_trans
#print axioms Pdq.Frame.eq_of_le
#print axioms Pdq.reverseRange_frame
#print axioms Pdq.breakPatterns.go_frame
#print axioms Pdq.breakPatterns_frame
#print axioms Pdq.frame_breakPatterns_eq
#print axioms Pdq.frame_reverseRange_eq
#print axioms Pdq.insertionSortM.sink_frame
#print axioms Pdq.insertionSortM.outer_frame
#print axioms Pdq.insertionSortM_frame
#print axioms Pdq.siftDownM_frame
#print axioms Pdq.heapSortM.build_frame
#print axioms Pdq.heapSortM.pop_frame
#print axioms Pdq.heapSortM_frame
#print axioms Pdq.partialInsertionSortM.sinkLeft_frame
#print axioms Pdq.partialInsertionSortM.riseRight_frame
#print axioms Pdq.partialInsertionSortM.step_frame
#print axioms Pdq.partialInsertionSortM_frame
#print axioms Pdq.partitionM.loop_frame
#print axioms Pdq.partitionM_frame
#print axioms Pdq.partitionEqualM.loop_frame
#print axioms Pdq.partitionEqualM_frame
#print axioms Pdq.sortM_frame
#print axioms Pdq.sortM_of_le_succ
#print axioms Pdq.qsort_perm
#print axioms Pdq.size_qsort
#print axioms Pdq.getElem_qsort_of_not_mem
#print axioms Pdq.mem_qsort
#print axioms Pdq.qsortOrd_perm
#print axioms Pdq.size_qsortOrd
#print axioms Pdq.mem_qsortOrd
