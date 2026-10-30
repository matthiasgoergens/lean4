#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""An unlawful, phase-aware comparator against the ported sorts: phaseadv.py ALGO N.
Pivot choice: always false (hint "increasing"); partial insertion sort: always true (every
element travels to the end); equal-key test: true (never the equal branch); partition and the
rest: the real order of a random permutation."""
import math
import random
import sys
from port import Sorter, Cfg


def main() -> None:
    sys.setrecursionlimit(100000)
    algo, n = sys.argv[1], int(sys.argv[2])
    v = list(range(n))
    random.Random(1).shuffle(v)
    holder = {}

    def lt(x, y):
        ph = holder["s"].phase
        if ph == "pivot":
            return False
        if ph == "pis":
            return True
        if ph == "eqtest":
            return True
        return x < y

    s = Sorter(v, Cfg.parse(algo), lt=lt)
    holder["s"] = s
    s.run()
    print(f"phaseadv algo={algo} n={n} cmps={s.n} perNlogN={s.n / (n * math.log2(n)):.3f} per={dict(s.per)}")


if __name__ == "__main__":
    main()
