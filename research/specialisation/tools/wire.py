#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Adds algorithm NAME, sorting with NAMESPACE.qsort (NAMESPACE.qsortOrd for u64), to Main.lean.

    wire.py MAIN NAME NAMESPACE
"""
import sys
from pathlib import Path

main, name, ns = sys.argv[1:4]
p = Path(main)
s = p.read_text()
if f'"{name}"' in s:
    sys.exit(f"{name} already wired")
s = s.replace("import Sorts.PdqLab\n", f"import Sorts.PdqLab\nimport Sorts.{ns}\n", 1)
s = s.replace('  | "pdq" => pure fun a => Pdq.qsort a lt\n',
              f'  | "pdq" => pure fun a => Pdq.qsort a lt\n  | "{name}" => pure fun a => {ns}.qsort a lt\n', 1)
s = s.replace('      | "pdq" => pure fun a => Pdq.qsortOrd a\n',
              f'      | "pdq" => pure fun a => Pdq.qsortOrd a\n      | "{name}" => pure fun a => {ns}.qsortOrd a\n', 1)
p.write_text(s)
