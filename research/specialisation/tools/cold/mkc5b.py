#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Writes the proposed change to the port: `Basic.lean`, `Lemmas.lean` and `Cost.lean` in which the
recursion is defined once, as `sortCoreM` taking the shared helpers as parameters, `sortM` is the
abbreviation that passes the generic helpers (so every statement about `sortM` stands), and
`Array.qsort` passes copies of the shared helpers compiled once, at `Id`.

    mkc5b.py PORT_QSORT_DIR MKC5_OUT_DIR DST_DIR VARIANT

MKC5_OUT_DIR holds `mkc5.py`'s output for the same VARIANT (`h`, `he`, `hp` or `hpe`).
"""
import sys
from pathlib import Path

GENERIC = {"e": "partitionEqualM", "h": "heapSortM", "p": "partialInsertionSortM"}
NAMES = {"e": "equal-key partition", "h": "heapsort", "p": "partial insertion sort"}


def main(port: str, c5: str, dst: str, variant: str) -> None:
    keep = [k for k in "ehp" if k in variant]
    generic = " ".join(GENERIC[k] for k in keep)
    port_dir, src, out = Path(port), Path(c5), Path(dst)
    out.mkdir(parents=True, exist_ok=True)
    b = (src / "Basic.lean").read_text()
    i = b.index("/-- Sorts `xs[a:b]`. `lo` is the start")
    j = b.index("@[specialize] def sortM", i)
    doc = b[i:j]
    k = b.index("/-- `sortM` with its rarely used helpers as parameters", j)
    l = b.index("@[specialize] def sortCoreM", k)
    shared = ", ".join(NAMES[x] for x in keep)
    b = b[:i] + doc.replace("/-- Sorts `xs[a:b]`.", f"/-- Sorts `xs[a:b]`, with the given {shared} (`sortM` passes the generic ones;\n`Array.qsort` passes copies compiled once, at `Id`, so that its call sites do not copy them).") + b[l:]
    m = b.index("\nend Monadic\n")
    b = b[:m] + f'''
/-- `sortCoreM` with the generic helpers: the sort that the proofs are about. -/
abbrev sortM (lt : α → α → m (ULift.{{u}} Bool)) (lo : Nat) (xs : Vector α n)
    (a b limit : Nat) (balanced partitioned afterEqual : Bool) (fuel : Nat) (hf : b - a ≤ fuel)
    (hlo : lo ≤ a) (hab : a ≤ b) (hb : b ≤ n) : m (Vector α n) :=
  sortCoreM {generic} lt lo xs a b limit balanced partitioned
    afterEqual fuel hf hlo hab hb
''' + b[m:]
    b = b.replace("\n\n\nend Array.QSort.Internal", "\n\nend Array.QSort.Internal")
    ids = " ".join("QSort.Internal." + {"e": "partitionEqualId", "h": "heapSortId", "p": "partialInsertionSortId"}[x] for x in keep)
    old = f"    (Id.run (QSort.Internal.sortCoreM {ids}\n      (fun x y => pure ⟨lt x y⟩) lo as.toVector lo (hi + 1)"
    assert old in b
    parts = ids.split(" ")
    new = (f"    (Id.run (QSort.Internal.sortCoreM {' '.join(parts[:2])}\n"
           f"      {' '.join(parts[2:] + ['(fun x y => pure ⟨lt x y⟩)'])} lo as.toVector lo (hi + 1)")
    b = b.replace(old, new)
    (out / "Basic.lean").write_text(b)
    L = (src / "Lemmas.lean").read_text()
    i = L.index("omit [LawfulMonad m] in\n/-- `sortCoreM ")
    j = L.index("\nend Monadic\n", i)
    L = L[:i].rstrip("\n") + "\n" + L[j:]
    i = L.index("private theorem sortCoreM_qsort")
    j = L.index("  sortCoreM_eq_sortM ", i)
    jj = L.index("\n", j)
    L = L[:j] + "  rfl" + L[jj:]
    for argl in ["lt lo v a b limit balanced partitioned afterEqual fuel hf hlo hab hb",
                 "(idLt lt) lo v a b limit balanced partitioned afterEqual fuel hf hlo hab hb"]:
        old = f"  fun_induction sortM {argl}\n"
        assert old in L, argl
        L = L.replace(old, f"  unfold sortM\n  fun_induction sortCoreM {generic}\n    {argl}\n")
    i = L.index("theorem sortM_of_le_succ")
    j = L.index("  unfold sortM\n", i)
    L = L[:j] + "  unfold sortM sortCoreM\n" + L[j + len("  unfold sortM\n"):]
    (out / "Lemmas.lean").write_text(L)
    C = (port_dir / "Cost.lean").read_text()
    old = "  fun_induction sortM (count lt) lo v a b limit balanced partitioned afterEqual fuel hf hlo hab hb\n"
    assert old in C
    C = C.replace(old, f"  unfold sortM\n  fun_induction sortCoreM {generic}\n    (count lt) lo v a b limit balanced partitioned afterEqual fuel hf hlo hab hb\n")
    (out / "Cost.lean").write_text(C)


if __name__ == "__main__":
    main(*sys.argv[1:5])
