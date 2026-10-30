/-
Copyright (c) 2026 Matthias Goergens. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Matthias Goergens
-/
module

prelude
public import Init.Data.Array.QSort.Basic
import all Init.Data.Array.QSort.Basic
import Init.ByCases
import Init.Control.Lawful.Instances
import Init.Control.State
import Init.Data.Int.Pow
import Init.Data.Nat.Lemmas
import Init.Omega
import Init.RCases

/-!
# The number of comparisons `Array.qsort` makes

`Array.qsort` makes `O(n log n)` comparisons for every comparison function, lawful or not.

The code that `qsort` runs at `Id` (`sortM` and its helpers) is run in a state monad whose
comparison `count lt` adds one to a counter. `Cost x P` says that from every counter value `x`
returns some result `r` and adds some `k` with `P r k`; the lemmas below bound `k` for each helper,
and `sortM_cost` bounds the whole sort by a potential: the length of the range times a measure
`clog` of the depth left (the number of balanced partitions that can still shrink it), the
partitions left before heapsort, and a reserve for heapsort and for an equal-key partition. Nothing
about `lt` is assumed.
-/

namespace Array.QSort.Internal

variable {α : Type u} {n : Nat}

/-- The comparison `lt`, counting each call in the state. -/
def count (lt : α → α → Bool) (x y : α) : StateM (ULift.{u} Nat) (ULift.{u} Bool) :=
  modifyGet fun s => (⟨lt x y⟩, ⟨s.down + 1⟩)

/-- From every counter value `s`, `x` returns some `r` and leaves the counter at `s + k` with
`P r k`. -/
def Cost {β : Type u} (x : StateM (ULift.{u} Nat) β) (P : β → Nat → Prop) : Prop :=
  ∀ s : Nat, ∃ r k, x.run ⟨s⟩ = (r, ⟨s + k⟩) ∧ P r k

namespace Cost

variable {β γ : Type u} {x : StateM (ULift.{u} Nat) β} {P Q : β → Nat → Prop}

theorem pure' {r : β} (h : P r 0) : Cost (pure r) P := fun _ => ⟨r, 0, rfl, h⟩

theorem bind {f : β → StateM (ULift.{u} Nat) γ} {Q : γ → Nat → Prop} (hx : Cost x P)
    (hf : ∀ r k, P r k → Cost (f r) (fun r' k' => Q r' (k + k'))) : Cost (x >>= f) Q := by
  intro s
  obtain ⟨r, k, e, hp⟩ := hx s
  obtain ⟨r', k', e', hq⟩ := hf r k hp (s + k)
  refine ⟨r', k + k', ?_, hq⟩
  show (x.run ⟨s⟩ >>= fun p => (f p.1).run p.2) = _
  rw [e]
  show (f r).run ⟨s + k⟩ = _
  rw [e', Nat.add_assoc]

theorem mono (hx : Cost x P) (h : ∀ r k, P r k → Q r k) : Cost x Q := fun s =>
  let ⟨r, k, e, hp⟩ := hx s
  ⟨r, k, e, h r k hp⟩

theorem count' {lt : α → α → Bool} {x y : α} {P : ULift.{u} Bool → Nat → Prop}
    (h : P ⟨lt x y⟩ 1) : Cost (count lt x y) P := fun _ => ⟨⟨lt x y⟩, 1, rfl, h⟩

/-- A comparison followed by the rest. -/
theorem bind_count {lt : α → α → Bool} {x y : α} {f : ULift.{u} Bool → StateM (ULift.{u} Nat) γ}
    {Q : γ → Nat → Prop} (h : Cost (f ⟨lt x y⟩) (fun r k => Q r (1 + k))) :
    Cost (count lt x y >>= f) Q :=
  bind (P := fun r k => r = ⟨lt x y⟩ ∧ k = 1) (count' ⟨rfl, rfl⟩) fun _ _ ⟨hr, hk⟩ => hr ▸ hk ▸ h

end Cost

/-! ### Insertion sort: at most `(b - a) * (b - a)` comparisons -/

theorem insertionSortM.sink_cost (lt : α → α → Bool) (a b : Nat) (v : Vector α n) (j : Nat)
    (hj : j < n) :
    Cost (insertionSortM.sink (count lt) a b v j hj) (fun _ k => k ≤ j - a) := by
  fun_induction insertionSortM.sink (count lt) a b v j hj with
  | case1 v j hj h ih =>
    apply Cost.bind_count
    split
    · exact ih.mono fun _ _ hk => by omega
    · exact Cost.pure' (by omega)
  | case2 v j hj h =>
    exact Cost.pure' (by omega)

theorem insertionSortM.outer_cost (lt : α → α → Bool) (a b : Nat) (hb : b ≤ n)
    (v : Vector α n) (i : Nat) :
    Cost (insertionSortM.outer (count lt) a b hb v i) (fun _ k => k ≤ (b - i) * (b - a)) := by
  fun_induction insertionSortM.outer (count lt) a b hb v i with
  | case1 v i h ih =>
    have e : (b - i) * (b - a) = (b - (i + 1)) * (b - a) + (b - a) := by
      rw [show b - i = (b - (i + 1)) + 1 by omega, Nat.succ_mul]
    have : i - a ≤ b - a := by omega
    exact Cost.bind (insertionSortM.sink_cost lt a b _ _ _) fun r k hk =>
      (ih r).mono fun _ k' hk' => by omega
  | case2 v i h => exact Cost.pure' (by omega)

theorem insertionSortM_cost (lt : α → α → Bool) (v : Vector α n) (a b : Nat) (hb : b ≤ n) :
    Cost (insertionSortM (count lt) v a b hb) (fun _ k => k ≤ (b - a) * (b - a)) :=
  (insertionSortM.outer_cost lt a b hb v (a + 1)).mono fun _ k hk =>
    Nat.le_trans hk (Nat.mul_le_mul_right _ (by omega))

/-! ### Heapsort: at most `4 * ((b - a) * log₂ (b - a))` comparisons -/

theorem log2_mono {x y : Nat} (h : x ≤ y) : Nat.log2 x ≤ Nat.log2 y := by
  rcases Nat.eq_zero_or_pos x with rfl | hx
  · simp [Nat.log2_zero]
  · exact (Nat.le_log2 (by omega)).2 (Nat.le_trans (Nat.log2_self_le (by omega)) h)

theorem siftDownM_cost (lt : α → α → Bool) (v : Vector α n) (root hi first : Nat)
    (h : first + hi ≤ n) :
    Cost (siftDownM (count lt) v root hi first h)
      (fun _ k => k ≤ 2 * (Nat.log2 hi - Nat.log2 (root + 1))) := by
  fun_induction siftDownM (count lt) v root hi first h with
  | case1 v root hc ih =>
    refine Cost.bind (P := fun r k => k ≤ 1 ∧ 2 * root + 1 ≤ r.down.1) ?_ fun r k hk => ?_
    · split
      · apply Cost.bind_count
        split
        · exact Cost.pure' (by simp)
        · exact Cost.pure' (by simp)
      · exact Cost.pure' (by simp)
    · obtain ⟨⟨c, hc1, hc2⟩⟩ := r
      dsimp only at hk ⊢
      have l1 : Nat.log2 (root + 1) + 1 ≤ Nat.log2 (c + 1) := by
        rw [← Nat.log2_two_mul (by omega)]
        exact log2_mono (by omega)
      have l2 : Nat.log2 (c + 1) ≤ Nat.log2 hi := log2_mono (by omega)
      apply Cost.bind_count
      split
      · exact (ih c ⟨hc1, hc2⟩).mono fun _ k' hk' => by omega
      · exact Cost.pure' (by omega)
  | case2 v root hc => exact Cost.pure' (by omega)

theorem heapSortM.build_cost (lt : α → α → Bool) (a b : Nat) (hab : a ≤ b) (hb : b ≤ n)
    (v : Vector α n) (k : Nat) :
    Cost (heapSortM.build (count lt) a b hab hb v k)
      (fun _ c => c ≤ k * (2 * Nat.log2 (b - a))) := by
  fun_induction heapSortM.build (count lt) a b hab hb v k with
  | case1 v => exact Cost.pure' (by omega)
  | case2 v k ih =>
    have := Nat.log2 (b - a) - Nat.log2 (k + 1)
    exact Cost.bind (siftDownM_cost lt v k (b - a) a _) fun r c hc => (ih r).mono fun _ c' hc' => by
      rw [Nat.succ_mul]; omega

theorem heapSortM.pop_cost (lt : α → α → Bool) (a b : Nat) (hab : a ≤ b) (hb : b ≤ n)
    (v : Vector α n) (i : Nat) (hi : i ≤ b - a) :
    Cost (heapSortM.pop (count lt) a b hab hb v i hi)
      (fun _ c => c ≤ i * (2 * Nat.log2 (b - a))) := by
  fun_induction heapSortM.pop (count lt) a b hab hb v i hi with
  | case1 v => exact Cost.pure' (by omega)
  | case2 v i hi ih =>
    have := log2_mono (show i ≤ b - a by omega)
    exact Cost.bind (siftDownM_cost lt _ 0 i a _) fun r c hc => (ih r).mono fun _ c' hc' => by
      rw [Nat.succ_mul]; omega

theorem heapSortM_cost (lt : α → α → Bool) (v : Vector α n) (a b : Nat) (hab : a ≤ b)
    (hb : b ≤ n) :
    Cost (heapSortM (count lt) v a b hab hb) (fun _ c => c ≤ 4 * ((b - a) * Nat.log2 (b - a))) := by
  unfold heapSortM
  refine Cost.bind (heapSortM.build_cost lt a b hab hb v _) fun r c hc =>
    (heapSortM.pop_cost lt a b hab hb r _ _).mono
    fun _ c' hc' => ?_
  have h1 : ((b - a - 1) / 2 + 1) * (2 * Nat.log2 (b - a)) ≤ (b - a) * (2 * Nat.log2 (b - a)) := by
    rcases Nat.eq_zero_or_pos (b - a) with h0 | h0
    · simp [h0, Nat.log2_zero]
    · exact Nat.mul_le_mul_right _ (by omega)
  have h2 : (b - a) * (2 * Nat.log2 (b - a)) = 2 * ((b - a) * Nat.log2 (b - a)) := by
    rw [Nat.mul_left_comm]
  omega

/-! ### Partial insertion sort: at most `6 * (b - a) + 4` comparisons -/

theorem partialInsertionSortM.scan_cost (lt : α → α → Bool) (a b : Nat) (hb : b ≤ n)
    (v : Vector α n) (i : Nat) (h1 : a < i) (h2 : i ≤ b) :
    Cost (partialInsertionSortM.scan (count lt) a b hb v i h1 h2)
      (fun r k => k + i ≤ r.down.1 + 1 ∧ (r.down.1 = b → k + i ≤ b)) := by
  fun_induction partialInsertionSortM.scan (count lt) a b hb v i h1 h2 with
  | case1 i h1 h2 h ih =>
    apply Cost.bind_count
    split
    · exact Cost.pure' (by simp; omega)
    · exact ih.mono fun _ k hk => by omega
  | case2 i h1 h2 h => exact Cost.pure' (by simp; omega)

theorem partialInsertionSortM.sinkLeft_cost (lt : α → α → Bool) (a b : Nat) (hb : b ≤ n)
    (v : Vector α n) (j : Nat) (hj : j < b) :
    Cost (partialInsertionSortM.sinkLeft (count lt) a b hb v j hj) (fun _ k => k ≤ j - a) := by
  fun_induction partialInsertionSortM.sinkLeft (count lt) a b hb v j hj with
  | case1 v j hj h ih =>
    apply Cost.bind_count
    split
    · exact ih.mono fun _ _ hk => by omega
    · exact Cost.pure' (by omega)
  | case2 v j hj h => exact Cost.pure' (by omega)

theorem partialInsertionSortM.riseRight_cost (lt : α → α → Bool) (a b : Nat) (hb : b ≤ n)
    (v : Vector α n) (j : Nat) (hj : a < j) :
    Cost (partialInsertionSortM.riseRight (count lt) a b hb v j hj) (fun _ k => k ≤ b - j) := by
  fun_induction partialInsertionSortM.riseRight (count lt) a b hb v j hj with
  | case1 v j hj h ih =>
    apply Cost.bind_count
    split
    · exact ih.mono fun _ _ hk => by omega
    · exact Cost.pure' (by omega)
  | case2 v j hj h => exact Cost.pure' (by omega)

theorem partialInsertionSortM.step_cost (lt : α → α → Bool) (a b : Nat) (hb : b ≤ n)
    (v : Vector α n) (i steps : Nat) (h1 : a < i) (h2 : i ≤ b) :
    Cost (partialInsertionSortM.step (count lt) a b hb v i steps h1 h2)
      (fun _ k => k ≤ (b - i) + (5 - steps) * (b - a + 1)) := by
  fun_induction partialInsertionSortM.step (count lt) a b hb v i steps h1 h2 with
  | case1 v i steps h1 h2 hs ih =>
    have e : (5 - steps) * (b - a + 1) = (5 - (steps + 1)) * (b - a + 1) + (b - a + 1) := by
      rw [show 5 - steps = (5 - (steps + 1)) + 1 by omega, Nat.succ_mul]
    refine Cost.bind (partialInsertionSortM.scan_cost lt a b hb v i h1 h2) fun r k hk => ?_
    obtain ⟨⟨i', hi⟩⟩ := r
    dsimp only at hk ⊢
    split
    · exact Cost.pure' (by omega)
    · split
      · exact Cost.pure' (by omega)
      · split
        · refine Cost.bind (partialInsertionSortM.sinkLeft_cost lt a b hb _ _ _)
            fun r k2 hk2 => ?_
          split
          · exact Cost.bind (partialInsertionSortM.riseRight_cost lt a b hb _ _ _)
              fun r' k3 hk3 => (ih i' hi r').mono fun _ k4 hk4 => by omega
          · simp only [pure_bind]
            exact (ih i' hi r).mono fun _ k4 hk4 => by omega
        · simp only [pure_bind]
          split
          · exact Cost.bind (partialInsertionSortM.riseRight_cost lt a b hb _ _ _)
              fun r' k3 hk3 => (ih i' hi r').mono fun _ k4 hk4 => by omega
          · exact (ih i' hi _).mono fun _ k4 hk4 => by omega
  | case2 v i steps h1 h2 hs => exact Cost.pure' (by omega)

theorem partialInsertionSortM_cost (lt : α → α → Bool) (v : Vector α n) (a b : Nat)
    (hab : a < b) (hb : b ≤ n) :
    Cost (partialInsertionSortM (count lt) v a b hab hb) (fun _ k => k ≤ 6 * (b - a) + 4) :=
  (partialInsertionSortM.step_cost lt a b hb v (a + 1) 0 _ _).mono fun _ k hk => by omega

/-! ### Choosing the pivot: at most 12 comparisons -/

theorem order2M_cost (lt : α → α → Bool) (v : Vector α n) (hb : b ≤ n) (x y : Idx a b)
    (swaps : Nat) : Cost (order2M (count lt) v hb x y swaps) (fun _ k => k ≤ 1) := by
  unfold order2M
  apply Cost.bind_count
  split <;> exact Cost.pure' (by omega)

theorem medianM_cost (lt : α → α → Bool) (v : Vector α n) (hb : b ≤ n) (x y z : Idx a b)
    (swaps : Nat) : Cost (medianM (count lt) v hb x y z swaps) (fun _ k => k ≤ 3) := by
  unfold medianM
  refine Cost.bind (order2M_cost lt v hb _ _ _) fun ⟨(x, y, s)⟩ k1 hk1 => ?_
  refine Cost.bind (order2M_cost lt v hb _ _ _) fun ⟨(y, _, s)⟩ k2 hk2 => ?_
  refine Cost.bind (order2M_cost lt v hb _ _ _) fun ⟨(_, y, s)⟩ k3 hk3 => ?_
  exact Cost.pure' (by omega)

theorem choosePivotM_cost (lt : α → α → Bool) (v : Vector α n) (a b : Nat) (hab : a < b)
    (hb : b ≤ n) : Cost (choosePivotM (count lt) v a b hab hb) (fun _ k => k ≤ 12) := by
  unfold choosePivotM
  dsimp only
  split
  · refine Cost.bind (P := fun _ k => k ≤ 9) ?_ fun ⟨(i, j, k, s)⟩ c hc => ?_
    · split
      · refine Cost.bind (medianM_cost lt v hb _ _ _ _) fun ⟨(i, s)⟩ k1 hk1 => ?_
        refine Cost.bind (medianM_cost lt v hb _ _ _ _) fun ⟨(j, s)⟩ k2 hk2 => ?_
        refine Cost.bind (medianM_cost lt v hb _ _ _ _) fun ⟨(k, s)⟩ k3 hk3 => ?_
        exact Cost.pure' (by omega)
      · exact Cost.pure' (by omega)
    · refine Cost.bind (medianM_cost lt v hb _ _ _ _) fun ⟨(j, s)⟩ k4 hk4 => ?_
      exact Cost.pure' (by omega)
  · exact Cost.pure' (by omega)

/-! ### Partitions: at most `b - a` comparisons

A round of a partition loop on `[i, j]` compares each position once from the left up to where the
left scan stops, and once from the right down to where the right scan stops; the next round works
on what lies strictly between, so the rounds compare `j + 2 - i` times in all. -/

theorem partitionM.scanUp_cost (lt : α → α → Bool) (a b : Nat) (pivot : Idx a b) (hb : b ≤ n)
    (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    Cost (partitionM.scanUp (count lt) a b pivot hb p v i j h1 h2 h3)
      (fun r k => k + i ≤ r.down.1 + 1 ∧ k + i ≤ j + 1) := by
  fun_induction partitionM.scanUp (count lt) a b pivot hb p v i j h1 h2 h3 with
  | case1 i h1 h2 h ih =>
    apply Cost.bind_count
    split
    · exact Cost.bind ih fun ⟨⟨i', hi'⟩⟩ k hk => Cost.pure' (by simp at hk ⊢; omega)
    · exact Cost.pure' (by simp; omega)
  | case2 i h1 h2 h => exact Cost.pure' (by simp; omega)

theorem partitionM.scanDown_cost (lt : α → α → Bool) (a b : Nat) (pivot : Idx a b) (hb : b ≤ n)
    (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    Cost (partitionM.scanDown (count lt) a b pivot hb p v i j h1 h2 h3)
      (fun r k => k + r.down.1 ≤ j + 1 ∧ k + i ≤ j + 1) := by
  fun_induction partitionM.scanDown (count lt) a b pivot hb p v i j h1 h2 h3 with
  | case1 j h2 h3 h ih =>
    apply Cost.bind_count
    split
    · exact Cost.pure' (by simp; omega)
    · exact Cost.bind ih fun ⟨⟨j', hj'⟩⟩ k hk => Cost.pure' (by simp at hk ⊢; omega)
  | case2 j h2 h3 h => exact Cost.pure' (by simp; omega)

theorem partitionM.loop_cost (lt : α → α → Bool) (a b : Nat) (pivot : Idx a b) (hb : b ≤ n)
    (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    Cost (partitionM.loop (count lt) a b pivot hb p v i j h1 h2 h3) (fun _ k => k ≤ j + 2 - i) := by
  fun_induction partitionM.loop (count lt) a b pivot hb p v i j h1 h2 h3 with
  | case1 v i j h1 h2 h3 ih =>
    refine Cost.bind (partitionM.scanUp_cost lt a b pivot hb p v i j h1 h2 h3)
      fun ⟨⟨i', hi⟩⟩ k1 hk1 => ?_
    refine Cost.bind (partitionM.scanDown_cost lt a b pivot hb p v i' j _ _ h3)
      fun ⟨⟨j', hj⟩⟩ k2 hk2 => ?_
    dsimp only at hk1 hk2 ⊢
    split
    · exact (ih i' hi j' hj ‹_›).mono fun _ k3 hk3 => by omega
    · exact Cost.pure' (by omega)

theorem partitionM_cost (lt : α → α → Bool) (v : Vector α n) (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) : Cost (partitionM (count lt) v a b pivot hb) (fun _ k => k ≤ b - a) := by
  have := pivot.2
  unfold partitionM
  dsimp only
  refine Cost.bind (partitionM.scanUp_cost lt a b pivot hb _ _ _ _ _ _ _)
    fun ⟨⟨i', hi⟩⟩ k1 hk1 => ?_
  refine Cost.bind (partitionM.scanDown_cost lt a b pivot hb _ _ i' _ _ _ _)
    fun ⟨⟨j', hj⟩⟩ k2 hk2 => ?_
  dsimp only at hk1 hk2 ⊢
  split
  · exact (partitionM.loop_cost lt a b pivot hb _ _ _ _ _ _ _).mono fun _ k3 hk3 => by omega
  · exact Cost.pure' (by omega)

theorem partitionEqualM.scanUp_cost (lt : α → α → Bool) (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    Cost (partitionEqualM.scanUp (count lt) a b pivot hb p v i j h1 h2 h3)
      (fun r k => k + i ≤ r.down.1 + 1 ∧ k + i ≤ j + 1) := by
  fun_induction partitionEqualM.scanUp (count lt) a b pivot hb p v i j h1 h2 h3 with
  | case1 i h1 h2 h ih =>
    apply Cost.bind_count
    split
    · exact Cost.pure' (by simp; omega)
    · exact Cost.bind ih fun ⟨⟨i', hi'⟩⟩ k hk => Cost.pure' (by simp at hk ⊢; omega)
  | case2 i h1 h2 h => exact Cost.pure' (by simp; omega)

theorem partitionEqualM.scanDown_cost (lt : α → α → Bool) (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    Cost (partitionEqualM.scanDown (count lt) a b pivot hb p v i j h1 h2 h3)
      (fun r k => k + r.down.1 ≤ j + 1 ∧ k + i ≤ j + 1) := by
  fun_induction partitionEqualM.scanDown (count lt) a b pivot hb p v i j h1 h2 h3 with
  | case1 j h2 h3 h ih =>
    apply Cost.bind_count
    split
    · exact Cost.bind ih fun ⟨⟨j', hj'⟩⟩ k hk => Cost.pure' (by simp at hk ⊢; omega)
    · exact Cost.pure' (by simp; omega)
  | case2 j h2 h3 h => exact Cost.pure' (by simp; omega)

theorem partitionEqualM.loop_cost (lt : α → α → Bool) (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    Cost (partitionEqualM.loop (count lt) a b pivot hb p v i j h1 h2 h3)
      (fun _ k => k ≤ j + 2 - i) := by
  fun_induction partitionEqualM.loop (count lt) a b pivot hb p v i j h1 h2 h3 with
  | case1 v i j h1 h2 h3 ih =>
    refine Cost.bind (partitionEqualM.scanUp_cost lt a b pivot hb p v i j h1 h2 h3)
      fun ⟨⟨i', hi⟩⟩ k1 hk1 => ?_
    refine Cost.bind (partitionEqualM.scanDown_cost lt a b pivot hb p v i' j _ _ h3)
      fun ⟨⟨j', hj⟩⟩ k2 hk2 => ?_
    dsimp only at hk1 hk2 ⊢
    split
    · exact (ih i' hi j' hj ‹_›).mono fun _ k3 hk3 => by omega
    · exact Cost.pure' (by omega)

theorem partitionEqualM_cost (lt : α → α → Bool) (v : Vector α n) (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) : Cost (partitionEqualM (count lt) v a b pivot hb) (fun _ k => k ≤ b - a) := by
  have := pivot.2
  unfold partitionEqualM
  dsimp only
  exact (partitionEqualM.loop_cost lt a b pivot hb _ _ _ _ _ _ _).mono fun _ k hk => by omega

/-! ### The depth measure

A balanced partition leaves both sides at most `L - L / 8` long. `clog L` counts how often that
cut can be applied before the length is at most 12; it is monotone, drops by one under the cut,
and is at most `6 * log₂ L + 6`, because six cuts more than halve a length. -/

/-- How often `L ↦ L - L / 8` can be applied to `L` before it is at most 12. -/
def clog (L : Nat) : Nat := if L ≤ 12 then 0 else clog (L - L / 8) + 1
termination_by L
decreasing_by omega

theorem clog_mono {x y : Nat} (h : x ≤ y) : clog x ≤ clog y := by
  induction y using Nat.strongRecOn generalizing x with
  | _ y ih =>
    rw [clog.eq_1 x, clog.eq_1 y]
    split
    · exact Nat.zero_le _
    · split
      · omega
      · exact Nat.succ_le_succ (ih _ (by omega) (by omega))

theorem clog_step {x L : Nat} (hL : 13 ≤ L) (hx : x ≤ L - L / 8) : clog x + 1 ≤ clog L := by
  conv => rhs; rw [clog]
  simp only [show ¬L ≤ 12 by omega, ↓reduceIte]
  exact Nat.succ_le_succ (clog_mono hx)

theorem clog_le_of_pow {k L : Nat} (h : 7 ^ k * (L - 7) < 6 * 8 ^ k) : clog L ≤ k := by
  induction k generalizing L with
  | zero =>
    rw [clog]
    simp only [Nat.pow_zero, Nat.one_mul, Nat.mul_one] at h
    simp only [show L ≤ 12 by omega, ↓reduceIte, Nat.le_refl]
  | succ k ih =>
    rw [clog]
    split
    · exact Nat.zero_le _
    · refine Nat.succ_le_succ (ih ?_)
      have h8 : 8 * (L - L / 8 - 7) ≤ 7 * (L - 7) := by omega
      have h1 : 8 * (7 ^ k * (L - L / 8 - 7)) ≤ 7 ^ (k + 1) * (L - 7) := by
        rw [Nat.mul_left_comm, Nat.pow_succ, Nat.mul_assoc]
        exact Nat.mul_le_mul_left _ (by rw [Nat.mul_comm] at h8 ⊢; omega)
      have h2 : 6 * 8 ^ (k + 1) = 8 * (6 * 8 ^ k) := by
        rw [Nat.pow_succ]; omega
      omega

theorem clog_le_log2 (L : Nat) : clog L ≤ 6 * Nat.log2 L + 6 := by
  apply clog_le_of_pow
  have hL : L < 2 ^ (Nat.log2 L + 1) := Nat.lt_log2_self
  have hp : 0 < 7 ^ (6 * Nat.log2 L + 6) := Nat.pow_pos (by omega)
  have e1 : 6 * Nat.log2 L + 6 = 6 * (Nat.log2 L + 1) := by omega
  have key : 7 ^ (6 * (Nat.log2 L + 1)) * 2 ^ (Nat.log2 L + 1) ≤ 8 ^ (6 * (Nat.log2 L + 1)) := by
    rw [Nat.pow_mul, Nat.pow_mul, ← Nat.mul_pow]
    exact Nat.pow_le_pow_left (by decide) _
  rw [e1] at hp ⊢
  calc 7 ^ (6 * (Nat.log2 L + 1)) * (L - 7)
      ≤ 7 ^ (6 * (Nat.log2 L + 1)) * L := Nat.mul_le_mul_left _ (by omega)
    _ < 7 ^ (6 * (Nat.log2 L + 1)) * 2 ^ (Nat.log2 L + 1) := Nat.mul_lt_mul_of_pos_left hL hp
    _ ≤ 8 ^ (6 * (Nat.log2 L + 1)) := key
    _ ≤ 6 * 8 ^ (6 * (Nat.log2 L + 1)) := by omega

/-! ### The potential -/

/-- The proofs below need only this of the cutoff; its value enters the bound in `pot_top`. -/
theorem twelve_le_insertionCutoff : 12 ≤ insertionCutoff := by decide

/-- A bound on the comparisons `sortM` makes on a range of length `L`: per element, 18 for each
level of depth (`clog L`), each unbalanced partition left (`limit`) and an unused balanced flag; 9
in reserve for an equal-key partition, which a range left by one does not get again; heapsort's
`4 * log₂ L`; and `insertionCutoff` for insertion sort, whose `L * L` comparisons are at most
`insertionCutoff * L` on the ranges it sorts. -/
def pot (L limit : Nat) (balanced afterEqual : Bool) : Nat :=
  18 * (L * (clog L + limit + balanced.toNat)) + (if afterEqual then 0 else 9 * L) +
    4 * (L * Nat.log2 L) + insertionCutoff * L

theorem pot_partition {L x y l1 limit W : Nat} {bal bal' ae : Bool} (hxy : x + y + 1 = L)
    (hx : clog x + 1 ≤ clog L) (hy : clog y + bal'.toNat ≤ clog L)
    (hl : l1 + 1 ≤ limit + bal.toNat) (hW : W ≤ 7 * L + 17) (hL : 13 ≤ L) :
    W + (pot x l1 true false + pot y l1 bal' false) ≤ pot L limit bal ae := by
  unfold pot
  simp only [Bool.toNat_true, Bool.false_eq_true, ↓reduceIte]
  have h1 : x * (clog x + l1 + 1) ≤ x * (clog L + l1) := Nat.mul_le_mul_left _ (by omega)
  have h2 : y * (clog y + l1 + bal'.toNat) ≤ y * (clog L + l1) := Nat.mul_le_mul_left _ (by omega)
  have h3 : L * (clog L + l1) + L ≤ L * (clog L + limit + bal.toNat) := by
    rw [← Nat.mul_succ]; exact Nat.mul_le_mul_left _ (by omega)
  have h4 : x * (clog L + l1) + y * (clog L + l1) ≤ L * (clog L + l1) := by
    rw [← Nat.add_mul]; exact Nat.mul_le_mul_right _ (by omega)
  have h5 : x * Nat.log2 x ≤ x * Nat.log2 L := Nat.mul_le_mul_left _ (log2_mono (by omega))
  have h6 : y * Nat.log2 y ≤ y * Nat.log2 L := Nat.mul_le_mul_left _ (log2_mono (by omega))
  have h7 : x * Nat.log2 L + y * Nat.log2 L ≤ L * Nat.log2 L := by
    rw [← Nat.add_mul]; exact Nat.mul_le_mul_right _ (by omega)
  have h8 : insertionCutoff * x + insertionCutoff * y ≤ insertionCutoff * L := by
    rw [← Nat.mul_add]; exact Nat.mul_le_mul_left _ (by omega)
  have h9 : 12 * L ≤ insertionCutoff * L := Nat.mul_le_mul_right _ twelve_le_insertionCutoff
  split <;> omega

theorem pot_equal {L L' l1 limit W : Nat} {bal : Bool} (hL' : L' ≤ L) (hl : l1 ≤ limit)
    (hW : W ≤ 7 * L + 17) (hL : 13 ≤ L) :
    W + pot L' l1 bal true ≤ pot L limit bal false := by
  unfold pot
  simp only [↓reduceIte, Bool.false_eq_true]
  have h1 : L' * (clog L' + l1 + bal.toNat) ≤ L * (clog L + limit + bal.toNat) :=
    Nat.mul_le_mul hL' (by have := clog_mono hL'; omega)
  have h2 : L' * Nat.log2 L' ≤ L * Nat.log2 L := Nat.mul_le_mul hL' (log2_mono hL')
  have h3 : insertionCutoff * L' ≤ insertionCutoff * L := Nat.mul_le_mul_left _ hL'
  have h4 : 12 * L ≤ insertionCutoff * L := Nat.mul_le_mul_right _ twelve_le_insertionCutoff
  omega

theorem pot_done {L limit W : Nat} {bal ae : Bool} (hW : W ≤ 6 * L + 17) (hL : 13 ≤ L) :
    W ≤ pot L limit bal ae := by
  unfold pot
  have : 12 * L ≤ insertionCutoff * L := Nat.mul_le_mul_right _ twelve_le_insertionCutoff
  split <;> omega

/-! ### The whole sort -/

theorem sortM_cost (lt : α → α → Bool) (lo : Nat) (v : Vector α n) (a b limit : Nat)
    (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel) (hlo : lo ≤ a)
    (hab : a ≤ b) (hb : b ≤ n) :
    Cost (sortM (count lt) lo v a b limit balanced partitioned afterEqual fuel hf hlo hab hb)
      (fun _ k => k ≤ pot (b - a) limit balanced afterEqual) := by
  unfold sortM
  fun_induction sortCoreM partitionEqualM heapSortM partialInsertionSortM
    (count lt) lo v a b limit balanced partitioned afterEqual fuel hf hlo hab hb
  case case1 v a b limit bal part ae hf hlo hab hb h12 =>
    refine (insertionSortM_cost lt v a b hb).mono fun _ k hk => ?_
    have : (b - a) * (b - a) ≤ insertionCutoff * (b - a) := Nat.mul_le_mul_right _ h12
    unfold pot
    omega
  case case2 v a b bal part ae hf hlo hab hb h12 =>
    have := twelve_le_insertionCutoff
    refine (heapSortM_cost lt v a b hab hb).mono fun _ k hk => ?_
    unfold pot
    omega
  case case3 v a b limit bal part ae hlo hab hb h12 hl fuel hf v1 l1 e1 ih5 ih4 ih3 ih2 ih1 =>
    have := twelve_le_insertionCutoff
    have hl1 : l1 + 1 ≤ limit + bal.toNat ∧ l1 ≤ limit := by
      split at e1 <;> simp only [Prod.mk.injEq] at e1 <;> obtain ⟨-, rfl⟩ := e1 <;>
        simp_all <;> omega
    refine Cost.bind (choosePivotM_cost lt v1 a b _ hb) fun ⟨(pivot, hint)⟩ k1 hk1 => ?_
    dsimp only
    split
    all_goals
      split
      all_goals
        refine Cost.bind (P := fun _ k => k ≤ 6 * (b - a) + 4) ?_ ?_
        · first
          | exact partialInsertionSortM_cost lt _ a b _ hb
          | exact Cost.pure' (by omega)
        rintro ⟨v3, done⟩ k2 hk2
        dsimp only
        split
        · exact Cost.pure' (pot_done (by omega) (by omega))
        refine Cost.bind (P := fun r k => k ≤ 1 ∧ (r.down = true → ae = false)) ?_ ?_
        · split
          · apply Cost.bind_count
            exact Cost.pure' ⟨by omega, fun _ => by simp_all⟩
          · exact Cost.pure' ⟨by omega, by simp⟩
        rintro ⟨equal⟩ k3 ⟨hk3, hae⟩
        dsimp only at hae ⊢
        split
        · refine Cost.bind (partitionEqualM_cost lt v3 a b _ hb)
            fun ⟨v4, ⟨mid, hm⟩⟩ k4 hk4 => ?_
          dsimp only
          obtain rfl := hae ‹_›
          exact (ih5 pivot pivot v4 mid hm).mono fun _ k5 hk5 =>
            Nat.le_trans (by omega) (pot_equal (W := k1 + k2 + k3 + k4) (L' := b - mid)
              (by omega) hl1.2 (by omega) (by omega))
        · refine Cost.bind (partitionM_cost lt v3 a b _ hb)
            fun ⟨v4, ⟨mid, hm⟩, already⟩ k4 hk4 => ?_
          dsimp only
          split
          · refine Cost.bind (ih4 pivot pivot v4 mid hm) fun v5 k5 hk5 =>
              (ih3 pivot pivot mid hm already v5).mono fun _ k6 hk6 => ?_
            have hx := clog_step (x := mid - a) (L := b - a) (by omega) (by omega)
            have hy : clog (b - (mid + 1)) + (decide (mid - a ≥ (b - a) / 8)).toNat ≤
                clog (b - a) := by
              by_cases hd : mid - a ≥ (b - a) / 8
              · have := clog_step (x := b - (mid + 1)) (L := b - a) (by omega) (by omega)
                simp only [hd, decide_true, Bool.toNat_true]; omega
              · have := clog_mono (show b - (mid + 1) ≤ b - a by omega)
                simp only [hd, decide_false, Bool.toNat_false]; omega
            exact Nat.le_trans (by omega) (pot_partition (W := k1 + k2 + k3 + k4) (ae := ae)
              (show mid - a + (b - (mid + 1)) + 1 = b - a by omega) hx hy hl1.1 (by omega)
              (by omega))
          · refine Cost.bind (ih2 pivot pivot v4 mid hm) fun v5 k5 hk5 =>
              (ih1 pivot pivot mid hm already v5).mono fun _ k6 hk6 => ?_
            have hx := clog_step (x := b - (mid + 1)) (L := b - a) (by omega) (by omega)
            have hy : clog (mid - a) + (decide (b - mid ≥ (b - a) / 8)).toNat ≤ clog (b - a) := by
              by_cases hd : b - mid ≥ (b - a) / 8
              · have := clog_step (x := mid - a) (L := b - a) (by omega) (by omega)
                simp only [hd, decide_true, Bool.toNat_true]; omega
              · have := clog_mono (show mid - a ≤ b - a by omega)
                simp only [hd, decide_false, Bool.toNat_false]; omega
            exact Nat.le_trans (by omega) (pot_partition (W := k1 + k2 + k3 + k4) (ae := ae)
              (show b - (mid + 1) + (mid - a) + 1 = b - a by omega) hx hy hl1.1 (by omega)
              (by omega))

theorem pot_top (L : Nat) :
    pot L (Nat.log2 L + 1) true false ≤ 130 * (L * (Nat.log2 L + 1)) + 51 * L := by
  unfold pot insertionCutoff
  simp only [Bool.toNat_true, Bool.false_eq_true, ↓reduceIte]
  have h1 : L * (clog L + (Nat.log2 L + 1) + 1) ≤ 7 * (L * (Nat.log2 L + 1)) + L := by
    have : clog L + (Nat.log2 L + 1) + 1 ≤ 7 * (Nat.log2 L + 1) + 1 := by
      have := clog_le_log2 L; omega
    calc L * (clog L + (Nat.log2 L + 1) + 1) ≤ L * (7 * (Nat.log2 L + 1) + 1) :=
          Nat.mul_le_mul_left _ this
      _ = 7 * (L * (Nat.log2 L + 1)) + L := by rw [Nat.mul_succ, Nat.mul_left_comm]
  have h2 : L * Nat.log2 L ≤ L * (Nat.log2 L + 1) := Nat.mul_le_mul_left _ (by omega)
  omega

end Array.QSort.Internal

namespace Array

open QSort.Internal

public section

variable {α : Type u}

/--
The number of comparisons `qsort as lt lo hi` makes: its call of `sortM`, with the same arguments,
run with a comparison that counts its calls.
-/
def qsortComparisons (as : Array α) (lt : α → α → Bool) (lo hi : Nat) : Nat :=
  if h : as.size = 0 then 0
  else
    let lo := min lo (as.size - 1)
    let hi := max lo (min hi (as.size - 1))
    ((sortM (QSort.Internal.count lt) lo as.toVector lo (hi + 1) (Nat.log2 (hi + 1 - lo) + 1) true true false
      (hi + 1 - lo) (Nat.le_refl _) (Nat.le_refl _) (by omega) (by omega)).run ⟨0⟩).2.down

/--
For every comparison function `lt`, lawful or not, `qsort as lt lo hi` makes at most
`130 * len * (log₂ len + 1) + 51 * len` comparisons, where `len` is the length of the range
`[lo, hi]` after `qsort` clamps it to the array.
-/
theorem qsortComparisons_le (as : Array α) (lt : α → α → Bool) (lo hi : Nat) :
    qsortComparisons as lt lo hi ≤
      130 * ((max (min lo (as.size - 1)) (min hi (as.size - 1)) + 1 - min lo (as.size - 1)) *
        (Nat.log2 (max (min lo (as.size - 1)) (min hi (as.size - 1)) + 1 - min lo (as.size - 1))
          + 1)) +
      51 * (max (min lo (as.size - 1)) (min hi (as.size - 1)) + 1 - min lo (as.size - 1)) := by
  unfold qsortComparisons
  split
  · exact Nat.zero_le _
  · dsimp only
    obtain ⟨r, k, e, hk⟩ := sortM_cost lt (min lo (as.size - 1)) as.toVector (min lo (as.size - 1))
      (max (min lo (as.size - 1)) (min hi (as.size - 1)) + 1)
      (Nat.log2 (max (min lo (as.size - 1)) (min hi (as.size - 1)) + 1 - min lo (as.size - 1)) + 1)
      true true false
      (max (min lo (as.size - 1)) (min hi (as.size - 1)) + 1 - min lo (as.size - 1))
      (Nat.le_refl _) (Nat.le_refl _) (by omega) (by omega) 0
    rw [e]
    exact Nat.le_trans (by simpa using hk) (pot_top _)

end

end Array
