#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Writes a copy of a pdqsort source with some helpers left unspecialised.

    mkvariant.py SRC DST NAMESPACE_OLD NAMESPACE_NEW UNSPEC...

UNSPEC names top-level helpers (heapSortM, siftDownM, partialInsertionSortM, choosePivotM,
medianM, order2M, sortM, partitionM, partitionEqualM, insertionSortM, qsort): their `@[specialize]`
or `@[inline]` attribute, and those of their `where` helpers, are removed; with a `!` prefix
(`!heapSortM`) they are replaced by `@[nospecialize]`, with a `+` prefix (`+medianM`) by
`@[specialize]`.  WARM adds, before `end Monadic`, the
given extra text (a file path).  NAMESPACE_OLD is replaced
by NAMESPACE_NEW in `namespace`/`end` lines and in the doc header (empty NAMESPACE_OLD: keep).
"""

import re
import sys
from pathlib import Path

TOP = re.compile(r"^(/--|/-!|@\[|def |theorem |end |section|namespace|variable|abbrev |inductive )")


def main(src: str, dst: str, old: str, new: str, args: list[str]) -> None:
    nospec = {a[1:] for a in args if a.startswith("!")}
    spec = {a[1:] for a in args if a.startswith("+")}
    warm = [a[5:] for a in args if a.startswith("warm=")]
    unspec = [a.lstrip("!+") for a in args if not a.startswith("warm=")]
    lines = Path(src).read_text().splitlines(keepends=True)
    out = []
    current = None
    seen = set()
    for line in lines:
        m = re.match(r"^(?:@\[(?:specialize|inline)\] )?def (\w+)", line)
        if m:
            current = m.group(1)
        elif TOP.match(line) and not line.startswith("@["):
            current = None if not line.startswith("/--") else current
        if current in unspec:
            seen.add(current)
            if current in spec:
                line = line.replace("@[inline] def", "@[specialize] def")
            elif current in nospec:
                line = line.replace("@[specialize] ", "@[nospecialize] ").replace("@[inline] def", "@[nospecialize] def")
                if re.match(r"^def ", line):
                    line = "@[nospecialize] " + line
            else:
                line = line.replace("@[specialize] ", "").replace("@[inline] def", "def")
        if warm and line.startswith("end Monadic"):
            out.append(Path(warm[0]).read_text())
        if old and re.match(rf"^(namespace|end) {re.escape(old)}\b", line):
            line = line.replace(old, new, 1)
        out.append(line)
    missing = set(unspec) - seen
    if missing:
        sys.exit(f"not found: {sorted(missing)}")
    Path(dst).write_text("".join(out))


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4], sys.argv[5:])
