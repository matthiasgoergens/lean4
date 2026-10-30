import Sorts.PdqLemmas

/-!
`Pdq.qsort` sorts the range it is given when `lt` is a strict weak order, stated as lean4 PR 14658
states it for `Array.qsort`: `lt` is asymmetric and its negation is transitive.  The proofs are
about the code that `qsort` runs, `sortM` and its helpers at `Id` with the comparison `idLt lt`;
each lemma says, with `SatisfiesM`, what the result of a call satisfies.
-/

namespace Pdq

variable {α : Type u} {n : Nat}

/-- The comparison `lt`, returning in `Id`, as `qsort` passes it to `sortM`. -/
abbrev idLt (lt : α → α → Bool) : α → α → Id (ULift.{u} Bool) := fun x y => pure ⟨lt x y⟩

/-- At `Id`, a comparison returns what `lt` returns. -/
theorem SatisfiesM.bind_idLt {β : Type u} {lt : α → α → Bool} {x y : α}
    {f : ULift.{u} Bool → Id β} {Q : β → Prop} (h : SatisfiesM Q (f ⟨lt x y⟩)) :
    SatisfiesM Q (idLt lt x y >>= f) :=
  h

/-- The two laws of a strict weak order that the proofs use. -/
structure Lawful (lt : α → α → Bool) : Prop where
  asymm : ∀ {a b}, lt a b → ¬ lt b a
  le_trans : ∀ {a b c}, ¬ lt b a → ¬ lt c b → ¬ lt c a

theorem Lawful.irrefl {lt : α → α → Bool} (hlt : Lawful lt) (x : α) : ¬ lt x x :=
  fun h => hlt.asymm h h

/-- `v[a:b]` is sorted: no element is less than one before it. -/
def Sorted (lt : α → α → Bool) (v : Vector α n) (a b : Nat) : Prop :=
  ∀ i j (hi : i < n) (hj : j < n), a ≤ i → i < j → j < b → ¬ lt v[j] v[i]

namespace Sorted

variable {lt : α → α → Bool} {v w : Vector α n} {a b : Nat}

theorem of_le_succ (h : b ≤ a + 1) : Sorted lt v a b := fun i j _ _ _ _ _ => by omega

theorem mono {a' b' : Nat} (hs : Sorted lt v a b) (ha : a ≤ a') (hb : b' ≤ b) :
    Sorted lt v a' b' := fun i j hi hj h1 h2 h3 => hs i j hi hj (by omega) h2 (by omega)

/-- Order of adjacent pairs extends a sorted prefix. -/
theorem extend (hlt : Lawful lt) {c : Nat} (hs : Sorted lt v a b)
    (hadj : ∀ k (hk : k < n), b ≤ k → k < c → a < k → ¬ lt v[k] v[k - 1]) :
    Sorted lt v a c := by
  induction c with
  | zero => exact hs.mono (Nat.le_refl _) (Nat.zero_le _)
  | succ c ih =>
    have ih := ih fun k hk h1 h2 h3 => hadj k hk h1 (by omega) h3
    intro i j hi hj h1 h2 h3
    by_cases hjc : j < c
    · exact ih i j hi hj h1 h2 hjc
    by_cases hjb : j < b
    · exact hs i j hi hj h1 h2 hjb
    have hj' : j = c := by omega
    subst hj'
    have e := hadj j hj (by omega) (by omega) (by omega)
    by_cases hij : i = j - 1
    · subst hij; exact e
    · exact hlt.le_trans (ih i (j - 1) hi (by omega) h1 (by omega) (by omega)) e

/-- Two sorted pieces, every element of the first not greater than any of the second. -/
theorem join {m : Nat} (hl : Sorted lt v a m) (hr : Sorted lt v m b)
    (hx : ∀ i j (hi : i < n) (hj : j < n), a ≤ i → i < m → m ≤ j → j < b → ¬ lt v[j] v[i]) :
    Sorted lt v a b := fun i j hi hj h1 h2 h3 =>
  if him : i < m then
    if hjm : j < m then hl i j hi hj h1 h2 hjm else hx i j hi hj h1 him (by omega) h3
  else hr i j hi hj (by omega) h2 h3

/-- Sortedness of a range is unaffected by changes outside it. -/
theorem congr (hs : Sorted lt v a b)
    (he : ∀ i (hi : i < n), a ≤ i → i < b → w[i] = v[i]) : Sorted lt w a b :=
  fun i j hi hj h1 h2 h3 => by
    rw [he i hi h1 (by omega), he j hj (by omega) h3]
    exact hs i j hi hj h1 h2 h3

end Sorted

/-! ### Insertion -/

/-- While `v[j]` sinks into `v[a:e]`: the rest of `v[a:e]` is sorted, and nothing after `j` is less
than `v[j]`. -/
def SinkInv (lt : α → α → Bool) (v : Vector α n) (a e j : Nat) (hj : j < n) : Prop :=
  (∀ i k (hi : i < n) (hk : k < n), a ≤ i → i < k → k < e → i ≠ j → k ≠ j → ¬ lt v[k] v[i]) ∧
  (∀ k (hk : k < n), j < k → k < e → ¬ lt v[k] v[j])

namespace SinkInv

variable {lt : α → α → Bool} {v : Vector α n} {a e j : Nat}

theorem init (hs : Sorted lt v a j) (hj : j < n) : SinkInv lt v a (j + 1) j hj :=
  ⟨fun i k hi hk h1 h2 h3 _ h5 => hs i k hi hk h1 h2 (by omega), fun _ _ _ _ => by omega⟩

theorem swap (hlt : Lawful lt) {hj : j < n} (hinv : SinkInv lt v a e j hj) (haj : a < j)
    (hje : j < e) (hl : lt v[j] v[j - 1]) :
    SinkInv lt (v.swap j (j - 1)) a e (j - 1) (by omega) := by
  obtain ⟨h1, h2⟩ := hinv
  constructor
  · intro i k hi hk hai hik hke hij hkj
    simp only [Vector.getElem_swap]
    by_cases hkj' : k = j
    · subst hkj'
      simp only [↓reduceIte, show i ≠ k by omega, show i ≠ k - 1 by omega]
      exact h1 i (k - 1) hi (by omega) hai (by omega) (by omega) (by omega) (by omega)
    · by_cases hij' : i = j
      · subst hij'
        simp only [↓reduceIte, hkj', hkj]
        exact h1 (i - 1) k (by omega) hk (by omega) (by omega) hke (by omega) hkj'
      · simp only [hij', hij, hkj', hkj, ↓reduceIte]
        exact h1 i k hi hk hai hik hke hij' hkj'
  · intro k hk hjk hke
    simp only [Vector.getElem_swap, show j - 1 ≠ j by omega, ↓reduceIte]
    by_cases hkj : k = j
    · subst hkj
      simp only [↓reduceIte]
      exact hlt.asymm hl
    · simp only [hkj, show k ≠ j - 1 by omega, ↓reduceIte]
      exact h2 k hk (by omega) hke

theorem done (hlt : Lawful lt) {hj : j < n} (hinv : SinkInv lt v a e j hj) (haj : a ≤ j)
    (hje : j < e) (hstop : a < j → ¬ lt v[j] v[j - 1]) : Sorted lt v a e := by
  obtain ⟨h1, h2⟩ := hinv
  intro i k hi hk hai hik hke
  by_cases hij : i = j
  · subst hij; exact h2 k hk hik hke
  by_cases hkj : k = j
  · subst hkj
    have e1 := hstop (by omega)
    by_cases hi1 : i = k - 1
    · subst hi1; exact e1
    · exact hlt.le_trans (h1 i (k - 1) hi (by omega) hai (by omega) (by omega) hij (by omega)) e1
  · exact h1 i k hi hk hai hik hke hij hkj

end SinkInv

theorem insertionSortM.sink_sorted {lt : α → α → Bool} (hlt : Lawful lt) (a b e : Nat)
    (v : Vector α n) (j : Nat) (hj : j < n) :
    SinkInv lt v a e j hj → a ≤ j → j < e →
      SatisfiesM (fun w => Sorted lt w a e) (insertionSortM.sink (idLt lt) a b v j hj) := by
  fun_induction insertionSortM.sink (idLt lt) a b v j hj with
  | case1 v j hj h ih =>
    intro hinv haj hje
    refine SatisfiesM.bind_idLt ?_
    split
    · exact ih (hinv.swap hlt h hje ‹_›) (by omega) (by omega)
    · rename_i hl
      exact SatisfiesM.pure (hinv.done hlt haj hje fun _ => by simpa using hl)
  | case2 v j hj h =>
    intro hinv haj hje
    exact SatisfiesM.pure (hinv.done hlt haj hje fun h' => absurd h' h)

theorem insertionSortM.outer_sorted {lt : α → α → Bool} (hlt : Lawful lt) (a b : Nat)
    (hb : b ≤ n) (v : Vector α n) (i : Nat) :
    Sorted lt v a i → a ≤ i →
      SatisfiesM (fun w => Sorted lt w a b) (insertionSortM.outer (idLt lt) a b hb v i) := by
  fun_induction insertionSortM.outer (idLt lt) a b hb v i with
  | case1 v i h ih =>
    intro hs hai
    exact (insertionSortM.sink_sorted hlt a b (i + 1) v i _ (.init hs _) hai (by omega)).bind
      fun w hw => ih w hw (by omega)
  | case2 v i h =>
    intro hs _
    exact SatisfiesM.pure (hs.mono (Nat.le_refl _) (by omega))

theorem insertionSortM_sorted {lt : α → α → Bool} (hlt : Lawful lt) (v : Vector α n) (a b : Nat)
    (hb : b ≤ n) : SatisfiesM (fun w => Sorted lt w a b) (insertionSortM (idLt lt) v a b hb) :=
  insertionSortM.outer_sorted hlt a b hb v (a + 1) (.of_le_succ (Nat.le_refl _)) (by omega)

/-! ### Heapsort

The heap `v[first:first+m]` is indexed relative to `first`; the parent of `c` is `(c - 1) / 2`. -/

/-- Every parent from `r` on is not less than its children. -/
def HeapFrom (lt : α → α → Bool) (v : Vector α n) (first m r : Nat) (h : first + m ≤ n) : Prop :=
  ∀ c (hc : c < m), 0 < c → r ≤ (c - 1) / 2 → ¬ lt v[first + (c - 1) / 2] v[first + c]

/-- While sifting down from `r0` has reached `r`: every parent from `r0` on but `r` is not less than
its children, and `r`'s parent (if it is not above `r0`) is not less than `r`'s children. -/
def SiftInv (lt : α → α → Bool) (v : Vector α n) (first m r0 r : Nat) (h : first + m ≤ n) : Prop :=
  (∀ c (hc : c < m), 0 < c → r0 ≤ (c - 1) / 2 → (c - 1) / 2 ≠ r →
    ¬ lt v[first + (c - 1) / 2] v[first + c]) ∧
  (∀ (_ : r0 < r) (_ : r < m) c (hc : c < m), 0 < c → (c - 1) / 2 = r →
    ¬ lt v[first + (r - 1) / 2] v[first + c])

theorem siftDownM_heap {lt : α → α → Bool} (hlt : Lawful lt) (r0 : Nat) (v : Vector α n)
    (root hi first : Nat) (h : first + hi ≤ n) :
    SiftInv lt v first hi r0 root h → r0 ≤ root →
      SatisfiesM (fun w => HeapFrom lt w first hi r0 h)
        (siftDownM (idLt lt) v root hi first h) := by
  fun_induction siftDownM (idLt lt) v root hi first h with
  | case1 v root hc ih =>
    intro hinv hr
    -- `c` is a child of `root`, and not less than its sibling.
    refine SatisfiesM.bind (P := fun r => ∀ c (hc : c < hi), r.down.1 = c →
        (c = 2 * root + 1 ∨ c = 2 * root + 2) ∧ ∀ c' (hc' : c' < hi),
          (c' = 2 * root + 1 ∨ c' = 2 * root + 2) → ¬ lt v[first + c] v[first + c']) ?_
      fun r hcc => ?_
    · split
      · refine SatisfiesM.bind_idLt ?_
        split
        · rename_i hl
          refine SatisfiesM.pure fun c hc e => ?_
          subst e
          refine ⟨.inr rfl, fun c' hc' h' => ?_⟩
          rcases h' with rfl | rfl
          · exact hlt.asymm hl
          · exact hlt.irrefl _
        · rename_i hl
          refine SatisfiesM.pure fun c hc e => ?_
          subst e
          refine ⟨.inl rfl, fun c' hc' h' => ?_⟩
          rcases h' with rfl | rfl
          · exact hlt.irrefl _
          · simpa using hl
      · refine SatisfiesM.pure fun c hc e => ?_
        subst e
        refine ⟨.inl rfl, fun c' hc' h' => ?_⟩
        rcases h' with rfl | rfl
        · exact hlt.irrefl _
        · omega
    obtain ⟨⟨c, hc1, hc2⟩⟩ := r
    obtain ⟨hc', hlarger⟩ := hcc c hc1 rfl
    refine SatisfiesM.bind_idLt ?_
    split
    · rename_i hl
      refine ih c ⟨hc1, hc2⟩ ?_ (by omega)
      obtain ⟨h1, h2⟩ := hinv
      constructor
      · intro d hd hd0 hdr hdc
        simp only [Vector.getElem_swap]
        by_cases hdc' : d = c
        · subst hdc'
          simp only [show first + (d - 1) / 2 = first + root by omega, ↓reduceIte,
            show first + d ≠ first + root by omega]
          exact hlt.asymm hl
        by_cases hdr' : (d - 1) / 2 = root
        · simp only [show first + (d - 1) / 2 = first + root by omega, ↓reduceIte,
            show first + d ≠ first + root by omega, show first + d ≠ first + c by omega]
          exact hlarger d hd (by omega)
        by_cases hdroot : d = root
        · subst hdroot
          simp only [↓reduceIte, show first + (d - 1) / 2 ≠ first + d by omega,
            show first + (d - 1) / 2 ≠ first + c by omega]
          exact h2 (by omega) (by omega) c hc1 (by omega) (by omega)
        · simp only [show first + (d - 1) / 2 ≠ first + root by omega,
            show first + (d - 1) / 2 ≠ first + c by omega, show first + d ≠ first + root by omega,
            show first + d ≠ first + c by omega, ↓reduceIte]
          exact h1 d hd hd0 hdr hdr'
      · intro _ _ d hd hd0 hdc
        simp only [Vector.getElem_swap, show first + (c - 1) / 2 = first + root by omega,
          ↓reduceIte, show first + d ≠ first + root by omega,
          show first + d ≠ first + c by omega]
        simpa only [show (d - 1) / 2 = c by omega] using h1 d hd hd0 (by omega) (by omega)
    · rename_i hl
      refine SatisfiesM.pure fun d hd hd0 hdr => ?_
      by_cases hdr' : (d - 1) / 2 = root
      · have e : ¬ lt v[first + root] v[first + c] := by simpa using hl
        simp only [show first + (d - 1) / 2 = first + root by omega]
        exact hlt.le_trans (hlarger d hd (by omega)) e
      · exact hinv.1 d hd hd0 hdr hdr'
  | case2 v root hc =>
    intro hinv hr
    exact SatisfiesM.pure fun d hd hd0 hdr => hinv.1 d hd hd0 hdr (by omega)

/-- The root of a heap is not less than any of its elements. -/
theorem HeapFrom.root_max {lt : α → α → Bool} (hlt : Lawful lt) {v : Vector α n} {first m : Nat}
    {h : first + m ≤ n} (hh : HeapFrom lt v first m 0 h) (hm : 0 < m) :
    ∀ c (hc : c < m), ¬ lt v[first + 0] v[first + c] := by
  intro c
  induction c using Nat.strongRecOn with
  | ind c ih =>
    intro hc
    by_cases hc0 : c = 0
    · subst hc0; exact hlt.irrefl _
    · exact hlt.le_trans (hh c hc (by omega) (by omega)) (ih ((c - 1) / 2) (by omega) (by omega))

theorem heapSortM.build_heap {lt : α → α → Bool} (hlt : Lawful lt) (a b : Nat) (hab : a ≤ b)
    (hb : b ≤ n) (v : Vector α n) (k : Nat) :
    HeapFrom lt v a (b - a) k (by omega) →
      SatisfiesM (fun w => HeapFrom lt w a (b - a) 0 (by omega))
        (heapSortM.build (idLt lt) a b hab hb v k) := by
  fun_induction heapSortM.build (idLt lt) a b hab hb v k with
  | case1 => exact fun h => SatisfiesM.pure h
  | case2 v k ih =>
    intro hh
    refine (siftDownM_heap hlt k v k (b - a) a _ ⟨?_, fun h' => absurd h' (Nat.lt_irrefl _)⟩
      (Nat.le_refl _)).bind fun w hw => ih w hw
    intro c hc hc0 hck hck'
    exact hh c hc hc0 (by omega)

theorem heapSortM.pop_sorted {lt : α → α → Bool} (hlt : Lawful lt) (a b : Nat) (hab : a ≤ b)
    (hb : b ≤ n) (v : Vector α n) (i : Nat) (hi : i ≤ b - a) :
    HeapFrom lt v a i 0 (by omega) → Sorted lt v (a + i) b →
      (∀ k l (hk : k < n) (hl : l < n), a ≤ k → k < a + i → a + i ≤ l → l < b → ¬ lt v[l] v[k]) →
      SatisfiesM (fun w => Sorted lt w a b) (heapSortM.pop (idLt lt) a b hab hb v i hi) := by
  fun_induction heapSortM.pop (idLt lt) a b hab hb v i hi with
  | case1 v hi =>
    intro _ hs _
    exact SatisfiesM.pure (by simpa using hs)
  | case2 v i hi ih =>
    intro hh hs hx
    have hmax := hh.root_max hlt (by omega)
    -- Swapping the root to the end of the heap.
    let w := v.swap a (a + i) (by omega) (by omega)
    have hw_sorted : Sorted lt w (a + i) b := by
      intro k l hk hl h1 h2 h3
      simp only [w, Vector.getElem_swap, show l ≠ a by omega, show l ≠ a + i by omega, ↓reduceIte]
      by_cases hk' : k = a + i
      · subst hk'
        by_cases hi0 : i = 0
        · subst hi0; simp only [Nat.add_zero, ↓reduceIte]
          exact hx a l (by omega) hl (Nat.le_refl _) (by omega) (by omega) h3
        · simp only [show a + i ≠ a by omega, ↓reduceIte]
          exact hx a l (by omega) hl (Nat.le_refl _) (by omega) (by omega) h3
      · simp only [show k ≠ a by omega, hk', ↓reduceIte]
        exact hs k l hk hl (by omega) h2 h3
    have hw_cross : ∀ k l (hk : k < n) (hl : l < n), a ≤ k → k < a + i → a + i ≤ l → l < b →
        ¬ lt w[l] w[k] := by
      intro k l hk hl h1 h2 h3 h4
      have hwl : w[l] = if l = a + i then v[a] else v[l] := by
        simp only [w, Vector.getElem_swap, show l ≠ a by omega, ↓reduceIte]
      have hwk : w[k] = if k = a then v[a + i] else v[k] := by
        simp only [w, Vector.getElem_swap, show k ≠ a + i by omega, ↓reduceIte]
      rw [hwl, hwk]
      by_cases hla : l = a + i
      · simp only [hla, ↓reduceIte]
        by_cases hka : k = a
        · simpa [hka] using hmax i (by omega)
        · simp only [hka, ↓reduceIte]
          have := hmax (k - a) (by omega)
          simp only [show a + (k - a) = k by omega, Nat.add_zero] at this
          exact this
      · simp only [hla, ↓reduceIte]
        by_cases hka : k = a
        · simp only [hka, ↓reduceIte]
          exact hx (a + i) l (by omega) hl (by omega) (by omega) (by omega) h4
        · simp only [hka, ↓reduceIte]
          exact hx k l hk hl h1 (by omega) (by omega) h4
    have hw_heap : SiftInv lt w a i 0 0 (by omega) := by
      refine ⟨?_, fun h' => absurd h' (Nat.lt_irrefl _)⟩
      intro c hc hc0 _ hcr
      simp only [w, Vector.getElem_swap, show a + (c - 1) / 2 ≠ a by omega,
        show a + (c - 1) / 2 ≠ a + i by omega, show a + c ≠ a by omega,
        show a + c ≠ a + i by omega, ↓reduceIte]
      exact hh c (by omega) hc0 (Nat.zero_le _)
    refine ((siftDownM_frame (idLt lt) w 0 i a (by omega)).and
      (siftDownM_heap hlt 0 w 0 i a (by omega) hw_heap (Nat.le_refl _))).bind
      fun r ⟨hf, hheap⟩ => ih r hheap ?_ ?_
    · exact hw_sorted.congr fun k hk h1 _ => hf.out k hk (.inr (by omega))
    · intro k l hk hl h1 h2 h3 h4
      rw [hf.out l hl (.inr (by omega))]
      exact hf.holds (P := fun x => ¬ lt w[l] x)
        (fun k hk h1 h2 => hw_cross k l hk hl (by omega) (by omega) (by omega) h4) k hk
        (by omega) (by omega)

theorem heapSortM_sorted {lt : α → α → Bool} (hlt : Lawful lt) (v : Vector α n) (a b : Nat)
    (hab : a ≤ b) (hb : b ≤ n) :
    SatisfiesM (fun w => Sorted lt w a b) (heapSortM (idLt lt) v a b hab hb) :=
  (heapSortM.build_heap hlt a b hab hb v _ fun c hc hc0 hcr => by omega).bind fun w hw =>
    heapSortM.pop_sorted hlt a b hab hb w _ _ hw (.of_le_succ (by omega))
      fun k l _ _ _ _ _ _ => by omega

/-! ### Partial insertion sort

Only one direction is needed: when it reports success, the range is sorted. -/

theorem partialInsertionSortM.scan_adj (lt : α → α → Bool) (a b : Nat) (hb : b ≤ n)
    (v : Vector α n) (i : Nat) (h1 : a < i) (h2 : i ≤ b) :
    SatisfiesM (fun r => ∀ k (hk : k < n), i ≤ k → k < r.down.1 → ¬ lt v[k] v[k - 1])
      (partialInsertionSortM.scan (idLt lt) a b hb v i h1 h2) := by
  fun_induction partialInsertionSortM.scan (idLt lt) a b hb v i h1 h2 with
  | case1 i h1 h2 h ih =>
    refine SatisfiesM.bind_idLt ?_
    split
    · exact SatisfiesM.pure fun k _ hk1 hk2 => by simp only at hk2; omega
    · rename_i hl
      refine ih.mono fun r hr k hk hk1 hk2 => ?_
      by_cases hki : k = i
      · subst hki; simpa using hl
      · exact hr k hk (by omega) hk2
  | case2 i h1 h2 h => exact SatisfiesM.pure fun k _ hk1 hk2 => by simp only at hk2; omega

theorem partialInsertionSortM.sinkLeft_sorted {lt : α → α → Bool} (hlt : Lawful lt)
    (a b e : Nat) (hb : b ≤ n) (v : Vector α n) (j : Nat) (hj : j < b) :
    SinkInv lt v a e j (by omega) → a ≤ j → j < e →
      SatisfiesM (fun w => Sorted lt w a e)
        (partialInsertionSortM.sinkLeft (idLt lt) a b hb v j hj) := by
  fun_induction partialInsertionSortM.sinkLeft (idLt lt) a b hb v j hj with
  | case1 v j hj h ih =>
    intro hinv haj hje
    refine SatisfiesM.bind_idLt ?_
    split
    · exact ih (hinv.swap hlt h hje ‹_›) (by omega) (by omega)
    · rename_i hl
      exact SatisfiesM.pure (hinv.done hlt haj hje fun _ => by simpa using hl)
  | case2 v j hj h =>
    intro hinv haj hje
    exact SatisfiesM.pure (hinv.done hlt haj hje fun h' => absurd h' h)

theorem partialInsertionSortM.step_sorted {lt : α → α → Bool} (hlt : Lawful lt) (a b : Nat)
    (hb : b ≤ n) (v : Vector α n) (i steps : Nat) (h1 : a < i) (h2 : i ≤ b) :
    Sorted lt v a i →
      SatisfiesM (fun r => r.2 = true → Sorted lt r.1 a b)
        (partialInsertionSortM.step (idLt lt) a b hb v i steps h1 h2) := by
  fun_induction partialInsertionSortM.step (idLt lt) a b hb v i steps h1 h2 with
  | case1 v i steps h1 h2 hs ih =>
    intro hsorted
    refine (partialInsertionSortM.scan_adj lt a b hb v i h1 h2).bind fun ⟨⟨i', hi⟩⟩ hadj => ?_
    dsimp only at hadj ⊢
    have hs0 : Sorted lt v a i' := hsorted.extend hlt fun k hk hk1 hk2 _ => hadj k hk hk1 hk2
    split
    · rename_i he
      subst he
      exact SatisfiesM.pure fun _ => hs0
    split
    · exact SatisfiesM.pure fun h => absurd h Bool.false_ne_true
    have hs1 : Sorted lt (v.swap i' (i' - 1) (by omega) (by omega)) a (i' - 1) :=
      (hs0.mono (Nat.le_refl _) (by omega)).congr fun k hk h1 h2 =>
        Vector.getElem_swap_of_ne (by omega) (by omega)
    -- What is left after the swap, from the vector `w` that the left shift produced.
    have rest : ∀ w, Sorted lt w a i' → SatisfiesM (fun r => r.2 = true → Sorted lt r.1 a b)
        (if 2 ≤ b - i' then do
          let v ← partialInsertionSortM.riseRight (idLt lt) a b hb w (i' + 1) (by omega)
          partialInsertionSortM.step (idLt lt) a b hb v i' (steps + 1) hi.1 hi.2
        else do
          let v ← pure w
          partialInsertionSortM.step (idLt lt) a b hb v i' (steps + 1) hi.1 hi.2) := by
      intro w hw
      split
      · exact (partialInsertionSortM.riseRight_frame ..).bind fun w3 F3 =>
          ih i' hi w3 (hw.congr fun k hk h1 h2 => F3.out k hk (.inl (by omega)))
      · exact ih i' hi w hw
    split
    · exact (partialInsertionSortM.sinkLeft_sorted hlt a b i' hb _ (i' - 1) (by omega)
        (by simpa [show i' - 1 + 1 = i' by omega] using SinkInv.init hs1 (by omega))
        (by omega) (by omega)).bind fun w2 hw2 => rest w2 hw2
    · exact rest _ (.of_le_succ (by omega))
  | case2 v i steps h1 h2 hs =>
    intro _
    exact SatisfiesM.pure fun h => absurd h Bool.false_ne_true

theorem partialInsertionSortM_sorted {lt : α → α → Bool} (hlt : Lawful lt) (v : Vector α n)
    (a b : Nat) (hab : a < b) (hb : b ≤ n) :
    SatisfiesM (fun r => r.2 = true → Sorted lt r.1 a b)
      (partialInsertionSortM (idLt lt) v a b hab hb) :=
  partialInsertionSortM.step_sorted hlt a b hb v (a + 1) 0 _ _ (.of_le_succ (Nat.le_refl _))

/-! ### Partition -/

theorem partitionM.scanUp_spec (lt : α → α → Bool) (a b : Nat) (pivot : Idx a b) (hb : b ≤ n)
    (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    SatisfiesM (fun r => (∀ k (hk : k < n), i ≤ k → k < r.down.1 → lt v[k] p) ∧
        ∀ k (hk : k < n), r.down.1 = k → k ≤ j → ¬ lt v[k] p)
      (partitionM.scanUp (idLt lt) a b pivot hb p v i j h1 h2 h3) := by
  fun_induction partitionM.scanUp (idLt lt) a b pivot hb p v i j h1 h2 h3 with
  | case1 i h1 h2 h ih =>
    refine SatisfiesM.bind_idLt ?_
    split
    · rename_i hl
      refine ih.bind fun ⟨⟨i', hi'⟩⟩ hr => SatisfiesM.pure ?_
      dsimp only at hr ⊢
      refine ⟨fun k hk hk1 hk2 => ?_, hr.2⟩
      by_cases hki : k = i
      · subst hki; exact hl
      · exact hr.1 k hk (by omega) hk2
    · rename_i hl
      exact SatisfiesM.pure ⟨fun k _ hk1 hk2 => by (try simp only at *); omega,
        fun k _ hk _ => by (try simp only at hk); subst hk; simpa using hl⟩
  | case2 i h1 h2 h =>
    exact SatisfiesM.pure ⟨fun k _ hk1 hk2 => by (try simp only at *); omega,
      fun k _ hk hk' => by (try simp only at *); omega⟩

theorem partitionM.scanDown_spec (lt : α → α → Bool) (a b : Nat) (pivot : Idx a b) (hb : b ≤ n)
    (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    SatisfiesM (fun r => (∀ k (hk : k < n), r.down.1 < k → k ≤ j → ¬ lt v[k] p) ∧
        ∀ k (hk : k < n), r.down.1 = k → i ≤ k → lt v[k] p)
      (partitionM.scanDown (idLt lt) a b pivot hb p v i j h1 h2 h3) := by
  fun_induction partitionM.scanDown (idLt lt) a b pivot hb p v i j h1 h2 h3 with
  | case1 j h2 h3 h ih =>
    refine SatisfiesM.bind_idLt ?_
    split
    · rename_i hl
      exact SatisfiesM.pure ⟨fun k _ hk1 hk2 => by (try simp only at *); omega,
        fun k _ hk _ => by (try simp only at hk); subst hk; exact hl⟩
    · rename_i hl
      refine ih.bind fun ⟨⟨j', hj'⟩⟩ hr => SatisfiesM.pure ?_
      dsimp only at hr ⊢
      refine ⟨fun k hk hk1 hk2 => ?_, hr.2⟩
      by_cases hkj : k = j
      · subst hkj; simpa using hl
      · exact hr.1 k hk hk1 (by omega)
  | case2 j h2 h3 h =>
    exact SatisfiesM.pure ⟨fun k _ hk1 hk2 => by (try simp only at *); omega,
      fun k _ hk hk' => by (try simp only at *); omega⟩

/-- `w[a:b]` is split at `mid` around `p`: less before it, `p` at it, not less after it. -/
def Classified (lt : α → α → Bool) (w : Vector α n) (a b mid : Nat) (p : α) (hmid : mid < n) :
    Prop :=
  (∀ k (hk : k < n), a ≤ k → k < mid → lt w[k] p) ∧ w[mid] = p ∧
  (∀ k (hk : k < n), mid < k → k < b → ¬ lt w[k] p)

/-- While partitioning `v[a:b]` around `p = v[a]`: `v[a+1:i]` is less than `p` and `v[j+1:b]` is
not. -/
def LoopInv (lt : α → α → Bool) (v : Vector α n) (a b i j : Nat) (p : α) (ha : a < n) : Prop :=
  v[a] = p ∧ (∀ k (hk : k < n), a < k → k < i → lt v[k] p) ∧
  (∀ k (hk : k < n), j < k → k < b → ¬ lt v[k] p)

/-- One round of the partition loop: scan from both ends, then either swap the two elements found
or put the pivot in its place. -/
theorem partitionM.round {lt : α → α → Bool} (a b : Nat) (hb : b ≤ n) (p : α)
    (v : Vector α n) (i j : Nat) (h3 : j < b) (i' : Nat) (hi1 : a < i')
    (hi2 : i' ≤ j + 1) (hi3 : i ≤ i') (j' : Nat) (hj1 : i' ≤ j' + 1) (hj2 : j' ≤ j)
    (su : (∀ k (hk : k < n), i ≤ k → k < i' → lt v[k] p) ∧
      ∀ k (hk : k < n), i' = k → k ≤ j → ¬ lt v[k] p)
    (sd : (∀ k (hk : k < n), j' < k → k ≤ j → ¬ lt v[k] p) ∧
      ∀ k (hk : k < n), j' = k → i' ≤ k → lt v[k] p)
    (hinv : LoopInv lt v a b i j p (by omega)) :
    (∀ h : i' < j', LoopInv lt (v.swap i' j' (by omega) (by omega)) a b (i' + 1) (j' - 1) p
      (by omega)) ∧
    (∀ _ : ¬ i' < j', Classified lt (v.swap j' a (by omega) (by omega)) a b j' p (by omega)) := by
  obtain ⟨ha, hlow, hup⟩ := hinv
  constructor
  · intro h
    refine ⟨?_, ?_, ?_⟩
    · rw [Vector.getElem_swap_of_ne (by omega) (by omega)]; exact ha
    · intro k hk hk1 hk2
      rw [Vector.getElem_swap]
      by_cases hki : k = i'
      · simp only [hki, ↓reduceIte]
        exact sd.2 j' (by omega) rfl (by omega)
      · simp only [hki, show k ≠ j' by omega, ↓reduceIte]
        by_cases hki2 : k < i
        · exact hlow k hk hk1 hki2
        · exact su.1 k hk (by omega) (by omega)
    · intro k hk hk1 hk2
      rw [Vector.getElem_swap]
      by_cases hkj : k = j'
      · simp only [hkj, show j' ≠ i' by omega, ↓reduceIte]
        exact su.2 i' (by omega) rfl (by omega)
      · simp only [hkj, show k ≠ i' by omega, ↓reduceIte]
        by_cases hkj2 : k ≤ j
        · exact sd.1 k hk (by omega) hkj2
        · exact hup k hk (by omega) hk2
  · intro h
    have hj' : j' + 1 = i' := by
      refine Decidable.byContradiction fun hne => ?_
      have hji : j' = i' := by omega
      have e1 := su.2 i' (by omega) rfl (by omega)
      have e2 := sd.2 j' (by omega) rfl (by omega)
      subst hji
      exact e1 e2
    have hless : ∀ k (hk : k < n), a < k → k < i' → lt v[k] p := fun k hk hk1 hk2 =>
      if hki : k < i then hlow k hk hk1 hki else su.1 k hk (by omega) hk2
    refine ⟨?_, ?_, ?_⟩
    · intro k hk hk1 hk2
      rw [Vector.getElem_swap]
      simp only [show k ≠ j' by omega, ↓reduceIte]
      by_cases hka : k = a
      · simp only [hka, ↓reduceIte]
        exact hless j' (by omega) (by omega) (by omega)
      · simp only [hka, ↓reduceIte]
        exact hless k hk (by omega) (by omega)
    · rw [Vector.getElem_swap_left]; exact ha
    · intro k hk hk1 hk2
      rw [Vector.getElem_swap_of_ne (by omega) (by omega)]
      by_cases hkj : k ≤ j
      · exact sd.1 k hk hk1 hkj
      · exact hup k hk (by omega) hk2


theorem partitionM.loop_classifies {lt : α → α → Bool} (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    LoopInv lt v a b i j p (by omega) →
      SatisfiesM (fun r => Classified lt r.1 a b r.2.1.1 p (by have := r.2.1.2; omega))
        (partitionM.loop (idLt lt) a b pivot hb p v i j h1 h2 h3) := by
  fun_induction partitionM.loop (idLt lt) a b pivot hb p v i j h1 h2 h3 with
  | case1 v i j h1 h2 h3 ih =>
    intro hinv
    refine (partitionM.scanUp_spec lt a b pivot hb p v i j h1 h2 h3).bind
      fun ⟨⟨i', hi⟩⟩ su => (partitionM.scanDown_spec lt a b pivot hb p v i' j _ _ h3).bind
      fun ⟨⟨j', hj⟩⟩ sd => ?_
    dsimp only at su sd ⊢
    have r := partitionM.round a b hb p v i j h3 i' hi.1 hi.2.1 hi.2.2 j' hj.1 hj.2 su sd hinv
    split
    · exact ih i' hi j' hj ‹_› (r.1 ‹_›)
    · exact SatisfiesM.pure (r.2 ‹_›)

theorem partitionM_classifies {lt : α → α → Bool} (v : Vector α n) (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) :
    SatisfiesM (fun r => ∃ p, Classified lt r.1 a b r.2.1.1 p (by have := r.2.1.2; omega))
      (partitionM (idLt lt) v a b pivot hb) := by
  have := pivot.2
  unfold partitionM
  generalize v.swap a pivot.1 _ _ = v
  refine (partitionM.scanUp_spec lt a b pivot hb _ v _ _ _ _ _).bind
    fun ⟨⟨i', hi⟩⟩ su => (partitionM.scanDown_spec lt a b pivot hb _ v i' _ _ _ _).bind
    fun ⟨⟨j', hj⟩⟩ sd => ?_
  dsimp only at su sd ⊢
  have hinv : LoopInv lt v a b (a + 1) (b - 1) v[a] (by omega) :=
    ⟨rfl, fun k _ _ _ => by omega, fun k _ _ _ => by omega⟩
  have r := partitionM.round a b hb v[a] v (a + 1) (b - 1) (by omega) i' hi.1 hi.2.1
    hi.2.2 j' hj.1 hj.2 su sd hinv
  split
  · exact (partitionM.loop_classifies a b pivot hb _ _ _ _ _ _ _ (r.1 ‹_›)).mono fun _ h => ⟨_, h⟩
  · exact SatisfiesM.pure ⟨_, r.2 ‹_›⟩

/-! ### Partition into equal and greater -/

theorem partitionEqualM.scanUp_spec (lt : α → α → Bool) (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    SatisfiesM (fun r => (∀ k (hk : k < n), i ≤ k → k < r.down.1 → ¬ lt p v[k]) ∧
        ∀ k (hk : k < n), r.down.1 = k → k ≤ j → lt p v[k])
      (partitionEqualM.scanUp (idLt lt) a b pivot hb p v i j h1 h2 h3) := by
  fun_induction partitionEqualM.scanUp (idLt lt) a b pivot hb p v i j h1 h2 h3 with
  | case1 i h1 h2 h ih =>
    refine SatisfiesM.bind_idLt ?_
    split
    · rename_i hl
      exact SatisfiesM.pure ⟨fun k _ hk1 hk2 => by (try simp only at *); omega,
        fun k _ hk _ => by (try simp only at hk); subst hk; exact hl⟩
    · rename_i hl
      refine ih.bind fun ⟨⟨i', hi'⟩⟩ hr => SatisfiesM.pure ?_
      dsimp only at hr ⊢
      refine ⟨fun k hk hk1 hk2 => ?_, hr.2⟩
      by_cases hki : k = i
      · subst hki; simpa using hl
      · exact hr.1 k hk (by omega) hk2
  | case2 i h1 h2 h =>
    exact SatisfiesM.pure ⟨fun k _ hk1 hk2 => by (try simp only at *); omega,
      fun k _ hk hk' => by (try simp only at *); omega⟩

theorem partitionEqualM.scanDown_spec (lt : α → α → Bool) (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    SatisfiesM (fun r => (∀ k (hk : k < n), r.down.1 < k → k ≤ j → lt p v[k]) ∧
        ∀ k (hk : k < n), r.down.1 = k → i ≤ k → ¬ lt p v[k])
      (partitionEqualM.scanDown (idLt lt) a b pivot hb p v i j h1 h2 h3) := by
  fun_induction partitionEqualM.scanDown (idLt lt) a b pivot hb p v i j h1 h2 h3 with
  | case1 j h2 h3 h ih =>
    refine SatisfiesM.bind_idLt ?_
    split
    · rename_i hl
      refine ih.bind fun ⟨⟨j', hj'⟩⟩ hr => SatisfiesM.pure ?_
      dsimp only at hr ⊢
      refine ⟨fun k hk hk1 hk2 => ?_, hr.2⟩
      by_cases hkj : k = j
      · subst hkj; exact hl
      · exact hr.1 k hk hk1 (by omega)
    · rename_i hl
      exact SatisfiesM.pure ⟨fun k _ hk1 hk2 => by (try simp only at *); omega,
        fun k _ hk _ => by (try simp only at hk); subst hk; simpa using hl⟩
  | case2 j h2 h3 h =>
    exact SatisfiesM.pure ⟨fun k _ hk1 hk2 => by (try simp only at *); omega,
      fun k _ hk hk' => by (try simp only at *); omega⟩

/-- While partitioning `v[a:b]` into equal to `p` and greater: nothing in `v[a:i]` is greater than
`p`, and everything in `v[j+1:b]` is. -/
def EqInv (lt : α → α → Bool) (v : Vector α n) (a b i j : Nat) (p : α) : Prop :=
  (∀ k (hk : k < n), a ≤ k → k < i → ¬ lt p v[k]) ∧
  (∀ k (hk : k < n), j < k → k < b → lt p v[k])

theorem partitionEqualM.round {lt : α → α → Bool} (a b : Nat) (hb : b ≤ n) (p : α)
    (v : Vector α n) (i j : Nat) (h3 : j < b) (i' : Nat) (hi1 : a < i')
    (hi2 : i' ≤ j + 1) (hi3 : i ≤ i') (j' : Nat) (hj1 : i' ≤ j' + 1) (hj2 : j' ≤ j)
    (su : (∀ k (hk : k < n), i ≤ k → k < i' → ¬ lt p v[k]) ∧
      ∀ k (hk : k < n), i' = k → k ≤ j → lt p v[k])
    (sd : (∀ k (hk : k < n), j' < k → k ≤ j → lt p v[k]) ∧
      ∀ k (hk : k < n), j' = k → i' ≤ k → ¬ lt p v[k])
    (hinv : EqInv lt v a b i j p) :
    (∀ h : i' < j', EqInv lt (v.swap i' j' (by omega) (by omega)) a b (i' + 1) (j' - 1) p) ∧
    (∀ _ : ¬ i' < j', EqInv lt v a b i' (i' - 1) p) := by
  obtain ⟨hlow, hup⟩ := hinv
  constructor
  · intro h
    refine ⟨?_, ?_⟩
    · intro k hk hk1 hk2
      rw [Vector.getElem_swap]
      by_cases hki : k = i'
      · simp only [hki, ↓reduceIte]
        exact sd.2 j' (by omega) rfl (by omega)
      · simp only [hki, show k ≠ j' by omega, ↓reduceIte]
        by_cases hki2 : k < i
        · exact hlow k hk hk1 hki2
        · exact su.1 k hk (by omega) (by omega)
    · intro k hk hk1 hk2
      rw [Vector.getElem_swap]
      by_cases hkj : k = j'
      · simp only [hkj, show j' ≠ i' by omega, ↓reduceIte]
        exact su.2 i' (by omega) rfl (by omega)
      · simp only [hkj, show k ≠ i' by omega, ↓reduceIte]
        by_cases hkj2 : k ≤ j
        · exact sd.1 k hk (by omega) hkj2
        · exact hup k hk (by omega) hk2
  · intro h
    have hj' : j' + 1 = i' := by
      refine Decidable.byContradiction fun hne => ?_
      have hji : j' = i' := by omega
      have e1 := su.2 i' (by omega) rfl (by omega)
      have e2 := sd.2 j' (by omega) rfl (by omega)
      subst hji
      exact e2 e1
    refine ⟨fun k hk hk1 hk2 => ?_, fun k hk hk1 hk2 => ?_⟩
    · exact if hki : k < i then hlow k hk hk1 hki else su.1 k hk (by omega) hk2
    · exact if hkj : k ≤ j then sd.1 k hk (by omega) hkj else hup k hk (by omega) hk2


theorem partitionEqualM.loop_classifies {lt : α → α → Bool} (a b : Nat) (pivot : Idx a b)
    (hb : b ≤ n) (p : α) (v : Vector α n) (i j : Nat) (h1 : a < i) (h2 : i ≤ j + 1) (h3 : j < b) :
    EqInv lt v a b i j p →
      SatisfiesM (fun r => EqInv lt r.1 a b r.2.1 (r.2.1 - 1) p)
        (partitionEqualM.loop (idLt lt) a b pivot hb p v i j h1 h2 h3) := by
  fun_induction partitionEqualM.loop (idLt lt) a b pivot hb p v i j h1 h2 h3 with
  | case1 v i j h1 h2 h3 ih =>
    intro hinv
    refine (partitionEqualM.scanUp_spec lt a b pivot hb p v i j h1 h2 h3).bind
      fun ⟨⟨i', hi⟩⟩ su => (partitionEqualM.scanDown_spec lt a b pivot hb p v i' j _ _ h3).bind
      fun ⟨⟨j', hj⟩⟩ sd => ?_
    dsimp only at su sd ⊢
    have r := partitionEqualM.round a b hb p v i j h3 i' hi.1 hi.2.1 hi.2.2 j' hj.1 hj.2 su sd
      hinv
    split
    · exact ih i' hi j' hj ‹_› (r.1 ‹_›)
    · exact SatisfiesM.pure (r.2 ‹_›)

theorem partitionEqualM_classifies {lt : α → α → Bool} (hlt : Lawful lt) (v : Vector α n)
    (a b : Nat) (pivot : Idx a b) (hb : b ≤ n) :
    SatisfiesM (fun r => EqInv lt r.1 a b r.2.1 (r.2.1 - 1)
        (v[pivot.1]'(by have := pivot.2; omega)))
      (partitionEqualM (idLt lt) v a b pivot hb) := by
  have := pivot.2
  unfold partitionEqualM
  have hinv : EqInv lt (v.swap a pivot.1 (by omega) (by omega)) a b (a + 1) (b - 1)
      (v.swap a pivot.1 (by omega) (by omega))[a] := by
    refine ⟨fun k hk hk1 hk2 => ?_, fun k _ _ _ => by omega⟩
    simp only [show k = a by omega]
    exact hlt.irrefl _
  refine (partitionEqualM.loop_classifies a b pivot hb _ _ _ _ _ _ _ hinv).mono fun r h => ?_
  simp only [Vector.getElem_swap_left] at h
  exact h

/-! ### The main recursion -/

/-- No element of `v[a:b]` is less than the element before it, a pivot placed by an ancestor, unless
the range starts the whole subrange at `lo`. -/
def LeftBound (lt : α → α → Bool) (lo : Nat) (v : Vector α n) (a b : Nat) (hab : a ≤ b)
    (hb : b ≤ n) : Prop :=
  ∀ (_ : lo < a) k (hk : k < n), a ≤ k → k < b → ¬ lt v[k] (v[a - 1]'(by omega))

theorem LeftBound.frame {lt : α → α → Bool} {lo : Nat} {v w : Vector α n} {a b : Nat}
    {hab : a ≤ b} {hb : b ≤ n} (F : Frame a b v w) (h : LeftBound lt lo v a b hab hb) :
    LeftBound lt lo w a b hab hb := fun hla k hk h1 h2 => by
  rw [F.out (a - 1) (by omega) (.inl (by omega))]
  exact F.holds (P := fun x => ¬ lt x v[a - 1]) (h hla) k hk h1 h2

theorem LeftBound.mono {lt : α → α → Bool} {lo : Nat} {v : Vector α n} {a b b' : Nat}
    {hab : a ≤ b} {hb : b ≤ n} (h : LeftBound lt lo v a b hab hb) (hb' : b' ≤ b) (hab' : a ≤ b') :
    LeftBound lt lo v a b' hab' (by omega) := fun hla k hk h1 h2 => h hla k hk h1 (by omega)

/-- A range split around a pivot at `mid`, with both sides sorted, is sorted. -/
theorem Sorted.of_classified {lt : α → α → Bool} (hlt : Lawful lt) {w : Vector α n}
    {a b mid : Nat} {p : α} (hmid : mid < n) (hp : w[mid] = p) (hl : Sorted lt w a mid)
    (hr : Sorted lt w (mid + 1) b) (hless : ∀ k (hk : k < n), a ≤ k → k < mid → lt w[k] p)
    (hge : ∀ k (hk : k < n), mid < k → k < b → ¬ lt w[k] p) : Sorted lt w a b := by
  have hle : ∀ k (hk : k < n), a ≤ k → k ≤ mid → ¬ lt p w[k] := fun k hk h1 h2 =>
    if hkm : k < mid then hlt.asymm (hless k hk h1 hkm)
    else by simp only [show k = mid by omega, hp]; exact hlt.irrefl _
  refine Sorted.join (m := mid + 1) ?_ hr fun i j hi hj h1 h2 h3 h4 =>
    hlt.le_trans (hle i hi h1 (by omega)) (hge j hj (by omega) h4)
  refine Sorted.join (m := mid) hl (.of_le_succ (Nat.le_refl _)) fun i j hi hj h1 h2 h3 h4 => ?_
  simp only [show j = mid by omega, hp]
  exact hle i hi h1 (by omega)

theorem sortM_sorted {lt : α → α → Bool} (hlt : Lawful lt) (lo : Nat) (v : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) :
    LeftBound lt lo v a b hab hb →
      SatisfiesM (fun w => Sorted lt w a b)
        (sortM (idLt lt) lo v a b limit balanced partitioned afterEqual fuel hf hlo hab hb) := by
  fun_induction sortM (idLt lt) lo v a b limit balanced partitioned afterEqual fuel hf hlo hab hb
  case case1 => exact fun _ => insertionSortM_sorted hlt ..
  case case2 => exact fun _ => heapSortM_sorted hlt ..
  case case3 v a b limit bal part ae hlo hab hb h12 hl fuel hf v1 l1 e1 ih5 ih4 ih3 ih2 ih1 =>
    intro hL
    have F1 := frame_breakPatterns_eq hb e1
    refine SatisfiesM.bind_any fun ⟨(pivot, hint)⟩ => ?_
    split
    split
    rename_i v2 pivot2 hint2 e2
    have F2 := F1.trans (frame_reverseRange_eq hb e2)
    have hpa := pivot2.2
    dsimp only
    split
    all_goals
      refine SatisfiesM.bind (P := fun r => Frame a b v r.1 ∧ (r.2 = true → Sorted lt r.1 a b)) ?_
        fun ⟨v3, done⟩ ⟨F3, hdone⟩ => ?_
      · first
        | exact ((partialInsertionSortM_frame ..).and (partialInsertionSortM_sorted hlt ..)).mono
            fun _ ⟨hf, hs⟩ => ⟨F2.trans hf, hs⟩
        | exact SatisfiesM.pure ⟨F2, fun h => absurd h Bool.false_ne_true⟩
      dsimp only at F3 hdone ⊢
      split
      · exact SatisfiesM.pure (hdone ‹_›)
      have hL3 := hL.frame F3
      -- The test for a partition into "equal" and "greater".
      refine SatisfiesM.bind (P := fun r => r.down = true → lo < a ∧ ¬ lt v3[a - 1] v3[pivot2.1])
        ?_ fun ⟨equal⟩ hEq => ?_
      · split
        · refine SatisfiesM.bind_idLt (SatisfiesM.pure fun h => ⟨by simp_all, by simpa using h⟩)
        · exact SatisfiesM.pure fun h => absurd h Bool.false_ne_true
      dsimp only at hEq ⊢
      split
      · obtain ⟨hloa, hpiv⟩ := hEq ‹_›
        -- Every element of the range is at least the pivot `p`.
        have hge3 : ∀ k (hk : k < n), a ≤ k → k < b → ¬ lt v3[k] v3[pivot2.1] :=
          fun k hk h1 h2 => hlt.le_trans hpiv (hL3 hloa k hk h1 h2)
        refine ((partitionEqualM_frame ..).and (partitionEqualM_classifies hlt ..)).bind
          fun ⟨v4, ⟨mid, hm⟩⟩ ⟨F4, hle4, hgt4⟩ => ?_
        dsimp only at F4 hle4 hgt4 ⊢
        have hge4 := F4.holds (P := fun x => ¬ lt x v3[pivot2.1]) hge3
        refine ((ih5 pivot2 pivot2 v4 mid hm fun _ k hk h1 h2 => ?_).and
          (sortM_frame (idLt lt) lo v4 mid b l1 bal part true fuel (by omega) (by omega) (by omega)
            hb)).mono fun w ⟨hsw, Fr⟩ => ?_
        · exact hlt.le_trans (hle4 (mid - 1) (by omega) (by omega) (by omega))
            (hge4 k hk (by omega) h2)
        refine Sorted.join (m := mid) ?_ hsw fun i j hi hj h1 h2 h3 h4 => ?_
        · refine Sorted.congr (v := v4) (fun i j hi hj h1 h2 h3 => ?_)
            fun i hi _ h2 => Fr.out i hi (.inl h2)
          exact hlt.le_trans (hle4 i hi h1 (by omega)) (hge4 j hj (by omega) (by omega))
        · rw [Fr.out i hi (.inl h2)]
          exact hlt.le_trans (hle4 i hi h1 h2)
            (hlt.asymm (Fr.holds (P := fun x => lt v3[pivot2.1] x)
              (fun k hk h1 h2 => hgt4 k hk (by omega) h2) j hj h3 h4))
      · refine ((partitionM_frame ..).and (partitionM_classifies ..)).bind
          fun ⟨v4, ⟨mid, hm⟩, already⟩ ⟨F4, p, hless, hpm, hge⟩ => ?_
        dsimp only at F4 hless hpm hge ⊢
        split
        · refine ((ih4 pivot2 pivot2 v4 mid hm ((hL.frame (F3.trans F4)).mono (by omega)
            (by omega))).and (sortM_frame (idLt lt) lo v4 a mid l1 true true false fuel (by omega)
            hlo (by omega) (by omega))).bind fun v5 ⟨hs5, F5⟩ => ?_
          have hp5 : v5[mid] = p := (F5.out mid (by omega) (.inr (Nat.le_refl _))).trans hpm
          have hge5 : ∀ k (hk : k < n), mid < k → k < b → ¬ lt v5[k] p := fun k hk h1 h2 => by
            rw [F5.out k hk (.inr (by omega))]; exact hge k hk h1 h2
          refine ((ih3 pivot2 pivot2 mid hm already v5 fun _ k hk h1 h2 => ?_).and
            (sortM_frame (idLt lt) lo v5 (mid + 1) b l1 (decide (mid - a ≥ (b - a) / 8)) already
              false fuel (by omega) (by omega) (by omega) hb)).mono fun w ⟨hsr, Fr⟩ => ?_
          · simp only [show mid + 1 - 1 = mid by omega, hp5]; exact hge5 k hk (by omega) h2
          refine Sorted.of_classified hlt (p := p) (by omega) ?_ ?_ hsr (fun k hk h1 h2 => ?_)
            (fun k hk h1 h2 => ?_)
          · exact (Fr.out mid (by omega) (.inl (by omega))).trans hp5
          · exact hs5.congr fun i hi _ h2 => Fr.out i hi (.inl (by omega))
          · rw [Fr.out k hk (.inl (by omega))]
            exact F5.holds (P := fun x => lt x p) (fun k hk h1 h2 => hless k hk h1 h2) k hk h1 h2
          · by_cases hkm : k = mid + 1 ∨ mid + 1 < k
            · exact Fr.holds (P := fun x => ¬ lt x p) (fun k hk h1 h2 => hge5 k hk (by omega) h2)
                k hk (by omega) h2
            · omega
        · refine ((ih2 pivot2 pivot2 v4 mid hm fun _ k hk h1 h2 => ?_).and
            (sortM_frame (idLt lt) lo v4 (mid + 1) b l1 true true false fuel (by omega) (by omega)
              (by omega) hb)).bind fun v5 ⟨hs5, F5⟩ => ?_
          · simp only [show mid + 1 - 1 = mid by omega, hpm]; exact hge k hk (by omega) h2
          have hp5 : v5[mid] = p := (F5.out mid (by omega) (.inl (by omega))).trans hpm
          have hless5 : ∀ k (hk : k < n), a ≤ k → k < mid → lt v5[k] p := fun k hk h1 h2 => by
            rw [F5.out k hk (.inl (by omega))]; exact hless k hk h1 h2
          refine ((ih1 pivot2 pivot2 mid hm already v5 (((hL.frame (F3.trans F4)).frame
            (F5.mono (by omega) (Nat.le_refl _))).mono (by omega) (by omega))).and
            (sortM_frame (idLt lt) lo v5 a mid l1 (decide (b - mid ≥ (b - a) / 8)) already false
              fuel (by omega) hlo (by omega) (by omega))).mono fun w ⟨hsl, Fr⟩ => ?_
          refine Sorted.of_classified hlt (p := p) (by omega) ?_ hsl ?_ (fun k hk h1 h2 => ?_)
            (fun k hk h1 h2 => ?_)
          · exact (Fr.out mid (by omega) (.inr (Nat.le_refl _))).trans hp5
          · exact hs5.congr fun i hi h1 _ => Fr.out i hi (.inr (by omega))
          · exact Fr.holds (P := fun x => lt x p) hless5 k hk h1 h2
          · rw [Fr.out k hk (.inr (by omega))]
            by_cases hkm : k = mid + 1 ∨ mid + 1 < k
            · exact F5.holds (P := fun x => ¬ lt x p) (fun k hk h1 h2 => hge k hk (by omega) h2)
                k hk (by omega) h2
            · omega

/-! ### `qsort` and `qsortOrd` -/

/-- The range sorted by `Pdq.qsort` is ordered at every pair of indices. -/
theorem qsort_sorted' (lt : α → α → Bool)
    (lt_asymm : ∀ {a b}, lt a b → ¬ lt b a)
    (le_trans : ∀ {a b c}, ¬ lt b a → ¬ lt c b → ¬ lt c a)
    (as : Array α) (lo hi i j : Nat) (hlo : lo ≤ i) (hij : i < j) (hhi : j ≤ hi)
    (hj : j < as.size) :
    ¬ lt (getElem (Pdq.qsort as lt lo hi) j (by simpa using hj))
      (getElem (Pdq.qsort as lt lo hi) i (by simp; omega)) := by
  have hlt : Lawful lt := ⟨lt_asymm, le_trans⟩
  unfold qsort
  split
  · omega
  · simp only [Vector.getElem_toArray]
    exact (sortM_sorted hlt _ _ _ _ _ _ _ _ _ _ _ _ _ (fun h => absurd h (Nat.lt_irrefl _))).run
      i j _ _ (by omega) hij (by omega)

/-- `Pdq.qsort` returns an array ordered at every pair of indices. -/
theorem qsort_sorted (lt : α → α → Bool)
    (lt_asymm : ∀ {a b}, lt a b → ¬ lt b a)
    (le_trans : ∀ {a b c}, ¬ lt b a → ¬ lt c b → ¬ lt c a)
    (as : Array α) (i j : Nat) (hij : i < j) (hj : j < (Pdq.qsort as lt).size) :
    ¬ lt (Pdq.qsort as lt)[j] (Pdq.qsort as lt)[i] := by
  have hj' : j < as.size := by simpa using hj
  exact qsort_sorted' lt lt_asymm le_trans as 0 (as.size - 1) i j (by omega) hij (by omega) hj'

/-- Under an oriented `compare`, `y` is not less than `x` exactly when `x` is at most `y`. -/
theorem isLT_compare_eq_false_iff [Ord α] [Std.OrientedOrd α] (x y : α) :
    (compare y x).isLT = false ↔ (compare x y).isLE = true := by
  rw [Std.OrientedCmp.eq_swap (cmp := compare) (a := y) (b := x)]
  generalize compare x y = o
  cases o <;> decide

/-- `compare x y |>.isLT` is a strict weak order when `compare` is transitive (which includes
being oriented: swapping the arguments swaps the result). -/
theorem lawful_isLT_compare [Ord α] [Std.TransOrd α] :
    Lawful (fun x y : α => (compare x y).isLT) := by
  refine ⟨fun {x y} h h' => ?_, fun {x y z} h1 h2 => ?_⟩
  · rw [Std.OrientedCmp.eq_swap (cmp := compare) (a := y) (b := x)] at h'
    revert h h'
    generalize compare x y = o
    cases o <;> decide
  · simp only [Bool.not_eq_true] at h1 h2 ⊢
    exact (isLT_compare_eq_false_iff x z).2 (Std.TransCmp.isLE_trans
      ((isLT_compare_eq_false_iff x y).1 h1) ((isLT_compare_eq_false_iff y z).1 h2))

/-- `Pdq.qsortOrd` returns an array ordered at every pair of indices. -/
theorem qsortOrd_sorted [Ord α] [Std.TransOrd α] (xs : Array α) (i j : Nat) (hij : i < j)
    (hj : j < (Pdq.qsortOrd xs).size) :
    (compare (Pdq.qsortOrd xs)[i] (Pdq.qsortOrd xs)[j]).isLE := by
  have hlt := lawful_isLT_compare (α := α)
  have h := qsort_sorted (fun x y : α => (compare x y).isLT) hlt.asymm hlt.le_trans xs i j hij
    (by simpa [qsortOrd] using hj)
  unfold qsortOrd
  exact (isLT_compare_eq_false_iff _ _).1 (Bool.eq_false_iff.2 h)

end Pdq

/-! No theorem above depends on an axiom beyond `propext`, `Classical.choice` and `Quot.sound`. -/

#print axioms Pdq.SatisfiesM.bind_idLt
#print axioms Pdq.Lawful.irrefl
#print axioms Pdq.Sorted.of_le_succ
#print axioms Pdq.Sorted.mono
#print axioms Pdq.Sorted.extend
#print axioms Pdq.Sorted.join
#print axioms Pdq.Sorted.congr
#print axioms Pdq.SinkInv.init
#print axioms Pdq.SinkInv.swap
#print axioms Pdq.SinkInv.done
#print axioms Pdq.insertionSortM.sink_sorted
#print axioms Pdq.insertionSortM.outer_sorted
#print axioms Pdq.insertionSortM_sorted
#print axioms Pdq.siftDownM_heap
#print axioms Pdq.HeapFrom.root_max
#print axioms Pdq.heapSortM.build_heap
#print axioms Pdq.heapSortM.pop_sorted
#print axioms Pdq.heapSortM_sorted
#print axioms Pdq.partialInsertionSortM.scan_adj
#print axioms Pdq.partialInsertionSortM.sinkLeft_sorted
#print axioms Pdq.partialInsertionSortM.step_sorted
#print axioms Pdq.partialInsertionSortM_sorted
#print axioms Pdq.partitionM.scanUp_spec
#print axioms Pdq.partitionM.scanDown_spec
#print axioms Pdq.partitionM.round
#print axioms Pdq.partitionM.loop_classifies
#print axioms Pdq.partitionM_classifies
#print axioms Pdq.partitionEqualM.scanUp_spec
#print axioms Pdq.partitionEqualM.scanDown_spec
#print axioms Pdq.partitionEqualM.round
#print axioms Pdq.partitionEqualM.loop_classifies
#print axioms Pdq.partitionEqualM_classifies
#print axioms Pdq.LeftBound.frame
#print axioms Pdq.LeftBound.mono
#print axioms Pdq.Sorted.of_classified
#print axioms Pdq.sortM_sorted
#print axioms Pdq.qsort_sorted'
#print axioms Pdq.qsort_sorted
#print axioms Pdq.isLT_compare_eq_false_iff
#print axioms Pdq.lawful_isLT_compare
#print axioms Pdq.qsortOrd_sorted
