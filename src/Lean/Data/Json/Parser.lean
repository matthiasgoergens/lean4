/-
Copyright (c) 2019 Gabriel Ebner. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.

Authors: Gabriel Ebner, Marc Huisinga
-/
module

prelude
public import Lean.Data.Json.Basic
public import Std.Internal.Parsec
import Init.Data.Array.Lemmas
import Init.Data.List.Range
import Init.Data.UInt.Lemmas

public section

open Std.Internal.Parsec
open Std.Internal.Parsec.String

namespace Lean.Json.Parser

def hexChar : Parser UInt16 := do
  let c ← any
  if '0' <= c && c <= '9' then
    pure $ (c.val - '0'.val).toUInt16
  else if 'a' <= c && c <= 'f' then
    pure $ (c.val - 'a'.val + 10).toUInt16
  else if 'A' <= c && c <= 'F' then
    pure $ (c.val - 'A'.val + 10).toUInt16
  else
    fail "invalid hex character"

def finishSurrogatePair (low : UInt16) : Parser Char := do
  let c ← any
  if c != '\\' then fail ""
  let c ← any
  if c != 'u' then fail ""
  let c ← any
  if c != 'd' && c != 'D' then fail ""
  let u2 ← hexChar; let u3 ← hexChar; let u4 ← hexChar
  let val := (u2 <<< 8) ||| (u3 <<< 4) ||| u4
  if val < 0xC00 then fail "" -- low or not a surrogate
  let charVal := (((low.toUInt32 &&& 0x3FF) <<< 10) ||| (val.toUInt32 &&& 0x3FF)) + 0x10000
  if h : charVal.isValidChar then
    return ⟨charVal, h⟩
  else
    fail "" -- should be unreachable

def escapedChar : Parser Char := do
  let c ← any
  match c with
  | '\\' => return '\\'
  | '"'  => return '"'
  | '/'  => return '/'
  | 'b'  => return '\x08'
  | 'f'  => return '\x0c'
  | 'n'  => return '\n'
  | 'r'  => return '\x0d'
  | 't'  => return '\t'
  | 'u'  =>
    let u1 ← hexChar; let u2 ← hexChar; let u3 ← hexChar; let u4 ← hexChar
    let val := (u1 <<< 12) ||| (u2 <<< 8) ||| (u3 <<< 4) ||| u4
    if h : val < 0xD800 then
      return ⟨val.toUInt32, Or.inl h⟩
    else if h' : val < 0xE000 then
      -- low or high surrogate
      if val < 0xDC00 then
        -- low surrogate
        attempt (finishSurrogatePair val) <|> pure '\ufffd'
      else
        -- high/lone surrogate
        return '\ufffd' -- replacement character
    else
      return ⟨val.toUInt32, Or.inr ⟨Nat.not_lt.mp h', Nat.lt_trans val.toFin.isLt (by decide)⟩⟩
  | _ => fail "illegal \\u escape"

partial def strCore (acc : String) : Parser String := do
  let c ← peek!
  if c == '"' then
    skip
    return acc
  else
    let c ← any
    if c == '\\' then
      strCore (acc.push (← escapedChar))
    -- as to whether c.val > 0xffff should be split up and encoded with multiple \u,
    -- the JSON standard is not definite: both directly printing the character
    -- and encoding it with multiple \u is allowed. we choose the former.
    else if 0x0020 <= c.val && c.val <= 0x10ffff then
      strCore (acc.push c)
    else
      fail "unexpected character in string"

@[inline] def str : Parser String := strCore ""

private def smallPowersOfTen : Array Nat := (List.range 19).toArray.map (10 ^ ·)

/-- `10 ^ n`, from a table for the exponents that chunks of digits need. -/
private def powerOfTen (n : Nat) : Nat :=
  if h : n < smallPowersOfTen.size then smallPowersOfTen[n] else 10 ^ n

private theorem powerOfTen_eq (n : Nat) : powerOfTen n = 10 ^ n := by
  rw [powerOfTen]
  split
  · simp [smallPowersOfTen]
  · rfl

/--
Combines `chunks[lo:hi]`, groups of decimal digits in reading order, each paired with its number of
digits, into the number they spell and its number of digits. Splitting in halves keeps the factors
of each multiplication balanced, so this takes subquadratic time in the total number of digits.
-/
private def combineDigitChunks (chunks : Array (Nat × Nat)) (lo hi : Nat) : Nat × Nat :=
  if hi ≤ lo + 1 then
    chunks.getD lo (0, 0)
  else
    let mid := (lo + hi) / 2
    let (a, da) := combineDigitChunks chunks lo mid
    let (b, db) := combineDigitChunks chunks mid hi
    (a * powerOfTen db + b, da + db)
termination_by hi - lo

/-- The digits `x.2` of `x.1` followed by the `y.2` digits of `y.1`. -/
private def appendDigits (x y : Nat × Nat) : Nat × Nat :=
  (x.1 * 10 ^ y.2 + y.1, x.2 + y.2)

private theorem appendDigits_assoc (x y z : Nat × Nat) :
    appendDigits (appendDigits x y) z = appendDigits x (appendDigits y z) := by
  simp only [appendDigits, Nat.pow_add, Nat.add_mul, Nat.mul_assoc, Nat.add_assoc]

private theorem foldl_appendDigits (l : List (Nat × Nat)) (x : Nat × Nat) :
    l.foldl appendDigits x = appendDigits x (l.foldl appendDigits (0, 0)) := by
  induction l generalizing x with
  | nil => simp [appendDigits]
  | cons y l ih =>
    simp only [List.foldl_cons]
    rw [ih, ih (appendDigits (0, 0) y), ← appendDigits_assoc]
    simp [appendDigits]

/-- The chunks at indices `lo` to `hi - 1`, appended one at a time from left to right. -/
private def appendChunks (chunks : Array (Nat × Nat)) (lo hi : Nat) : Nat × Nat :=
  ((List.range' lo (hi - lo)).map (chunks.getD · (0, 0))).foldl appendDigits (0, 0)

private theorem appendChunks_split (chunks : Array (Nat × Nat)) (lo mid hi : Nat)
    (h1 : lo ≤ mid) (h2 : mid ≤ hi) :
    appendChunks chunks lo hi =
      appendDigits (appendChunks chunks lo mid) (appendChunks chunks mid hi) := by
  have hsplit : hi - lo = (mid - lo) + (hi - mid) := by omega
  have hmid : lo + 1 * (mid - lo) = mid := by omega
  simp only [appendChunks]
  rw [hsplit, ← List.range'_append, hmid, List.map_append, List.foldl_append, foldl_appendDigits]

/--
Splitting `chunks[lo:hi]` in halves, as `combineDigitChunks` does, gives the same result as
appending the chunks one at a time from left to right.
-/
private theorem combineDigitChunks_eq (chunks : Array (Nat × Nat)) (lo hi : Nat) (h : lo < hi) :
    combineDigitChunks chunks lo hi = appendChunks chunks lo hi := by
  rw [combineDigitChunks]
  split
  · have : hi - lo = 1 := by omega
    simp [appendChunks, this, appendDigits]
  · dsimp only
    rw [combineDigitChunks_eq chunks lo ((lo + hi) / 2) (by omega),
      combineDigitChunks_eq chunks ((lo + hi) / 2) hi (by omega),
      appendChunks_split chunks lo ((lo + hi) / 2) hi (by omega) (by omega)]
    generalize appendChunks chunks lo ((lo + hi) / 2) = x
    generalize appendChunks chunks ((lo + hi) / 2) hi = y
    obtain ⟨a, da⟩ := x
    obtain ⟨b, db⟩ := y
    simp only [powerOfTen_eq, appendDigits]
termination_by hi - lo

/-!
The digit-reading functions below take the iterator explicitly instead of using `isEof`, `peek!`,
`skip` and `do` notation, so that the loops can recurse on the number of bytes left after the
current position, and so that proofs need not unfold the `Parsec` monad, whose operations are not
exposed to other modules. They compile to the same code as the `partial` loops written with those
combinators.
-/

/--
Reads digits into `chunk` until it holds 18 of them, which on 64-bit platforms is as many as fit
without big-number arithmetic, and then moves it to `chunks`. Returns the digits of the last,
partial chunk and the full chunks before it.
-/
private def digitChunks (chunk chunkDigits : Nat) (chunks : Array (Nat × Nat)) :
    Parser (Nat × Nat × Array (Nat × Nat)) := fun it =>
  if h : it.2.IsAtEnd then
    .success it (chunk, chunkDigits, chunks)
  else
    let c := it.2.get h
    if '0' <= c && c <= '9' then
      let it' := ⟨it.1, it.2.next h⟩
      let chunk := 10 * chunk + (c.val - '0'.val).toNat
      if chunkDigits + 1 = 18 then
        digitChunks 0 0 (chunks.push (chunk, 18)) it'
      else
        digitChunks chunk (chunkDigits + 1) chunks it'
    else
      .success it (chunk, chunkDigits, chunks)
termination_by it => it.2.remainingBytes
decreasing_by all_goals exact (String.Pos.lt_iff_remainingBytes_lt _ _).1 String.Pos.lt_next

/--
Reads the rest of a long run of digits, whose value so far is `acc`, and returns the value of the
whole run and `digits` plus the number of digits read here. The digits are read in chunks of 18
that `combineDigitChunks` puts together, so a long run takes time quasi-linear in its length.
-/
private def natLongRun (acc digits : Nat) : Parser (Nat × Nat) := fun it =>
  match digitChunks 0 0 #[] it with
  | .success it (chunk, chunkDigits, chunks) =>
    if chunks.isEmpty then
      .success it (acc * powerOfTen chunkDigits + chunk, digits + chunkDigits)
    else
      let chunks := if chunkDigits = 0 then chunks else chunks.push (chunk, chunkDigits)
      let (n, d) := combineDigitChunks chunks 0 chunks.size
      .success it (acc * powerOfTen d + n, digits + d)
  | .error it err => .error it err

/--
Reads digits onto `acc` one at a time, counting them in `digits`; `k` counts the digits read here,
and from the 37th on the rest of the run goes to `natLongRun`. Runs of up to 36 digits, which
include every 64-bit integer, are read without the overhead of chunks.
-/
private def natCoreNumDigitsAux (acc digits : Nat) (k : UInt32) : Parser (Nat × Nat) := fun it =>
  if h : it.2.IsAtEnd then
    .success it (acc, digits)
  else
    let c := it.2.get h
    if '0' <= c && c <= '9' then
      if k = 36 then
        natLongRun acc digits it
      else
        let it' := ⟨it.1, it.2.next h⟩
        natCoreNumDigitsAux (10 * acc + (c.val - '0'.val).toNat) (digits + 1) (k + 1) it'
    else
      .success it (acc, digits)
termination_by it => it.2.remainingBytes
decreasing_by exact (String.Pos.lt_iff_remainingBytes_lt _ _).1 String.Pos.lt_next

/--
Reads a run of decimal digits spelling `n` with `d` digits, and returns `acc * 10 ^ d + n` and
`digits + d`.
-/
@[inline] def natCoreNumDigits (acc digits : Nat) : Parser (Nat × Nat) :=
  natCoreNumDigitsAux acc digits 0

/-- Like `natCoreNumDigitsAux`, without counting the digits. -/
private def natCoreAux (acc : Nat) (k : UInt32) : Parser Nat := fun it =>
  if h : it.2.IsAtEnd then
    .success it acc
  else
    let c := it.2.get h
    if '0' <= c && c <= '9' then
      if k = 36 then
        match natLongRun acc 0 it with
        | .success it (n, _) => .success it n
        | .error it err => .error it err
      else
        let it' := ⟨it.1, it.2.next h⟩
        natCoreAux (10 * acc + (c.val - '0'.val).toNat) (k + 1) it'
    else
      .success it acc
termination_by it => it.2.remainingBytes
decreasing_by exact (String.Pos.lt_iff_remainingBytes_lt _ _).1 String.Pos.lt_next

/-- Reads a run of decimal digits spelling `n` with `d` digits, and returns `acc * 10 ^ d + n`. -/
@[inline] def natCore (acc : Nat) : Parser Nat :=
  natCoreAux acc 0

/-! ## Agreement with reading one digit at a time -/

/-- The characters after `p`. -/
private noncomputable abbrev rest {s : String} (p : s.Pos) : List Char :=
  (s.sliceFrom p).copy.toList

private theorem rest_of_isAtEnd {s : String} {p : s.Pos} (h : p.IsAtEnd) : rest p = [] := by
  simp only [String.Pos.isAtEnd_iff] at h
  subst h
  simp

private theorem rest_of_not_isAtEnd {s : String} {p : s.Pos} (h : ¬p.IsAtEnd) :
    rest p = p.get h :: rest (p.next h) := by
  rw [rest, p.splits.eq_right (p.splits_next_right h)]
  simp [String.toList_append]

private theorem isAtEnd_of_rest_eq_nil {s : String} {p : s.Pos} (h : rest p = []) : p.IsAtEnd :=
  Decidable.byContradiction fun hp => by
    rw [rest_of_not_isAtEnd hp] at h
    cases h

private theorem rest_eq_cons {s : String} {p : s.Pos} {c : Char} {r : List Char}
    (h : rest p = c :: r) : ∃ hp : ¬p.IsAtEnd, p.get hp = c ∧ rest (p.next hp) = r := by
  have hp : ¬p.IsAtEnd := fun hp => by
    rw [rest_of_isAtEnd hp] at h
    cases h
  have h' := rest_of_not_isAtEnd hp
  rw [h] at h'
  injection h' with hc hr
  exact ⟨hp, hc.symm, hr.symm⟩

private theorem isDigit_eq (c : Char) : ('0' <= c && c <= '9') = c.isDigit := rfl

private theorem digit_eq {c : Char} (h : c.isDigit) :
    (c.val - '0'.val).toNat = c.toNat - '0'.toNat := by
  simp only [Char.isDigit, Bool.and_eq_true, decide_eq_true_eq] at h
  exact UInt32.toNat_sub_of_le _ _ h.1

/-- Reads the digit `c` onto `n`. -/
private def digitStep (n : Nat) (c : Char) : Nat :=
  10 * n + (c.toNat - '0'.toNat)

private theorem digitStep_def : digitStep = fun n c => 10 * n + (c.toNat - '0'.toNat) := rfl

private theorem foldl_digitStep (l : List Char) (a : Nat) :
    l.foldl digitStep a = a * 10 ^ l.length + l.foldl digitStep 0 := by
  induction l generalizing a with
  | nil => simp
  | cons c l ih =>
    simp only [List.foldl_cons, List.length_cons]
    rw [ih, ih (digitStep 0 c)]
    simp only [digitStep, Nat.zero_mul, Nat.zero_add, Nat.pow_succ, Nat.add_mul,
      Nat.add_assoc, Nat.mul_assoc, Nat.mul_comm 10]

/-- The chunks appended from left to right. -/
private def chunksValue (chunks : Array (Nat × Nat)) : Nat × Nat :=
  chunks.toList.foldl appendDigits (0, 0)

private theorem chunksValue_push (chunks : Array (Nat × Nat)) (x : Nat × Nat) :
    chunksValue (chunks.push x) = appendDigits (chunksValue chunks) x := by
  simp [chunksValue, Array.push, List.concat_eq_append, List.foldl_append]

private theorem appendChunks_eq_chunksValue (chunks : Array (Nat × Nat)) :
    appendChunks chunks 0 chunks.size = chunksValue chunks := by
  rw [appendChunks, chunksValue]
  congr 1
  apply List.ext_getElem
  · simp
  · intro i h₁ h₂
    simp only [Array.length_toList] at h₂
    simp [Array.getD, h₂]

private theorem appendDigits_zero_right (x : Nat × Nat) : appendDigits x (0, 0) = x := by
  simp [appendDigits]

private theorem appendDigits_zero_left (x : Nat × Nat) : appendDigits (0, 0) x = x := by
  simp [appendDigits]

/--
`digitChunks` reads the longest run of digits after `p`, and the chunks it returns, followed by the
last partial chunk, spell `chunks` followed by `chunk` and the run.
-/
private theorem digitChunks_eq (chunk chunkDigits : Nat) (chunks : Array (Nat × Nat))
    (h0 : chunkDigits = 0 → chunk = 0) {s : String} (p : s.Pos) :
    ∃ q : s.Pos, rest q = (rest p).dropWhile Char.isDigit ∧
      ∃ chunk' chunkDigits' chunks',
        digitChunks chunk chunkDigits chunks ⟨s, p⟩ =
          .success ⟨s, q⟩ (chunk', chunkDigits', chunks') ∧
        (chunkDigits' = 0 → chunk' = 0) ∧
        appendDigits (chunksValue chunks') (chunk', chunkDigits') =
          appendDigits (chunksValue chunks)
            (((rest p).takeWhile Char.isDigit).foldl digitStep chunk,
              chunkDigits + ((rest p).takeWhile Char.isDigit).length) := by
  generalize hr : rest p = r
  induction r generalizing p chunk chunkDigits chunks with
  | nil =>
    have hp := isAtEnd_of_rest_eq_nil hr
    refine ⟨p, by simp [hr], chunk, chunkDigits, chunks, ?_, h0, by simp⟩
    rw [digitChunks]
    simp only [hp, ↓reduceDIte]
  | cons c r ih =>
    obtain ⟨hp, hc, hr'⟩ := rest_eq_cons hr
    rw [digitChunks]
    simp only [hp, ↓reduceDIte]
    rw [hc, isDigit_eq]
    cases hd : c.isDigit
    · simp only [Bool.false_eq_true, ↓reduceIte]
      refine ⟨p, by simp [List.dropWhile, hr, hd], chunk, chunkDigits, chunks, rfl, h0, ?_⟩
      simp [List.takeWhile, hd]
    · simp only [↓reduceIte]
      rw [digit_eq hd]
      split
      next h18 =>
        obtain ⟨q, hq, chunk', chunkDigits', chunks', h, h0', hv⟩ :=
          ih 0 0 (chunks.push (10 * chunk + (c.toNat - '0'.toNat), 18)) (fun _ => rfl) (p.next hp)
            hr'
        refine ⟨q, by simp [List.dropWhile, hq, hd], chunk', chunkDigits', chunks', h, h0', ?_⟩
        rw [hv, chunksValue_push, appendDigits_assoc]
        simp only [List.takeWhile, hd, List.foldl_cons, List.length_cons]
        rw [foldl_digitStep _ 0, foldl_digitStep _ (digitStep chunk c)]
        simp only [appendDigits, Nat.zero_mul, Nat.zero_add]
        rw [show chunkDigits + ((List.takeWhile Char.isDigit r).length + 1) =
          18 + (List.takeWhile Char.isDigit r).length by omega]
        simp only [digitStep]
      next =>
        obtain ⟨q, hq, chunk', chunkDigits', chunks', h, h0', hv⟩ :=
          ih (10 * chunk + (c.toNat - '0'.toNat)) (chunkDigits + 1) chunks (fun h => by omega)
            (p.next hp) hr'
        refine ⟨q, by simp [List.dropWhile, hq, hd], chunk', chunkDigits', chunks', h, h0', ?_⟩
        rw [hv]
        simp only [List.takeWhile, hd, List.foldl_cons, List.length_cons]
        rw [show chunkDigits + 1 + (List.takeWhile Char.isDigit r).length =
          chunkDigits + ((List.takeWhile Char.isDigit r).length + 1) by omega]
        simp only [digitStep]

/-- `natLongRun` reads the longest run of digits after `p` onto `acc`. -/
private theorem natLongRun_eq (acc digits : Nat) {s : String} (p : s.Pos) :
    ∃ q : s.Pos, rest q = (rest p).dropWhile Char.isDigit ∧
      natLongRun acc digits ⟨s, p⟩ =
        .success ⟨s, q⟩ (((rest p).takeWhile Char.isDigit).foldl digitStep acc,
          digits + ((rest p).takeWhile Char.isDigit).length) := by
  obtain ⟨q, hq, chunk, chunkDigits, chunks, h, h0, hv⟩ :=
    digitChunks_eq 0 0 #[] (fun _ => rfl) p
  refine ⟨q, hq, ?_⟩
  rw [natLongRun, h]
  generalize (rest p).takeWhile Char.isDigit = ds at hv ⊢
  have h00 : chunksValue #[] = (0, 0) := rfl
  rw [h00, appendDigits_zero_left, Nat.zero_add] at hv
  rw [foldl_digitStep ds acc]
  cases he : chunks.isEmpty
  · have hpos : 0 < chunks.size :=
      Nat.pos_of_ne_zero fun h => by simp [Array.isEmpty_iff_size_eq_zero.2 h] at he
    simp only [he, Bool.false_eq_true, ↓reduceIte]
    split
    next hcd =>
      subst hcd
      rw [h0 rfl, appendDigits_zero_right] at hv
      rw [combineDigitChunks_eq _ 0 _ hpos, appendChunks_eq_chunksValue, hv]
      simp [powerOfTen_eq]
    next hcd =>
      rw [combineDigitChunks_eq _ 0 _ (by simp), appendChunks_eq_chunksValue, chunksValue_push, hv]
      simp [powerOfTen_eq]
  · rw [Array.isEmpty_iff.1 he, h00, appendDigits_zero_left] at hv
    cases hv
    simp [he, powerOfTen_eq]

/-- The digits after `p` are read onto `acc` whatever the counter `k`. -/
private theorem natCoreNumDigitsAux_eq (acc digits : Nat) (k : UInt32) {s : String} (p : s.Pos) :
    ∃ q : s.Pos, rest q = (rest p).dropWhile Char.isDigit ∧
      natCoreNumDigitsAux acc digits k ⟨s, p⟩ =
        .success ⟨s, q⟩ (((rest p).takeWhile Char.isDigit).foldl digitStep acc,
          digits + ((rest p).takeWhile Char.isDigit).length) := by
  generalize hr : rest p = r
  induction r generalizing p acc digits k with
  | nil =>
    have hp := isAtEnd_of_rest_eq_nil hr
    refine ⟨p, by simp [hr], ?_⟩
    rw [natCoreNumDigitsAux]
    simp [hp]
  | cons c r ih =>
    obtain ⟨hp, hc, hr'⟩ := rest_eq_cons hr
    rw [natCoreNumDigitsAux]
    simp only [hp, ↓reduceDIte]
    rw [hc, isDigit_eq]
    cases hd : c.isDigit
    · simp only [Bool.false_eq_true, ↓reduceIte]
      refine ⟨p, by simp [List.dropWhile, hr, hd], ?_⟩
      simp [List.takeWhile, hd]
    · simp only [↓reduceIte]
      split
      · rw [← hr]
        exact natLongRun_eq acc digits p
      · rw [digit_eq hd]
        obtain ⟨q, hq, h⟩ :=
          ih (10 * acc + (c.toNat - '0'.toNat)) (digits + 1) (k + 1) (p.next hp) hr'
        refine ⟨q, by simp [List.dropWhile, hq, hd], ?_⟩
        rw [h]
        simp only [List.takeWhile, hd, List.foldl_cons, List.length_cons]
        rw [show digits + 1 + (List.takeWhile Char.isDigit r).length =
          digits + ((List.takeWhile Char.isDigit r).length + 1) by omega]
        simp only [digitStep]

/-- The digits after `p` are read onto `acc` whatever the counter `k`. -/
private theorem natCoreAux_eq (acc : Nat) (k : UInt32) {s : String} (p : s.Pos) :
    ∃ q : s.Pos, rest q = (rest p).dropWhile Char.isDigit ∧
      natCoreAux acc k ⟨s, p⟩ =
        .success ⟨s, q⟩ (((rest p).takeWhile Char.isDigit).foldl digitStep acc) := by
  generalize hr : rest p = r
  induction r generalizing p acc k with
  | nil =>
    have hp := isAtEnd_of_rest_eq_nil hr
    refine ⟨p, by simp [hr], ?_⟩
    rw [natCoreAux]
    simp [hp]
  | cons c r ih =>
    obtain ⟨hp, hc, hr'⟩ := rest_eq_cons hr
    rw [natCoreAux]
    simp only [hp, ↓reduceDIte]
    rw [hc, isDigit_eq]
    cases hd : c.isDigit
    · simp only [Bool.false_eq_true, ↓reduceIte]
      refine ⟨p, by simp [List.dropWhile, hr, hd], ?_⟩
      simp [List.takeWhile, hd]
    · simp only [↓reduceIte]
      rcases Decidable.em (k = 36) with hk | hk
      · simp only [hk, ↓reduceIte]
        obtain ⟨q, hq, h⟩ := natLongRun_eq acc 0 p
        rw [hr] at hq h
        refine ⟨q, hq, ?_⟩
        rw [h]
      · simp only [hk, ↓reduceIte]
        rw [digit_eq hd]
        obtain ⟨q, hq, h⟩ := ih (10 * acc + (c.toNat - '0'.toNat)) (k + 1) (p.next hp) hr'
        refine ⟨q, by simp [List.dropWhile, hq, hd], ?_⟩
        rw [h]
        simp only [List.takeWhile, hd, List.foldl_cons, digitStep]

/--
`natCoreNumDigits acc digits` reads the longest run `ds` of ASCII digits at the current position
and stops right after it. It returns `acc * 10 ^ ds.length + n`, where `n` is the number `ds` spells
read one digit at a time, and `digits + ds.length`.
-/
theorem natCoreNumDigits_eq (acc digits : Nat) (s : String) (p : s.Pos) :
    let ds := (s.sliceFrom p).copy.toList.takeWhile Char.isDigit
    let n := ds.foldl (fun n c => 10 * n + (c.toNat - '0'.toNat)) 0
    ∃ q : s.Pos,
      (s.sliceFrom q).copy.toList = (s.sliceFrom p).copy.toList.dropWhile Char.isDigit ∧
      natCoreNumDigits acc digits ⟨s, p⟩ =
        .success ⟨s, q⟩ (acc * 10 ^ ds.length + n, digits + ds.length) := by
  obtain ⟨q, hq, h⟩ := natCoreNumDigitsAux_eq acc digits 0 p
  refine ⟨q, hq, ?_⟩
  rw [natCoreNumDigits, h, foldl_digitStep, digitStep_def]

/--
`natCore acc` reads the longest run `ds` of ASCII digits at the current position and stops right
after it. It returns `acc * 10 ^ ds.length + n`, where `n` is the number `ds` spells read one digit
at a time.
-/
theorem natCore_eq (acc : Nat) (s : String) (p : s.Pos) :
    let ds := (s.sliceFrom p).copy.toList.takeWhile Char.isDigit
    let n := ds.foldl (fun n c => 10 * n + (c.toNat - '0'.toNat)) 0
    ∃ q : s.Pos,
      (s.sliceFrom q).copy.toList = (s.sliceFrom p).copy.toList.dropWhile Char.isDigit ∧
      natCore acc ⟨s, p⟩ = .success ⟨s, q⟩ (acc * 10 ^ ds.length + n) := by
  obtain ⟨q, hq, h⟩ := natCoreAux_eq acc 0 p
  refine ⟨q, hq, ?_⟩
  rw [natCore, h, foldl_digitStep, digitStep_def]

@[inline]
def lookahead (p : Char → Prop) (desc : String) [DecidablePred p] : Parser Unit := do
  let c ← peek!
  if p c then
    return ()
  else
    fail <| "expected " ++ desc

@[inline]
def natNonZero : Parser Nat := do
  lookahead (fun c => '1' <= c && c <= '9') "1-9"
  natCore 0

@[inline]
def natNumDigits : Parser (Nat × Nat) := do
  lookahead (fun c => '0' <= c && c <= '9') "digit"
  natCoreNumDigits 0 0

@[inline]
def natMaybeZero : Parser Nat := do
  lookahead (fun c => '0' <= c && c <= '9') "0-9"
  natCore 0

@[inline]
def numSign : Parser Int := do
  let c ← peek!
  if c == '-' then
    skip
    return (-1 : Int)
  else
    return 1

@[inline]
def nat : Parser Nat := do
  let c ← peek!
  if c == '0' then
    skip
    return 0
  else
    natNonZero

@[inline]
def numWithDecimals : Parser JsonNumber := do
  let sign ← numSign
  let whole ← nat
  if ← isEof then
    pure <| JsonNumber.fromInt (sign * whole)
  else
    let c ← peek!
    if c == '.' then
      skip
      let (n, d) ← natNumDigits
      if d > USize.size then fail "too many decimals"
      let mantissa' := sign * (whole * (10^d : Nat) + n)
      let exponent' := d
      pure <| JsonNumber.mk mantissa' exponent'
    else
      pure <| JsonNumber.fromInt (sign * whole)

@[inline]
def exponent (value : JsonNumber) : Parser JsonNumber := do
  if ← isEof then
    return value
  else
    let c ← peek!
    if c == 'e' || c == 'E' then
      skip
      let c ← peek!
      if c == '-' then
        skip
        let n ← natMaybeZero
        return value.shiftr n
      else
        if c = '+' then skip
        let n ← natMaybeZero
        -- `shiftl` currently consumes time/memory linear in n,
        -- and panics in `Nat.pow` for sufficiently large n.
        -- This could be improved by supporting positive exponents in `JsonNumber`.
        if n > 100_000 then fail "exponent too large"
        return value.shiftl n
    else
      return value

def num : Parser JsonNumber := do
  let res : JsonNumber ← numWithDecimals
  exponent res

mutual

  partial def arrayCore (acc : Array Json) : Parser (Array Json) := do
    let hd ← anyCore
    let acc' := acc.push hd
    let c ← any
    if c == ']' then
      ws
      return acc'
    else if c == ',' then
      ws
      arrayCore acc'
    else
      fail "unexpected character in array"

  partial def objectCore (kvs : Std.TreeMap.Raw String Json) :
      Parser (Std.TreeMap.Raw String Json) := do
    lookahead (fun c => c == '"') "\""; skip;
    let k ← str; ws
    if kvs.contains k then fail s!"duplicate object key {k.quote}"
    lookahead (fun c => c == ':') ":"; skip; ws
    let v ← anyCore
    let c ← any
    if c == '}' then
      ws
      return kvs.insert k v
    else if c == ',' then
      ws
      objectCore (kvs.insert k v)
    else
      fail "unexpected character in object"

  partial def anyCore : Parser Json := do
    let c ← peek!
    if c == '[' then
      skip; ws
      let c ← peek!
      if c == ']' then
        skip; ws
        return Json.arr (Array.mkEmpty 0)
      else
        let a ← arrayCore (Array.mkEmpty 4)
        return Json.arr a
    else if c == '{' then
      skip; ws
      let c ← peek!
      if c == '}' then
        skip; ws
        return Json.obj ∅
      else
        let kvs ← objectCore ∅
        return Json.obj kvs
    else if c == '\"' then
      skip
      let s ← str
      ws
      return Json.str s
    else if c == 'f' then
      skipString "false"; ws
      return Json.bool false
    else if c == 't' then
      skipString "true"; ws
      return Json.bool true
    else if c == 'n' then
      skipString "null"; ws
      return Json.null
    else if c == '-' || ('0' <= c && c <= '9') then
      let n ← num
      ws
      return Json.num n
    else
      fail "unexpected input"

end

def any : Parser Json := do
  ws
  let res ← anyCore
  eof
  return res

end Json.Parser

namespace Json

/-- Parses a JSON value, surrounded by optional whitespace. Objects with duplicate keys are rejected. -/
def parse (s : String) : Except String Lean.Json :=
  Parser.run Json.Parser.any s

end Json

end Lean
