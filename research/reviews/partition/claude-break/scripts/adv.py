#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""McIlroy-style adversaries against the ported sorts: adv.py ALGO N RULE OUT [trace].
RULE: mcilroy (freeze x unless it is the candidate), first, second, low (freeze the lower index)."""
import sys
from port import Sorter, Cfg


def main() -> None:
    sys.setrecursionlimit(100000)
    algo, n, rule, out = sys.argv[1], int(sys.argv[2]), sys.argv[3], sys.argv[4]
    gas = n
    val = [gas] * n
    st = {"cand": 0, "solid": 0}

    def freeze(z):
        val[z] = st["solid"]
        st["solid"] += 1

    def lt(x, y):
        if val[x] == gas and val[y] == gas:
            match rule:
                case "mcilroy":
                    freeze(y if x == st["cand"] else x)
                case "first":
                    freeze(x)
                case "second":
                    freeze(y)
                case "low":
                    freeze(min(x, y))
        if val[x] == gas:
            st["cand"] = x
        elif val[y] == gas:
            st["cand"] = y
        return val[x] < val[y]

    s = Sorter(list(range(n)), Cfg.parse(algo), lt=lt, trace=len(sys.argv) > 5)
    s.run()
    print(f"adv algo={algo} rule={rule} n={n} cmps={s.n} per={dict(s.per)}")
    with open(out, "w") as f:
        f.write(" ".join(map(str, val)) + "\n")
    if len(sys.argv) > 5:
        for e in s.events[:40]:
            print(*e)


if __name__ == "__main__":
    main()
