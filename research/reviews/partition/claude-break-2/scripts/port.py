#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""A Python port of PdqLab.sort (lomuto/ends/brk9/nochild/hybp/pis8/cut) and Pdq.sortM, counting
comparisons per phase.  port.py ALGO FILE [trace]  (ALGO: pdq or a lab:... name).

Validated against the Lean binary's comparison counts (see validate in the logs)."""
import sys
from collections import Counter
from dataclasses import dataclass

M64 = (1 << 64) - 1


def xorshift(r: int) -> int:
    r ^= (r << 13) & M64
    r ^= r >> 7
    r ^= (r << 17) & M64
    return r


@dataclass
class Cfg:
    cut: int = 12
    lomuto: bool = False
    ends: bool = False
    brk9: bool = False
    child: bool = True
    hybp: bool = False
    pis8: bool = False
    pisx: bool = False
    pis_width: int = 1
    pred: bool = False
    pred_max: int = 3

    @staticmethod
    def parse(name: str) -> "Cfg":
        if name == "pdq":
            return Cfg(cut=24)
        assert name.startswith("lab:")
        c = Cfg()
        for o in name[4:].split(","):
            match o:
                case "lomuto":
                    c.lomuto = True
                case "ends":
                    c.ends = True
                case "brk9":
                    c.brk9 = True
                case "nochild":
                    c.child = False
                case "hybp":
                    c.hybp = True
                case "pis8":
                    c.pis8 = True
                case "pisx":
                    c.pisx = True
                case "pisx6":
                    c.pisx = True
                    c.pis_width = 6
                case "pred":
                    c.pred = True
                case _ if o.startswith("pred"):
                    c.pred = True
                    c.pred_max = int(o[4:])
                case _ if o.startswith("c"):
                    c.cut = int(o[1:])
                case _:
                    raise SystemExit(f"unsupported option {o}")
        if c.lomuto and not c.ends:
            raise SystemExit("only lomuto,ends is ported")
        return c


class Sorter:
    def __init__(self, v, cfg: Cfg, lt=None, trace=False):
        self.v = v
        self.cfg = cfg
        self.n = 0
        self.phase = "?"
        self.per = Counter()
        self.predc = Counter()
        self.trace = trace
        self.events = []
        self.base_lt = lt or (lambda x, y: x < y)

    def lt(self, x, y):
        self.n += 1
        self.per[self.phase] += 1
        return self.base_lt(x, y)

    def swap(self, i, j):
        v = self.v
        v[i], v[j] = v[j], v[i]

    # --- helpers ---
    def insertion(self, a, b):
        v, lt = self.v, self.lt
        for i in range(a + 1, b):
            j = i
            while j > a and lt(v[j], v[j - 1]):
                v[j], v[j - 1] = v[j - 1], v[j]
                j -= 1

    def sift(self, root, hi, first):
        v, lt = self.v, self.lt
        while 2 * root + 1 < hi:
            c = 2 * root + 1
            if 2 * root + 2 < hi and lt(v[first + 2 * root + 1], v[first + 2 * root + 2]):
                c = 2 * root + 2
            if lt(v[first + root], v[first + c]):
                self.swap(first + root, first + c)
                root = c
            else:
                break

    def heap(self, a, b):
        ln = b - a
        for k in range((ln - 1) // 2, -1, -1):
            self.sift(k, ln, a)
        for i in range(ln - 1, -1, -1):
            self.swap(a, a + i)
            self.sift(0, i, a)

    def pis(self, a, b, w=None):
        v, lt = self.v, self.lt
        i = a + 1
        for _ in range(5):
            while i < b and not lt(v[i], v[i - 1]):
                i += 1
            if i == b:
                return True
            if b - a < 50:
                return False
            if w is not None and a + 1 + w <= i and i + w < b and lt(v[i + w], v[i - 1 - w]):
                return False
            self.swap(i, i - 1)
            if i - a >= 2:
                j = i - 1
                while j > a and lt(v[j], v[j - 1]):
                    self.swap(j, j - 1)
                    j -= 1
            if b - i >= 2:
                j = i + 1
                while j < b and lt(v[j], v[j - 1]):
                    self.swap(j, j - 1)
                    j += 1
        return False

    def pis8(self, a, b):
        v, lt = self.v, self.lt
        moved = 0
        for i in range(a + 1, b):
            j = i
            while j > a and lt(v[j], v[j - 1]):
                self.swap(j, j - 1)
                j -= 1
                moved += 1
            if moved > 8:
                return False
        return True

    def order2(self, x, y, s):
        if self.lt(self.v[y], self.v[x]):
            return y, x, s + 1
        return x, y, s

    def median(self, x, y, z, s):
        x, y, s = self.order2(x, y, s)
        y, _, s = self.order2(y, z, s)
        _, y, s = self.order2(x, y, s)
        return y, s

    def choose(self, a, b):
        ln = b - a
        q = ln // 4
        if ln >= 8:
            if ln >= 50:
                i, s = self.median(a + q - 1, a + q, a + q + 1, 0)
                j, s = self.median(a + 2 * q - 1, a + 2 * q, a + 2 * q + 1, s)
                k, s = self.median(a + 3 * q - 1, a + 3 * q, a + 3 * q + 1, s)
            else:
                i, j, k, s = a + q, a + 2 * q, a + 3 * q, 0
            j, s = self.median(i, j, k, s)
            return j, ("inc" if s == 0 else "dec" if s == 12 else "unk")
        return a + q * 2, "inc"

    def brk3(self, a, b):
        ln = b - a
        if ln >= 8:
            r = ln
            for t in range(3):
                r = xorshift(r)
                self.swap(a + ln // 4 * 2 - 1 + t, a + r % ln)

    def brk9(self, a, b):
        ln = b - a
        if ln >= 50:
            r = ln
            for g in (1, 2, 3):
                for t in range(3):
                    r = xorshift(r)
                    self.swap(a + ln // 4 * g - 1 + t, a + r % ln)
        else:
            self.brk3(a, b)

    def scan_up(self, p, i, j):
        v, lt = self.v, self.lt
        while i <= j and lt(v[i], p):
            i += 1
        return i

    def scan_down(self, p, i, j):
        v, lt = self.v, self.lt
        while i <= j and not lt(v[j], p):
            j -= 1
        return j

    def hoare(self, a, b, pivot):
        self.swap(a, pivot)
        p = self.v[a]
        i = self.scan_up(p, a + 1, b - 1)
        j = self.scan_down(p, i, b - 1)
        if not i < j:
            self.swap(j, a)
            return j, True
        self.swap(i, j)
        i, j = i + 1, j - 1
        while True:
            i = self.scan_up(p, i, j)
            j2 = self.scan_down(p, i, j)
            if i < j2:
                self.swap(i, j2)
                i, j = i + 1, j2 - 1
            else:
                self.swap(j2, a)
                return j2, False

    def lomuto_ends(self, a, b, pivot):
        v, lt = self.v, self.lt
        self.swap(a, pivot)
        p = v[a]
        i = self.scan_up(p, a + 1, b - 1)
        j = self.scan_down(p, i, b - 1)
        if i < j:
            k = i + 1
            while k < j + 1:
                c = lt(v[k], p)
                v[i], v[k] = v[k], v[i]
                i += c
                k += 1
            self.swap(a, i - 1)
            return i - 1, False
        self.swap(j, a)
        return j, True

    def flips(self, p, s, e, prev):
        acc = 0
        for k in range(s, e):
            c = self.lt(self.v[k], p)
            acc += c != prev
            prev = c
        return acc

    def lomuto_ends_pred(self, a, b, pivot):
        v, lt = self.v, self.lt
        self.swap(a, pivot)
        p = v[a]
        i = self.scan_up(p, a + 1, b - 1)
        j = self.scan_down(p, i, b - 1)
        if i < j:
            if i + 64 <= j:
                f = self.flips(p, i + 1, i + 16, False)
                f += self.flips(p, j - 14, j + 1, lt(v[j - 15], p))
            else:
                f = self.cfg.pred_max + 1
            self.last_pred = f <= self.cfg.pred_max
            self.predc['pdqloop' if self.last_pred else 'bfloop'] += 1
            if f <= self.cfg.pred_max:
                self.swap(i, j)
                i, j = i + 1, j - 1
                while True:
                    i = self.scan_up(p, i, j)
                    j2 = self.scan_down(p, i, j)
                    if i < j2:
                        self.swap(i, j2)
                        i, j = i + 1, j2 - 1
                    else:
                        self.swap(j2, a)
                        return j2, False
            k = i + 1
            while k < j + 1:
                c = lt(v[k], p)
                v[i], v[k] = v[k], v[i]
                i += c
                k += 1
            self.swap(a, i - 1)
            return i - 1, False
        self.swap(j, a)
        return j, True

    def part_equal(self, a, b, pivot):
        v, lt = self.v, self.lt
        self.swap(a, pivot)
        p = v[a]
        i, j = a + 1, b - 1
        while True:
            while i <= j and not lt(p, v[i]):
                i += 1
            while i <= j and lt(p, v[j]):
                j -= 1
            if i < j:
                self.swap(i, j)
                i, j = i + 1, j - 1
            else:
                return i

    def sort(self, lo, a, b, limit, balanced, partitioned, after_equal):
        cfg, v = self.cfg, self.v
        if b - a <= max(cfg.cut, 12):
            self.phase = "insertion"
            self.insertion(a, b)
            return
        if limit == 0:
            self.phase = "heap"
            if self.trace:
                self.events.append(("heap", a, b))
            self.heap(a, b)
            return
        if not balanced:
            (self.brk9 if cfg.brk9 else self.brk3)(a, b)
            limit -= 1
        self.phase = "pivot"
        pivot, hint = self.choose(a, b)
        if hint == "dec":
            v[a:b] = v[a:b][::-1]
            pivot = b - 1 - (pivot - a)
            hint = "inc"
        tried = balanced and partitioned and hint == "inc"
        if tried:
            self.phase = "pis"
            n0 = self.n
            done = self.pis8(a, b) if cfg.pis8 else self.pis(a, b, cfg.pis_width) if cfg.pisx else self.pis(a, b)
            if self.trace:
                self.events.append(("pis", a, b, done, self.n - n0))
            if done:
                return
        if not after_equal and lo < a:
            self.phase = "eqtest"
            if not self.lt(v[a - 1], v[pivot]):
                self.phase = "equal"
                mid = self.part_equal(a, b, pivot)
                if self.trace:
                    self.events.append(("equal", a, b, mid))
                self.sort(lo, mid, b, limit, balanced, partitioned, True)
                return
        self.phase = "partition"
        n0 = self.n
        if cfg.hybp and tried:
            mid, already = self.hoare(a, b, pivot)
        elif cfg.lomuto and cfg.pred:
            mid, already = self.lomuto_ends_pred(a, b, pivot)
        elif cfg.lomuto:
            mid, already = self.lomuto_ends(a, b, pivot)
        else:
            mid, already = self.hoare(a, b, pivot)
        if self.trace:
            self.events.append(("part", a, b, mid, already, balanced, partitioned, hint, limit, self.n - n0))
        if mid - a < b - mid:
            self.sort(lo, a, mid, limit, True, cfg.child, False)
            self.sort(lo, mid + 1, b, limit, mid - a >= (b - a) // 8, already, False)
        else:
            self.sort(lo, mid + 1, b, limit, True, cfg.child, False)
            self.sort(lo, a, mid, limit, b - mid >= (b - a) // 8, already, False)

    def run(self):
        n = len(self.v)
        if n:
            self.sort(0, 0, n, n.bit_length(), True, True, False)
        return self.v


def main() -> None:
    sys.setrecursionlimit(100000)
    algo, path = sys.argv[1], sys.argv[2]
    trace = len(sys.argv) > 3
    v = [int(x) for x in open(path).read().split()]
    s = Sorter(v[:], Cfg.parse(algo), trace=trace)
    r = s.run()
    ok = r == sorted(v)
    print(f"algo={algo} n={len(v)} cmps={s.n} ok={ok} per={dict(s.per)} pred={dict(s.predc)}")
    if trace:
        for e in s.events:
            print(*e)


if __name__ == "__main__":
    main()
