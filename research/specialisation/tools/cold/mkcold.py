#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Writes a core `Basic.lean` whose `Array.qsort` runs `sortCoreM` (or `sortLeavesId`) with some
helpers compiled once at `Id`, through `@[implemented_by]` (a prototype for measuring size: the
proofs still see the unchanged `qsort`).

    mkcold.py SRC DST VARIANT

VARIANT: `cold-h` (heapsort shared), `cold-hp` (heapsort and pivot selection shared), `cold-hpp` (and the partial insertion
sort), `leaves-hp` (the recursion, heapsort and pivot selection shared), `leaves-hpp` (and the
partial insertion sort).
"""
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
LTC = "(fun x y => pure ⟨lt x y⟩)"
I = "QSort.Internal."


def call(variant: str) -> str:
    pis_hot = f"({I}partialInsertionSortM {LTC})"
    pis_cold = f"({I}partialInsertionSortId lt)"
    pis = pis_hot if variant.endswith("-hp") else pis_cold
    leaves = f"({I}partitionM {LTC})\n      ({I}partitionEqualM {LTC}) ({I}insertionSortM {LTC})"
    if variant == "cold-h":
        return (f"{I}sortCoreM {leaves}\n      ({I}heapSortId lt) {pis_hot} ({I}choosePivotM {LTC}) {LTC}")
    if variant.startswith("cold"):
        return (f"{I}sortCoreM {leaves}\n      ({I}heapSortId lt) {pis} ({I}choosePivotId lt) {LTC}")
    return f"{I}sortLeavesId {leaves}\n      {pis} lt"


def main(src: str, dst: str, variant: str) -> None:
    s = Path(src).read_text()
    s = s.replace("end Monadic\n", (HERE / "sortCore.lean").read_text() + "end Monadic\n\n"
                  + (HERE / "idDefs.lean").read_text(), 1)
    old_call = "    (Id.run (QSort.Internal.sortM (fun x y => pure ⟨lt x y⟩) lo as.toVector lo (hi + 1)\n"
    assert old_call in s
    i = s.index("/--\nIn-place quicksort.")
    j = s.index("@[inline] def qsort", i)
    k = s.index("\nset_option linter.unusedVariables.funArgs false in", j)
    q = s[j:k]
    impl = q.replace("@[inline] def qsort", "/-- What `qsort` compiles to (prototype). -/\n@[inline] def qsortImpl", 1)
    impl = impl.replace(old_call, f"    (Id.run ({call(variant)} lo as.toVector lo (hi + 1)\n")
    q2 = q[len("@[inline] def qsort"):]
    # `implemented_by` wants identical types, autoParam tactic names included.
    q2 = q2.replace("(lt : α → α → Bool := by exact (· < ·))", "(lt : autoParam (α → α → Bool) qsortImpl._auto_1)", 1)
    s = s[:i] + impl + "\n" + s[i:j] + "@[implemented_by qsortImpl, inline] def qsort" + q2 + s[k:]
    Path(dst).write_text(s)


if __name__ == "__main__":
    main(*sys.argv[1:4])
