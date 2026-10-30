#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Writes the text of `sortCoreM` taking only the shared ("cold") helpers as parameters, each taking
the comparison as its first argument, and calling the others directly as `sortM` does; and of the
`Id` copies of the shared helpers.

    mkcore5.py COLD OUT_CORE OUT_IDDEFS

COLD: a subset of `h` (heapsort), `e` (equal-key partition), `p` (partial insertion sort), as a
string, e.g. `he`.  Starts from sortCore3.lean and idDefs3.lean.
"""
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
PARAMS = {
    "e": ("partEq", "partitionEqualM", "partitionEqualId",
          "    (partEq : (α → α → m (ULift.{u} Bool)) → (xs : Vector α n) → (a b : Nat) → Idx a b → b ≤ n →\n"
          "      m (Vector α n × {mid : Nat // a < mid ∧ mid ≤ b}))\n"),
    "h": ("heap", "heapSortM", "heapSortId",
          "    (heap : (α → α → m (ULift.{u} Bool)) → (xs : Vector α n) → (a b : Nat) → a ≤ b → b ≤ n →\n"
          "      m (Vector α n))\n"),
    "p": ("pis", "partialInsertionSortM", "partialInsertionSortId",
          "    (pis : (α → α → m (ULift.{u} Bool)) → (xs : Vector α n) → (a b : Nat) → a < b → b ≤ n →\n"
          "      m (Vector α n × Bool))\n"),
}
ORDER = "ehp"


def main(cold: str, out_core: str, out_id: str) -> None:
    s = (HERE / "sortCore3.lean").read_text()
    keep = [k for k in ORDER if k in cold]
    for k in ORDER:
        name, generic, _, decl = PARAMS[k]
        assert decl in s, k
        if k not in cold:
            s = s.replace(decl, "")
            s = s.replace(f"{name} lt xs", f"{generic} lt xs")
    args = " ".join(PARAMS[k][0] for k in keep)
    s = s.replace("sortCoreM partEq heap pis lt lo", f"sortCoreM {args} lt lo")
    generic = " ".join(PARAMS[k][1] for k in keep)
    s = s.replace("""/-- `sortM` with its rarely used helpers as parameters: `sortM` is `sortCoreM partitionEqualM
heapSortM partialInsertionSortM`.  `Array.qsort` passes some of them compiled once, at `Id`, instead
of specialised at every call site. -/""", f"""/-- `sortM` with its rarely used helpers as parameters, so that `Array.qsort` can pass them compiled
once, at `Id`, instead of specialised at every call site: `sortM` is `sortCoreM {generic}`. -/""")
    Path(out_core).write_text(s)
    d = (HERE / "idDefs3.lean").read_text()
    parts = d.split("\n/-- ")
    head, defs = parts[0], ["/-- " + p for p in parts[1:]]
    chosen = [x for x in defs if any(f"def {PARAMS[k][2]} " in x for k in keep)]
    Path(out_id).write_text(head + "\n" + "\n".join(x.rstrip() + "\n" for x in chosen) + "\n")


if __name__ == "__main__":
    main(*sys.argv[1:4])
