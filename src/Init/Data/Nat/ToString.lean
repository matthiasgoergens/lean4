/-
Copyright (c) 2026 Lean FRO, LLC. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Marcus Rossel, Paul Reichert
-/
module

prelude
public import Init.Data.Repr
public import Init.Data.Char.Basic
public import Init.Data.ToString.Basic
public import Init.Data.String.Basic
public import Init.Data.String.Length
import Init.NotationExtra
import all Init.Data.Repr
import Init.Omega
import Init.RCases
import Init.Data.Nat.Lemmas
import Init.Data.Nat.Bitwise
import Init.Data.Nat.Simproc
import Init.WFTactics
import Init.Data.Char.Lemmas
import Init.Data.Nat.Div.Lemmas
import Init.Data.Nat.Mod
import Init.Data.UInt.Lemmas
import Init.Data.List.Range

public section

-- todo: lemmas about `ToString Nat` and `ToString Int`

namespace Nat

variable {b : Nat}


@[simp]
theorem isDigit_digitChar : n.digitChar.isDigit = decide (n < 10) :=
  match n with
  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 => by simp [digitChar]
  | _ + 10 => by
    simp only [digitChar, ↓reduceIte, Nat.reduceEqDiff]
    (repeat' split) <;> simp

private theorem digitChar_iff_aux :
    ∀ n, (n.digitChar = '0' ↔ n = 0) ∧ (n.digitChar = '1' ↔ n = 1) ∧
         (n.digitChar = '2' ↔ n = 2) ∧ (n.digitChar = '3' ↔ n = 3) ∧
         (n.digitChar = '4' ↔ n = 4) ∧ (n.digitChar = '5' ↔ n = 5) ∧
         (n.digitChar = '6' ↔ n = 6) ∧ (n.digitChar = '7' ↔ n = 7) ∧
         (n.digitChar = '8' ↔ n = 8) ∧ (n.digitChar = '9' ↔ n = 9) ∧
         (n.digitChar = 'a' ↔ n = 10) ∧ (n.digitChar = 'b' ↔ n = 11) ∧
         (n.digitChar = 'c' ↔ n = 12) ∧ (n.digitChar = 'd' ↔ n = 13) ∧
         (n.digitChar = 'e' ↔ n = 14) ∧ (n.digitChar = 'f' ↔ n = 15) ∧
         (n.digitChar = '*' ↔ 16 ≤ n)
  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | _ + 16 => by simp [digitChar]

@[simp] theorem digitChar_eq_zero : n.digitChar = '0' ↔ n = 0 := (digitChar_iff_aux n).1
@[simp] theorem digitChar_eq_one : n.digitChar = '1' ↔ n = 1 := (digitChar_iff_aux n).2.1
@[simp] theorem digitChar_eq_two : n.digitChar = '2' ↔ n = 2 := (digitChar_iff_aux n).2.2.1
@[simp] theorem digitChar_eq_three : n.digitChar = '3' ↔ n = 3 := (digitChar_iff_aux n).2.2.2.1
@[simp] theorem digitChar_eq_four : n.digitChar = '4' ↔ n = 4 := (digitChar_iff_aux n).2.2.2.2.1
@[simp] theorem digitChar_eq_five : n.digitChar = '5' ↔ n = 5 := (digitChar_iff_aux n).2.2.2.2.2.1
@[simp] theorem digitChar_eq_six : n.digitChar = '6' ↔ n = 6 := (digitChar_iff_aux n).2.2.2.2.2.2.1
@[simp] theorem digitChar_eq_seven : n.digitChar = '7' ↔ n = 7 := (digitChar_iff_aux n).2.2.2.2.2.2.2.1
@[simp] theorem digitChar_eq_eight : n.digitChar = '8' ↔ n = 8 := (digitChar_iff_aux n).2.2.2.2.2.2.2.2.1
@[simp] theorem digitChar_eq_nine : n.digitChar = '9' ↔ n = 9 := (digitChar_iff_aux n).2.2.2.2.2.2.2.2.2.1
@[simp] theorem digitChar_eq_a : n.digitChar = 'a' ↔ n = 10 := (digitChar_iff_aux n).2.2.2.2.2.2.2.2.2.2.1
@[simp] theorem digitChar_eq_b : n.digitChar = 'b' ↔ n = 11 := (digitChar_iff_aux n).2.2.2.2.2.2.2.2.2.2.2.1
@[simp] theorem digitChar_eq_c : n.digitChar = 'c' ↔ n = 12 := (digitChar_iff_aux n).2.2.2.2.2.2.2.2.2.2.2.2.1
@[simp] theorem digitChar_eq_d : n.digitChar = 'd' ↔ n = 13 := (digitChar_iff_aux n).2.2.2.2.2.2.2.2.2.2.2.2.2.1
@[simp] theorem digitChar_eq_e : n.digitChar = 'e' ↔ n = 14 := (digitChar_iff_aux n).2.2.2.2.2.2.2.2.2.2.2.2.2.2.1
@[simp] theorem digitChar_eq_f : n.digitChar = 'f' ↔ n = 15 := (digitChar_iff_aux n).2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.1
@[simp] theorem digitChar_eq_star : n.digitChar = '*' ↔ 16 ≤ n := (digitChar_iff_aux n).2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2

@[simp] theorem zero_eq_digitChar : '0' = n.digitChar ↔ n = 0 := digitChar_eq_zero |> eq_comm.trans
@[simp] theorem one_eq_digitChar : '1' = n.digitChar ↔ n = 1 := digitChar_eq_one |> eq_comm.trans
@[simp] theorem two_eq_digitChar : '2' = n.digitChar ↔ n = 2 := digitChar_eq_two |> eq_comm.trans
@[simp] theorem three_eq_digitChar : '3' = n.digitChar ↔ n = 3 := digitChar_eq_three |> eq_comm.trans
@[simp] theorem four_eq_digitChar : '4' = n.digitChar ↔ n = 4 := digitChar_eq_four |> eq_comm.trans
@[simp] theorem five_eq_digitChar : '5' = n.digitChar ↔ n = 5 := digitChar_eq_five |> eq_comm.trans
@[simp] theorem six_eq_digitChar : '6' = n.digitChar ↔ n = 6 := digitChar_eq_six |> eq_comm.trans
@[simp] theorem seven_eq_digitChar : '7' = n.digitChar ↔ n = 7 := digitChar_eq_seven |> eq_comm.trans
@[simp] theorem eight_eq_digitChar : '8' = n.digitChar ↔ n = 8 := digitChar_eq_eight |> eq_comm.trans
@[simp] theorem nine_eq_digitChar : '9' = n.digitChar ↔ n = 9 := digitChar_eq_nine |> eq_comm.trans
@[simp] theorem a_eq_digitChar : 'a' = n.digitChar ↔ n = 10 := digitChar_eq_a |> eq_comm.trans
@[simp] theorem b_eq_digitChar : 'b' = n.digitChar ↔ n = 11 := digitChar_eq_b |> eq_comm.trans
@[simp] theorem c_eq_digitChar : 'c' = n.digitChar ↔ n = 12 := digitChar_eq_c |> eq_comm.trans
@[simp] theorem d_eq_digitChar : 'd' = n.digitChar ↔ n = 13 := digitChar_eq_d |> eq_comm.trans
@[simp] theorem e_eq_digitChar : 'e' = n.digitChar ↔ n = 14 := digitChar_eq_e |> eq_comm.trans
@[simp] theorem f_eq_digitChar : 'f' = n.digitChar ↔ n = 15 := digitChar_eq_f |> eq_comm.trans
@[simp] theorem star_eq_digitChar : '*' = n.digitChar ↔ 16 ≤ n := digitChar_eq_star |> eq_comm.trans

/-- Auxiliary theorem for `Nat.reduceDigitCharEq` simproc. -/
protected theorem digitChar_ne {n : Nat} (c : Char)
    (h : c != '0' && c != '1' && c != '2' && c != '3' && c != '4' && c != '5' &&
         c != '6' && c != '7' && c != '8' && c != '9' && c != 'a' && c != 'b' &&
         c != 'c' && c != 'd' && c != 'e' && c != 'f' && c != '*') : n.digitChar ≠ c := by
  rintro rfl
  match n with
  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | _ + 16 => simp [digitChar] at h

theorem toNat_digitChar_of_lt_ten {n : Nat} (hn : n < 10) : n.digitChar.toNat = 48 + n :=
  match n with
  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 => by simp [digitChar]
  | _ + 10 => by omega

theorem toNat_digitChar_sub_48_of_lt_ten {n : Nat} (hn : n < 10) : n.digitChar.toNat - 48 = n := by
  simp [toNat_digitChar_of_lt_ten hn]

private theorem isDigit_of_mem_toDigitsCore
    (hc : c ∈ cs → c.isDigit) (hb₁ : 0 < b) (hb₂ : b ≤ 10) (h : c ∈ toDigitsCore b fuel n cs) :
    c.isDigit := by
  induction fuel generalizing n cs with rw [toDigitsCore] at h
  | zero => exact hc h
  | succ _ ih =>
    split at h
    case' isFalse => apply ih (fun h => ?_) h
    all_goals
      cases h with
      | head      => simp [Nat.lt_of_lt_of_le (mod_lt _ hb₁) hb₂]
      | tail _ hm => exact hc hm

theorem isDigit_of_mem_toDigits (hb₁ : 0 < b) (hb₂ : b ≤ 10) (hc : c ∈ toDigits b n) : c.isDigit :=
  isDigit_of_mem_toDigitsCore (fun _ => by contradiction) hb₁ hb₂ hc

@[simp]
theorem underscore_not_in_toDigits {n : Nat} : ¬'_' ∈ Nat.toDigits 10 n := by
  intro h
  simpa using isDigit_of_mem_toDigits (by decide) (by decide) h

private theorem toDigitsCore_of_lt_base (hb : n < b) (hf : n < fuel) :
    toDigitsCore b fuel n cs = n.digitChar :: cs := by
  unfold toDigitsCore
  split <;> simp_all [mod_eq_of_lt]

theorem toDigits_of_lt_base (h : n < b) : toDigits b n = [n.digitChar] :=
  toDigitsCore_of_lt_base h (lt_succ_self _)

@[simp, grind =]
theorem toDigits_zero : (b : Nat) → toDigits b 0 = ['0']
  | 0     => rfl
  | _ + 1 => toDigits_of_lt_base (zero_lt_succ _)

private theorem toDigitsCore_append :
    toDigitsCore b fuel n cs₁ ++ cs₂ = toDigitsCore b fuel n (cs₁ ++ cs₂) := by
  induction fuel generalizing n cs₁ with simp only [toDigitsCore]
  | succ => split <;> simp_all

private theorem toDigitsCore_eq_toDigitsCore_nil_append :
    toDigitsCore b fuel n cs₁ = toDigitsCore b fuel n [] ++ cs₁ := by
  simp [toDigitsCore_append]

private theorem toDigitsCore_eq_of_lt_fuel (hb : 1 < b) (h₁ : n < fuel₁) (h₂ : n < fuel₂) :
    toDigitsCore b fuel₁ n cs = toDigitsCore b fuel₂ n cs := by
  cases fuel₁ <;> cases fuel₂ <;> try contradiction
  simp only [toDigitsCore, Nat.div_eq_zero_iff]
  split
  · simp
  · have := Nat.div_lt_self (by omega : 0 < n) hb
    exact toDigitsCore_eq_of_lt_fuel hb (by omega) (by omega)

private theorem toDigitsCore_toDigitsCore
    (hb : 1 < b) (hn : 0 < n) (hd : d < b) (hf : b * n + d < fuel) (hnf : n < nf) (hdf : d < df) :
    toDigitsCore b nf n (toDigitsCore b df d cs) = toDigitsCore b fuel (b * n + d) cs := by
  cases fuel with
  | zero => contradiction
  | succ fuel =>
    rw [toDigitsCore]
    split
    case isTrue h =>
      have : b ≤ b * n + d := Nat.le_trans (Nat.le_mul_of_pos_right _ hn) (le_add_right _ _)
      cases Nat.div_eq_zero_iff.mp h <;> omega
    case isFalse =>
      have h : (b * n + d) / b = n := by
        rw [mul_add_div (by omega), Nat.div_eq_zero_iff.mpr (.inr hd), Nat.add_zero]
      have := (Nat.lt_mul_iff_one_lt_left hn).mpr hb
      simp only [toDigitsCore_of_lt_base hd hdf, mul_add_mod_self_left, mod_eq_of_lt hd, h]
      apply toDigitsCore_eq_of_lt_fuel hb hnf (by omega)

theorem toDigits_append_toDigits (hb : 1 < b) (hn : 0 < n) (hd : d < b) :
    (toDigits b n) ++ (toDigits b d) = toDigits b (b * n + d) := by
  rw [toDigits, toDigitsCore_append]
  exact toDigitsCore_toDigitsCore hb hn hd (lt_succ_self _) (lt_succ_self _) (lt_succ_self _)

theorem toDigits_of_base_le (hb : 1 < b) (h : b ≤ n) :
    toDigits b n = toDigits b (n / b) ++ [digitChar (n % b)] := by
  have := Nat.div_add_mod n b
  rw (occs := [1]) [← Nat.div_add_mod n b,
    ← toDigits_append_toDigits (by omega) (Nat.div_pos_iff.mpr (by omega)) (Nat.mod_lt n (by omega))]
  rw [toDigits_of_lt_base (n := n % b) (Nat.mod_lt n (by omega))]

theorem toDigits_eq_ite (hb : 1 < b) :
    toDigits b n = if n < b then [digitChar n] else toDigits b (n / b) ++ [digitChar (n % b)] := by
  split
  · rw [toDigits_of_lt_base ‹_›]
  · rw [toDigits_of_base_le hb (by omega)]

@[deprecated Nat.toDigits_eq_ite (since := "2026-07-21")]
theorem toDigits_eq_if {b : Nat} {n : Nat} (hb : 1 < b) : b.toDigits n = if n < b then [n.digitChar] else b.toDigits (n / b) ++ [(n % b).digitChar] := Nat.toDigits_eq_ite hb

theorem length_toDigits_pos {b n : Nat} :
    0 < (Nat.toDigits b n).length := by
  simp [toDigits]
  rw [toDigitsCore]
  split
  · simp
  · rw [toDigitsCore_eq_toDigitsCore_nil_append]
    simp

@[simp]
theorem toDigits_ne_nil {n b : Nat} : Nat.toDigits b n ≠ [] := by
  rw [← List.length_pos_iff]
  exact Nat.length_toDigits_pos

theorem length_toDigits_le_iff {n k : Nat} (hb : 1 < b) (h : 0 < k) :
    (Nat.toDigits b n).length ≤ k ↔ n < b ^ k := by
  match k with
  | 0 => contradiction
  | k + 1 =>
    induction k generalizing n
    · rw [toDigits_eq_ite hb]
      split <;> simp [*, length_toDigits_pos, ← Nat.pos_iff_ne_zero, - List.length_eq_zero_iff]
    · rename_i ih
      rw [toDigits_eq_ite hb]
      split
      · rename_i hlt
        simp [Nat.pow_add]
        refine Nat.lt_of_lt_of_le hlt ?_
        apply Nat.le_mul_of_pos_left
        apply Nat.mul_pos
        · apply Nat.pow_pos
          omega
        · omega
      · simp [ih (n := n / b) (by omega), Nat.div_lt_iff_lt_mul (k := b) (by omega), Nat.pow_add]

theorem repr_eq_ofList_toDigits {n : Nat} :
    n.repr = .ofList (toDigits 10 n) :=
  (rfl)

@[simp]
theorem toList_repr {n : Nat} : n.repr.toList = Nat.toDigits 10 n := by
  simp [repr_eq_ofList_toDigits]

@[simp]
theorem repr_ne_empty {n : Nat} : n.repr ≠ "" := by
  simp [← String.toList_inj]

theorem toString_eq_ofList_toDigits {n : Nat} :
    toString n = .ofList (toDigits 10 n) :=
  (rfl)

@[simp, grind norm]
theorem toString_eq_repr {n : Nat} :
    toString n = n.repr :=
  (rfl)

@[simp, grind norm]
theorem reprPrec_eq_repr {n i : Nat} :
    reprPrec n i = n.repr :=
  (rfl)

@[simp, grind norm]
theorem repr_eq_repr {n : Nat} :
    repr n = n.repr :=
  (rfl)

theorem repr_of_lt {n : Nat} (h : n < 10) :
    n.repr = .singleton (digitChar n) := by
  rw [repr_eq_ofList_toDigits, toDigits_of_lt_base h, String.singleton_eq_ofList]

theorem repr_of_ge {n : Nat} (h : 10 ≤ n) :
    n.repr = (n / 10).repr ++ .singleton (digitChar (n % 10)) := by
  simp [repr_eq_ofList_toDigits, toDigits_of_base_le (by omega) h, String.singleton_eq_ofList,
    String.ofList_append]

theorem repr_eq_repr_append_repr {n : Nat} (h : 10 ≤ n) :
    n.repr = (n / 10).repr ++ (n % 10).repr := by
  rw [repr_of_ge h, repr_of_lt (n := n % 10) (by omega)]

theorem length_repr_pos {n : Nat} :
    0 < n.repr.length := by
  simpa [repr_eq_ofList_toDigits] using length_toDigits_pos

theorem length_repr_le_iff {n k : Nat} (h : 0 < k) :
    n.repr.length ≤ k ↔ n < 10 ^ k := by
  simpa [repr_eq_ofList_toDigits] using length_toDigits_le_iff (by omega) h

/-- The last `k` decimal digits of `n`, with leading zeros. -/
private def lowDigits : Nat → Nat → List Char
  | 0, _ => []
  | k + 1, n => lowDigits k (n / 10) ++ [digitChar (n % 10)]

private theorem lowDigits_add (k j n : Nat) :
    lowDigits (k + j) n = lowDigits k (n / 10 ^ j) ++ lowDigits j (n % 10 ^ j) := by
  induction j generalizing n with
  | zero => simp [lowDigits]
  | succ j ih =>
    have h₁ : n / 10 / 10 ^ j = n / 10 ^ (j + 1) := by
      rw [Nat.div_div_eq_div_mul, Nat.pow_succ']
    have h₂ : n % 10 ^ (j + 1) / 10 = n / 10 % 10 ^ j := by
      rw [Nat.pow_succ', Nat.mod_mul_right_div_self]
    have h₃ : n % 10 ^ (j + 1) % 10 = n % 10 := by
      rw [Nat.pow_succ', Nat.mod_mul_right_mod]
    rw [← Nat.add_assoc, lowDigits, ih, h₁]
    conv => rhs; rw [lowDigits, h₂, h₃]
    rw [List.append_assoc]

private theorem lowDigits_mod (j n : Nat) : lowDigits j (n % 10 ^ j) = lowDigits j n := by
  simpa [lowDigits] using (lowDigits_add 0 j n).symm

private theorem toDigits_mul_pow_add {q r : Nat} (j : Nat) (hq : 0 < q) (hr : r < 10 ^ j) :
    toDigits 10 (q * 10 ^ j + r) = toDigits 10 q ++ lowDigits j r := by
  induction j generalizing r with
  | zero =>
    have : r = 0 := by simpa using hr
    simp [this, lowDigits]
  | succ j ih =>
    have hpow : q * 10 ^ (j + 1) = q * 10 ^ j * 10 := by rw [Nat.pow_succ, Nat.mul_assoc]
    have hpos : 0 < q * 10 ^ j := Nat.mul_pos hq (Nat.pow_pos (by decide))
    have hr' : r / 10 < 10 ^ j := by
      rw [Nat.div_lt_iff_lt_mul (by decide), ← Nat.pow_succ]; exact hr
    have hdiv : ∀ x, (x * 10 + r) / 10 = x + r / 10 := fun x => by
      rw [Nat.add_comm, Nat.add_mul_div_right _ _ (by decide), Nat.add_comm]
    have hmod : ∀ x, (x * 10 + r) % 10 = r % 10 := fun x => by
      rw [Nat.add_comm, Nat.add_mul_mod_self_right]
    rw [hpow, toDigits_of_base_le (by decide) (Nat.le_add_right_of_le (Nat.le_mul_of_pos_left 10 hpos)),
      hdiv, hmod, ih hr', lowDigits, List.append_assoc]

private theorem foldl_push (l : List Char) (acc : String) :
    l.foldl String.push acc = acc ++ String.ofList l := by
  induction l generalizing acc with
  | nil => apply String.toList_injective; simp
  | cons c l ih =>
    apply String.toList_injective
    simp [List.foldl, ih, String.toList_push]

private theorem reprPushDigits_eq (k : Nat) (acc : String) (x : Nat) :
    reprPushDigits acc x (10 ^ k) (k + 1) = acc ++ String.ofList (lowDigits (k + 1) x) := by
  induction k generalizing acc with
  | zero =>
    apply String.toList_injective
    simp [reprPushDigits, lowDigits, String.toList_push]
  | succ k ih =>
    rw [reprPushDigits, Nat.pow_succ, Nat.mul_div_cancel _ (by decide), ih,
      show k + 1 + 1 = 1 + (k + 1) by omega, lowDigits_add 1 (k + 1), lowDigits_mod]
    apply String.toList_injective
    simp [lowDigits, String.toList_push, Nat.pow_succ]

/-- `ps = [10 ^ (w * 2 ^ (k - 1)), …, 10 ^ w]`. -/
private def Chain (w : Nat) : List Nat → Prop
  | [] => True
  | p :: ps => p = 10 ^ (w * 2 ^ ps.length) ∧ Chain w ps

private theorem reprPadded_eq {w : Nat} (hw : 0 < w) :
    ∀ {ps n acc}, Chain w ps → n < 10 ^ (w * 2 ^ ps.length) →
      reprPadded w (10 ^ (w - 1)) ps n acc = acc ++ String.ofList (lowDigits (w * 2 ^ ps.length) n)
  | [], n, acc, _, _ => by
    obtain ⟨k, rfl⟩ : ∃ k, w = k + 1 := ⟨w - 1, by omega⟩
    simpa [reprPadded] using reprPushDigits_eq k acc n
  | p :: ps, n, acc, ⟨hp, hc⟩, hn => by
    have hW : w * 2 ^ (p :: ps).length = w * 2 ^ ps.length + w * 2 ^ ps.length := by
      rw [List.length_cons, Nat.pow_succ, Nat.mul_two, Nat.mul_add]
    have hpos : 0 < p := hp ▸ Nat.pow_pos (by decide)
    rw [hW, Nat.pow_add, ← hp] at hn
    have hq : n / p < p := (Nat.div_lt_iff_lt_mul hpos).2 hn
    have hr : n - n / p * p = n % p := by rw [Nat.mod_eq_sub_div_mul]
    rw [reprPadded, hr, reprPadded_eq hw hc (hp ▸ Nat.mod_lt n hpos), reprPadded_eq hw hc (hp ▸ hq),
      hW, lowDigits_add, ← hp, String.append_assoc, ← String.ofList_append]

/-- Converting with `reprUnpadded` gives `toDigits`, whatever `n` is. -/
private theorem reprUnpadded_eq {w : Nat} (hw : 0 < w) :
    ∀ {ps n acc}, Chain w ps →
      reprUnpadded w (10 ^ (w - 1)) ps n acc = acc ++ String.ofList (toDigits 10 n)
  | [], n, acc, _ => foldl_push _ _
  | p :: ps, n, acc, ⟨hp, hc⟩ => by
    have hpos : 0 < p := hp ▸ Nat.pow_pos (by decide)
    rw [reprUnpadded]
    split
    · exact reprUnpadded_eq hw hc
    · rename_i hn
      have hq : 0 < n / p := Nat.div_pos (by omega) hpos
      have hr : n - n / p * p = n % p := by rw [Nat.mod_eq_sub_div_mul]
      dsimp only
      rw [hr, reprUnpadded_eq hw hc, reprPadded_eq hw hc (hp ▸ Nat.mod_lt n hpos),
        String.append_assoc, ← String.ofList_append,
        ← toDigits_mul_pow_add _ hq (hp ▸ Nat.mod_lt n hpos), ← hp, Nat.div_add_mod']

private theorem chain_reprPowers {w n : Nat} :
    ∀ {acc p fuel}, Chain w acc → p = 10 ^ (w * 2 ^ acc.length) → Chain w (reprPowers n p acc fuel)
  | _, _, 0, h, _ => h
  | acc, p, fuel + 1, h, hp => by
    rw [reprPowers]
    split
    · refine chain_reprPowers ⟨hp, h⟩ ?_
      rw [hp, ← Nat.pow_add, List.length_cons, Nat.pow_succ, Nat.mul_two, Nat.mul_add]
    · exact h

private theorem reprChunkDigits_pos : 0 < reprChunkDigits := by
  unfold reprChunkDigits; split <;> decide

private theorem reprBig_eq (n : Nat) : reprBig n = n.repr := by
  have h : Chain reprChunkDigits [10 ^ reprChunkDigits] := ⟨by simp, trivial⟩
  rw [reprBig, reprUnpadded_eq reprChunkDigits_pos
    (chain_reprPowers h (by simp [← Nat.pow_add, ← Nat.mul_two]))]
  simp [Nat.repr]

private theorem repr_ofNat_eq {n : Nat} (h : n < USize.size) : (USize.ofNat n).repr = n.repr := by
  simp [USize.repr, Nat.repr, USize.toNat_ofNat_of_lt' h]

/-- `Nat.reprFast`, which implements `Nat.repr` at runtime, agrees with it. -/
theorem reprFast_eq_repr (n : Nat) : reprFast n = n.repr := by
  have h128 : 128 ≤ USize.size := by rcases USize.size_eq with h | h <;> simp [h]
  rw [reprFast]
  split
  · rename_i h
    have hA : reprArray = ⟨(List.range 128).map (fun x => (USize.ofNat x).repr)⟩ := rfl
    have h' : n < 128 := by simpa [hA] using h
    have key : ∀ (a : Array String) (_ : a = ⟨(List.range 128).map (fun x => (USize.ofNat x).repr)⟩)
        (h : n < a.size), a.getInternal n h = (USize.ofNat n).repr := by
      rintro a rfl h
      simp [Array.getInternal]
    exact (key _ hA h).trans (repr_ofNat_eq (by omega))
  · split
    · simp [USize.repr, Nat.repr]
    · exact reprBig_eq n

/--
Transforms a list of characters into a natural number, *assuming that all characters are in the
range from `'0'` to `'9'`*.
-/
def ofDigitChars (b : Nat) (l : List Char) (init : Nat) : Nat :=
  l.foldl (init := init) (fun sofar c => b * sofar + (c.toNat - '0'.toNat))

theorem ofDigitChars_eq_foldl {b : Nat} {l : List Char} {init : Nat} :
    ofDigitChars b l init = l.foldl (init := init) (fun sofar c => b * sofar + (c.toNat - '0'.toNat)) :=
  (rfl)

@[simp]
theorem ofDigitChars_nil {init : Nat} : ofDigitChars b [] init = init := by
  simp [ofDigitChars]

theorem ofDigitChars_cons {c : Char} {cs : List Char} {init : Nat} :
    ofDigitChars b (c::cs) init = ofDigitChars b cs (b * init + (c.toNat - '0'.toNat)) := by
  simp [ofDigitChars]

theorem ofDigitChars_cons_digitChar_of_lt_ten {n : Nat} (hn : n < 10) {cs : List Char} {init : Nat} :
    ofDigitChars b (n.digitChar :: cs) init = ofDigitChars b cs (b * init + n) := by
  simp [ofDigitChars_cons, Nat.toNat_digitChar_sub_48_of_lt_ten hn]

theorem ofDigitChars_eq_ofDigitChars_zero {l : List Char} {init : Nat} :
    ofDigitChars 10 l init = 10 ^ l.length * init + ofDigitChars 10 l 0 := by
  induction l generalizing init with
  | nil => simp [ofDigitChars]
  | cons hd tl ih =>
    simp only [ofDigitChars, ↓Char.isValue, Char.reduceToNat, List.foldl_cons, List.length_cons,
      Nat.mul_zero, Nat.zero_add] at ⊢ ih
    rw [ih, ih (init := hd.toNat - 48), Nat.pow_succ, Nat.mul_add, Nat.mul_assoc, Nat.add_assoc]

theorem ofDigitChars_append {l m : List Char} (init : Nat) :
    ofDigitChars b (l ++ m) init = ofDigitChars b m (ofDigitChars b l init) := by
  simp [ofDigitChars]

@[simp]
theorem ofDigitChars_replicate_zero {n : Nat} : ofDigitChars b (List.replicate n '0') init = b ^ n * init := by
  induction n generalizing init with
  | zero => simp
  | succ n ih => simp [List.replicate_succ, ofDigitChars_cons, ih, Nat.pow_succ, Nat.mul_assoc]

theorem ofDigitChars_toDigits {b n : Nat} (hb' : 1 < b) (hb : b ≤ 10) : ofDigitChars b (toDigits b n) 0 = n := by
  induction n using base_induction b hb' with
  | single m hm =>
    simp [Nat.toDigits_of_lt_base hm, ofDigitChars_cons_digitChar_of_lt_ten (by omega : m < 10)]
  | digit m k hk hm ih =>
    rw [← Nat.toDigits_append_toDigits hb' hm hk,
      ofDigitChars_append, ih, Nat.toDigits_of_lt_base hk,
      ofDigitChars_cons_digitChar_of_lt_ten (Nat.lt_of_lt_of_le hk hb), ofDigitChars_nil]

@[simp]
theorem ofDigitChars_ten_toDigits {n : Nat} : ofDigitChars 10 (toDigits 10 n) 0 = n :=
  ofDigitChars_toDigits (by decide) (by decide)

end Nat
