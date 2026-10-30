#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Comparison counts per pattern: sweep.py OUTTSV N SPEC... (algorithms fixed below)."""
import concurrent.futures as cf
import os
import re
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
BRK = "sorts/.lake/build/bin/brk"
ALGOS = ["lab:lomuto,ends,c24,brk9", "lab:lomuto,ends,c24,brk9,nochild", "pdq", "core"]


def one(spec: str, n: int) -> dict:
    with tempfile.TemporaryDirectory() as d:
        f = os.path.join(d, "in.txt")
        subprocess.run([os.path.join(HERE, "gen.py"), spec, str(n), f], check=True)
        row = {"spec": spec, "n": n}
        for algo in ALGOS:
            if algo == "core" and n > 200000:
                row[algo] = None
                continue
            try:
                out = subprocess.run(["nice", "ionice", BRK, "count", algo, f], capture_output=True, text=True, timeout=600).stdout
                m = re.search(r"cmps=(\d+).*ok=(\w+)", out)
                row[algo] = int(m.group(1)) if m and m.group(2) == "true" else f"BAD:{out.strip()}"
            except subprocess.TimeoutExpired:
                row[algo] = "TIMEOUT"
        return row


def main() -> None:
    out, n, specs = sys.argv[1], int(sys.argv[2]), sys.argv[3:]
    with cf.ThreadPoolExecutor(max_workers=8) as ex, open(out, "a") as fo:
        for row in ex.map(lambda s: one(s, n), specs):
            l, ln, p, c = (row[a] for a in ALGOS)
            r = lambda x: f"{x / p:.3f}" if isinstance(x, int) else str(x)
            line = f"{row['spec']}\t{n}\t{l}\t{ln}\t{p}\t{c}\tL/pdq={r(l)}\tLN/pdq={r(ln)}\tcore/pdq={r(c)}"
            print(line, flush=True)
            fo.write(line + "\n")


if __name__ == "__main__":
    main()
