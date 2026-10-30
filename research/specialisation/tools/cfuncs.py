#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Bytes of generated C per qsort helper family in Lean-generated C files.

    cfuncs.py [--ns NAMESPACE_C_PREFIX] FILE.c...

A function's bytes run from its definition line (`LEAN_EXPORT`/`static` ... `{` at column 0) to the
next one.  Functions whose name starts with `l_Array_QSort_Internal_<helper>` (or the private
prefix) count towards <helper>; the rest towards `other`.
"""
import re
import sys
from collections import Counter
from pathlib import Path

DEF = re.compile(r"^(?:LEAN_EXPORT |static )?[a-z_0-9]+\*? (l_\w+|lp_\w+)\(.*\)\{$")
HELPER = re.compile(r"Array_QSort_Internal_([A-Za-z0-9]+?)(?:_(?:[a-z][A-Za-z]*))?___|Array_QSort_Internal_([A-Za-z0-9]+)$")


NS = "Array_QSort_Internal"


def family(name: str) -> str:
    m = re.match(r"l_(?:__private_Init_Data_Array_QSort_Basic_0__)?" + NS + r"_([A-Za-z0-9]+)", name)
    return m.group(1) if m else "other"


def main(files: list[str]) -> None:
    global NS
    if files[0] == "--ns":
        NS, files = files[1], files[2:]
    for f in files:
        sizes: Counter[str] = Counter()
        cur, start = None, 0
        lines = Path(f).read_text().splitlines(keepends=True)
        pos = 0
        for line in lines:
            m = DEF.match(line)
            if m:
                if cur is not None:
                    sizes[family(cur)] += pos - start
                cur, start = m.group(1), pos
            pos += len(line)
        if cur is not None:
            sizes[family(cur)] += pos - start
        total = sum(sizes.values())
        print(f"== {f}: {total} bytes in function bodies")
        for k, v in sizes.most_common():
            print(f"  {k:28} {v:9}")


if __name__ == "__main__":
    main(sys.argv[1:])
