#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Writes core `Basic.lean` and `Lemmas.lean` in which `Array.qsort` runs `sortCoreM` (the recursion
with heapsort, the partial insertion sort and the equal-key partition as parameters, each taking
the comparison), passing some of them compiled once at `Id`; the lemmas about `qsort` reduce it to
`sortM` through `sortCoreM_eq_sortM`, so the rest of the proofs are unchanged.

    mkc3.py SRC_DIR DST_DIR VARIANT

SRC_DIR and DST_DIR hold `Basic.lean` and `Lemmas.lean`.  VARIANT: `h` (heapsort shared), `he`
(and the equal-key partition), `hp` (and the partial insertion sort), `hpe` (all three).
"""
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent

EQ_THM = '''
omit [LawfulMonad m] in
/-- `sortCoreM` with the generic helpers is `sortM`. -/
theorem sortCoreM_eq_sortM
    {partEq : (α → α → m (ULift.{u} Bool)) → (xs : Vector α n) → (a b : Nat) → Idx a b → b ≤ n →
      m (Vector α n × {mid : Nat // a < mid ∧ mid ≤ b})}
    {heap : (α → α → m (ULift.{u} Bool)) → (xs : Vector α n) → (a b : Nat) → a ≤ b → b ≤ n →
      m (Vector α n)}
    {pis : (α → α → m (ULift.{u} Bool)) → (xs : Vector α n) → (a b : Nat) → a < b → b ≤ n →
      m (Vector α n × Bool)}
    (hpe : partEq = partitionEqualM) (hh : heap = heapSortM) (hp : pis = partialInsertionSortM)
    (lt : α → α → m (ULift.{u} Bool)) (lo : Nat) (xs : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) :
    sortCoreM partEq heap pis lt lo xs a b limit balanced partitioned afterEqual fuel hf hlo hab hb =
      sortM lt lo xs a b limit balanced partitioned afterEqual fuel hf hlo hab hb := by
  subst hpe hh hp
  induction fuel generalizing xs a b limit balanced partitioned afterEqual with
  | zero => unfold sortCoreM sortM; rfl
  | succ fuel ih => unfold sortCoreM sortM; simp only [ih]
'''


def names(variant: str) -> tuple[str, str]:
    pe = "partitionEqualId" if "e" in variant[1:] else "partitionEqualM"
    pis = "partialInsertionSortId" if "p" in variant[1:] else "partialInsertionSortM"
    return pe, pis


def main(src: str, dst: str, variant: str) -> None:
    pe, pis = names(variant)
    b = (Path(src) / "Basic.lean").read_text()
    b = b.replace("end Monadic\n", (HERE / "sortCore3.lean").read_text() + "end Monadic\n\n"
                  + (HERE / "idDefs3.lean").read_text(), 1)
    old_call = "    (Id.run (QSort.Internal.sortM (fun x y => pure ⟨lt x y⟩) lo as.toVector lo (hi + 1)\n"
    assert old_call in b
    b = b.replace(old_call, f"    (Id.run (QSort.Internal.sortCoreM QSort.Internal.{pe} QSort.Internal.heapSortId\n"
                  f"      QSort.Internal.{pis} (fun x y => pure ⟨lt x y⟩) lo as.toVector lo (hi + 1)\n")
    (Path(dst) / "Basic.lean").write_text(b)
    l = (Path(src) / "Lemmas.lean").read_text()
    marker = "\nend Monadic\n\n/-- The comparison `lt`, returning in `Id`, as `qsort` passes it to `sortM`. -/"
    assert marker in l
    l = l.replace(marker, EQ_THM + marker, 1)
    qsort_thm = f'''
/-- What `qsort` runs is `sortM`. -/
private theorem sortCoreM_qsort (lt : α → α → Bool) (lo : Nat) {{n : Nat}} (xs : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) :
    sortCoreM {pe} heapSortId {pis} (fun x y => pure ⟨lt x y⟩) lo xs a b limit
      balanced partitioned afterEqual fuel hf hlo hab hb =
    sortM (fun x y => pure ⟨lt x y⟩) lo xs a b limit balanced partitioned afterEqual fuel hf hlo
      hab hb :=
  sortCoreM_eq_sortM rfl rfl rfl ..
'''
    sec = "/-! ### `qsort` -/\n"
    assert sec in l
    l = l.replace(sec, sec + qsort_thm, 1)
    n = l.count("  unfold qsort\n")
    l = l.replace("  unfold qsort\n", "  unfold qsort\n  simp only [sortCoreM_qsort]\n")
    print(f"{n} `unfold qsort` sites")
    (Path(dst) / "Lemmas.lean").write_text(l)


if __name__ == "__main__":
    main(*sys.argv[1:4])
