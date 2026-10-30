#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Write one input pattern as whitespace-separated naturals: gen.py SPEC N OUT.

SPEC is NAME or NAME:P1:P2 (integer parameters)."""
import random
import sys


def gen(spec: str, n: int) -> list[int]:
    name, *ps = spec.split(":")
    p = [int(x) for x in ps]
    rnd = random.Random(12345 + sum(p) * 7919 + n)
    match name:
        case "random":
            return [rnd.randrange(1 << 62) for _ in range(n)]
        case "sorted":
            return list(range(n))
        case "reversed":
            return list(range(n, 0, -1))
        case "constant":
            return [0] * n
        case "dups":  # K distinct values, random
            return [rnd.randrange(p[0]) for _ in range(n)]
        case "runs":  # K perfectly interleaving ascending runs
            k = p[0]
            m = n // k + 1
            return [(i % m) * k + i // m for i in range(n)]
        case "blocks":  # K sorted random blocks
            k = p[0]
            m = n // k + 1
            out = []
            for j in range(0, n, m):
                out += sorted(rnd.randrange(1 << 62) for _ in range(min(m, n - j)))
            return out
        case "rblocks":  # K reverse-sorted random blocks
            k = p[0]
            m = n // k + 1
            out = []
            for j in range(0, n, m):
                out += sorted((rnd.randrange(1 << 62) for _ in range(min(m, n - j))), reverse=True)
            return out
        case "saw":  # sawtooth with period P
            return [i % p[0] for i in range(n)]
        case "rsaw":
            return [p[0] - 1 - i % p[0] for i in range(n)]
        case "organ":  # organ pipe, each value repeated R times
            r = p[0] if p else 1
            return [(i if i < n // 2 else n - i) // r for i in range(n)]
        case "rorgan":  # inverted organ pipe (valley)
            r = p[0] if p else 1
            return [(n // 2 - i if i < n // 2 else i - n // 2) // r for i in range(n)]
        case "tail":  # ascending, then T values smaller than all
            t = p[0]
            return [i + t for i in range(n - t)] + list(range(t))
        case "rtail":  # ascending, then T descending smallest
            t = p[0]
            return [i + t for i in range(n - t)] + list(range(t - 1, -1, -1))
        case "head":  # T values larger than all, then ascending
            t = p[0]
            return [n + i for i in range(t)] + list(range(n - t))
        case "rot":  # sorted rotated by R
            r = p[0] % max(n, 1)
            return [(i + r) % n for i in range(n)]
        case "pushfront":
            return [i + 1 for i in range(n - 1)] + [0]
        case "interleave":  # even positions small ascending, odd positions large ascending
            return [i if i % 2 == 0 else n + i for i in range(n)]
        case "zigzag":  # pairs swapped
            return [i ^ 1 if (i ^ 1) < n else i for i in range(n)]
        case "bitrev":
            b = max(1, (n - 1).bit_length())
            return [int(format(i, f"0{b}b")[::-1], 2) for i in range(n)]
        case "nearly":  # sorted, K random swaps
            a = list(range(n))
            for _ in range(p[0]):
                i, j = rnd.randrange(n), rnd.randrange(n)
                a[i], a[j] = a[j], a[i]
            return a
        case "local":  # sorted, K swaps of elements at most D apart
            a = list(range(n))
            for _ in range(p[0]):
                i = rnd.randrange(n)
                j = min(n - 1, i + 1 + rnd.randrange(p[1]))
                a[i], a[j] = a[j], a[i]
            return a
        case "overwrite":  # sorted (step 4), K random positions overwritten by random values
            a = list(range(0, 4 * n, 4))
            for _ in range(p[0]):
                a[rnd.randrange(n)] = rnd.randrange(4 * n)
            return a
        case "moves":  # sorted, K elements each moved to a random position
            a = list(range(n))
            for _ in range(p[0]):
                x = a.pop(rnd.randrange(n))
                a.insert(rnd.randrange(n), x)
            return a
        case "periodic":  # sorted, every M-th element replaced by a random value
            return [rnd.randrange(n) if i % p[0] == 0 else i for i in range(n)]
        case "appended":  # sorted, then K random values appended at the end (n total)
            k = p[0]
            return list(range(0, 4 * (n - k), 4)) + [rnd.randrange(4 * n) for _ in range(k)]
        case "prepended":
            k = p[0]
            return [rnd.randrange(4 * n) for _ in range(k)] + list(range(0, 4 * (n - k), 4))
        case "nearlyrev":  # reversed, K random swaps
            a = list(range(n, 0, -1))
            for _ in range(p[0]):
                i, j = rnd.randrange(n), rnd.randrange(n)
                a[i], a[j] = a[j], a[i]
            return a
        case "nearlydup":  # sorted with each value repeated R times, K random swaps
            a = [i // p[1] for i in range(n)]
            for _ in range(p[0]):
                i, j = rnd.randrange(n), rnd.randrange(n)
                a[i], a[j] = a[j], a[i]
            return a
        case "scalefree":  # sorted, K swaps with log-uniform distances
            a = list(range(n))
            lg = max(1, n.bit_length() - 1)
            for _ in range(p[0]):
                d = int(2 ** rnd.uniform(0, lg))
                i = rnd.randrange(max(1, n - d))
                j = min(n - 1, i + d)
                a[i], a[j] = a[j], a[i]
            return a
        case "m3killer":  # Musser's median-of-3 killer
            k = n // 2
            a = [0] * n
            for i in range(1, k + 1):
                if i % 2 == 1:
                    a[i - 1] = i
                    a[i] = k + i
                a[k + i - 1] = 2 * i
            return a
        case "ninther":
            return [i if (5 * i >= n and 10 * i < 3 * n) or (10 * i >= 7 * n and 5 * i < 4 * n) else n + i for i in range(n)]
        case "dupsorted":  # sorted, each value repeated R times
            return [i // p[0] for i in range(n)]
        case "dupblocks":  # K random blocks of a few values each, sorted
            k = p[0]
            m = n // k + 1
            out = []
            for j in range(0, n, m):
                out += sorted(rnd.randrange(p[1]) for _ in range(min(m, n - j)))
            return out
        case "twovals":  # 0s and 1s arranged: first half 1, second half 0 / alternating
            return [1 if i < n // 2 else 0 for i in range(n)]
        case "altvals":
            return [i % 2 for i in range(n)]
        case "sqrtsaw":  # sawtooth of period sqrt(n), ascending teeth with growing offset
            import math
            s = max(2, math.isqrt(n))
            return [(i % s) * s + i // s for i in range(n)]
        case "randsorted_tail":  # sorted with P percent random tail
            k = n * p[0] // 100
            return list(range(0, (n - k) * 4, 4)) + [rnd.randrange(n * 4) for _ in range(k)]
        case "randhead":  # P percent random head then sorted
            k = n * p[0] // 100
            return [rnd.randrange(n * 4) for _ in range(k)] + list(range(0, (n - k) * 4, 4))
        case _:
            raise SystemExit(f"unknown pattern {spec}")


def main() -> None:
    spec, n, out = sys.argv[1], int(sys.argv[2]), sys.argv[3]
    a = gen(spec, n)
    assert len(a) == n, (spec, len(a))
    with open(out, "w") as f:
        f.write(" ".join(map(str, a)) + "\n")


if __name__ == "__main__":
    main()
