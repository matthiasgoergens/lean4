#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Writes core `Basic.lean` and `Lemmas.lean` in which `Array.qsort` runs `sortCoreM` (the recursion
taking only the shared helpers as parameters, each taking the comparison; `mkcore5.py`), passing
copies of them compiled once at `Id`; the lemmas about `qsort` reduce it to `sortM` through
`sortCoreM_eq_sortM`, so the rest of the proofs are unchanged.

    mkc5.py SRC_DIR DST_DIR VARIANT

SRC_DIR and DST_DIR hold `Basic.lean` and `Lemmas.lean`.  VARIANT: the shared helpers, a subset of
`h` (heapsort), `e` (equal-key partition), `p` (partial insertion sort): `h`, `he`, `hp`, `hpe`.
"""
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent

PARAMS = {
    "e": ("partEq", "partitionEqualM", "partitionEqualId", "hpe",
          "    {partEq : (α → α → m (ULift.{u} Bool)) → (xs : Vector α n) → (a b : Nat) → Idx a b → b ≤ n →\n"
          "      m (Vector α n × {mid : Nat // a < mid ∧ mid ≤ b})}\n"),
    "h": ("heap", "heapSortM", "heapSortId", "hh",
          "    {heap : (α → α → m (ULift.{u} Bool)) → (xs : Vector α n) → (a b : Nat) → a ≤ b → b ≤ n →\n"
          "      m (Vector α n)}\n"),
    "p": ("pis", "partialInsertionSortM", "partialInsertionSortId", "hp",
          "    {pis : (α → α → m (ULift.{u} Bool)) → (xs : Vector α n) → (a b : Nat) → a < b → b ≤ n →\n"
          "      m (Vector α n × Bool)}\n"),
}

def eq_thm(variant: str) -> str:
    keep = [k for k in "ehp" if k in variant]
    implicits = "".join(PARAMS[k][4] for k in keep)
    hyps = " ".join(f"({PARAMS[k][3]} : {PARAMS[k][0]} = {PARAMS[k][1]})" for k in keep)
    args = " ".join(PARAMS[k][0] for k in keep)
    substs = " ".join(PARAMS[k][3] for k in keep)
    generic = " ".join(PARAMS[k][1] for k in keep)
    return f'''
omit [LawfulMonad m] in
/-- `sortCoreM {generic}` is `sortM`. -/
theorem sortCoreM_eq_sortM
{implicits}    {hyps}
    (lt : α → α → m (ULift.{{u}} Bool)) (lo : Nat) (xs : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) :
    sortCoreM {args} lt lo xs a b limit balanced partitioned afterEqual fuel hf hlo hab hb =
      sortM lt lo xs a b limit balanced partitioned afterEqual fuel hf hlo hab hb := by
  subst {substs}
  induction fuel generalizing xs a b limit balanced partitioned afterEqual with
  | zero => unfold sortCoreM sortM; rfl
  | succ fuel ih => unfold sortCoreM sortM; simp only [ih]
'''


def main(src: str, dst: str, variant: str) -> None:
    keep = [k for k in "ehp" if k in variant]
    ids = " ".join(PARAMS[k][2] for k in keep)
    subprocess.run([str(HERE / "mkcore5.py"), variant, "/tmp/mkc5-core.lean", "/tmp/mkc5-id.lean"], check=True)
    b = (Path(src) / "Basic.lean").read_text()
    b = b.replace("end Monadic\n", Path("/tmp/mkc5-core.lean").read_text() + "end Monadic\n\n"
                  + Path("/tmp/mkc5-id.lean").read_text(), 1)
    old_call = "    (Id.run (QSort.Internal.sortM (fun x y => pure ⟨lt x y⟩) lo as.toVector lo (hi + 1)\n"
    assert old_call in b
    qids = " ".join("QSort.Internal." + PARAMS[k][2] for k in keep)
    b = b.replace(old_call, f"    (Id.run (QSort.Internal.sortCoreM {qids}\n"
                  f"      (fun x y => pure ⟨lt x y⟩) lo as.toVector lo (hi + 1)\n")
    (Path(dst) / "Basic.lean").write_text(b)
    l = (Path(src) / "Lemmas.lean").read_text()
    marker = "\nend Monadic\n\n/-- The comparison `lt`, returning in `Id`, as `qsort` passes it to `sortM`. -/"
    assert marker in l
    l = l.replace(marker, eq_thm(variant) + marker, 1)
    qsort_thm = f'''
/-- What `qsort` runs is `sortM`. -/
private theorem sortCoreM_qsort (lt : α → α → Bool) (lo : Nat) {{n : Nat}} (xs : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) :
    sortCoreM {ids} (fun x y => pure ⟨lt x y⟩) lo xs a b limit
      balanced partitioned afterEqual fuel hf hlo hab hb =
    sortM (fun x y => pure ⟨lt x y⟩) lo xs a b limit balanced partitioned afterEqual fuel hf hlo
      hab hb :=
  sortCoreM_eq_sortM {" ".join("rfl" for _ in keep)} ..
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
