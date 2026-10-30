#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""A step-for-step Python model of `PdqLab.sort` (and so of `Pdq.sortM` with the default Config),
instrumented: comparisons, swaps, partitions (size, split, kind), partial insertion sorts tried and
won, heapsort fallbacks, insertion-sorted elements.

    model.py ALGO TYPE PATTERN N        prints stats and the harness's hash of the result

ALGO is `pdq` or a `lab:...` name as `PdqLab.Config.parse` reads it.  TYPE `nat` or `pair` (the
harness's `pair`: equal keys carry a tag, so the hash shows the permutation of equal keys, which is
how the model is checked against the Lean binary).
"""

import sys
from dataclasses import dataclass, field

M64 = (1 << 64) - 1


def xorshift(x: int) -> int:
    x ^= (x << 13) & M64
    x ^= x >> 7
    x ^= (x << 17) & M64
    return x


def randoms(n: int, seed: int = 88172645463325252) -> list[int]:
    out = []
    x = seed
    for _ in range(n):
        x = xorshift(x)
        out.append(x)
    return out


def isqrt(n: int) -> int:
    import math
    return math.isqrt(n)


def pattern(name: str, n: int) -> list[int]:
    r = randoms(n)
    if name == "random":
        return [x >> 2 for x in r]
    if name == "dups4":
        return [x % 4 for x in r]
    if name == "dupsqrt":
        return [x % isqrt(n) for x in r]
    if name == "constant":
        return [0] * n
    if name == "sorted":
        return list(range(n))
    if name == "reversed":
        return [n - i for i in range(n)]
    if name == "organ":
        return [i if i < n // 2 else n - i for i in range(n)]
    if name.startswith("midblock"):
        t, pc = (int(x) for x in name[8:].split("x"))
        at = (n - t) * pc // 100
        return [i + t if i < at else i - at if i < at + t else i for i in range(n)]
    if name.startswith("file:"):
        return [int(w) for w in open(name[5:]).read().split()]
    if name == "m3killer":
        k = n // 2
        a = [0] * n
        for i in range(1, k + 1):
            if i % 2 == 1:
                if i - 1 < n: a[i - 1] = i
                if i < n: a[i] = k + i
            if k + i - 1 < n: a[k + i - 1] = 2 * i
        return a
    if name == "rothalf":
        return [(i + n // 2) % n for i in range(n)]
    if name == "zipf":
        import math
        return [int(math.exp((x >> 11) / 9007199254740992.0 * math.log(n))) for x in r]
    if name.startswith("jitter"):
        d = int(name[6:])
        return [i * 4 + x % (4 * d + 1) for i, x in enumerate(r)]
    if name.startswith("tail") and name[4:].isdigit():
        t = int(name[4:])
        return [i + t if i + t < n else i + t - n for i in range(n)]
    if name.startswith("appended"):
        k = int(name[8:])
        return [4 * i if i + k < n else r[i] % (4 * n) for i in range(n)]
    if name.startswith("cluster"):
        k, c, st = (int(x) for x in name[7:].split("x"))
        a = list(range(n))
        x = 777
        for _ in range(k):
            x = xorshift(x); q = x % max(n - c * st, 1) if n - c * st > 0 else x
            x = xorshift(x); rr = x % max(n - c * st, 1) if n - c * st > 0 else x
            if abs(q - rr) >= c * st:
                for t in range(c):
                    i, j = q + t * st, rr + t * st
                    if i < n and j < n:
                        a[i], a[j] = a[j], a[i]
        return a
    if name.startswith("nearlyK"):  # the break-it review's `nearly:K:S` (Python RNG, its seeding)
        import random as _r
        k, seed = (int(x) for x in name[len("nearlyK"):].split("_"))
        rnd = _r.Random(12345 + (k + seed) * 7919 + n)
        a = list(range(n))
        for _ in range(k):
            i, j = rnd.randrange(n), rnd.randrange(n)
            a[i], a[j] = a[j], a[i]
        return a
    if name == "nearly" or (name.startswith("nearly") and name[6:].isdigit()):
        a = list(range(n))
        x = 12345
        for _ in range(int(name[6:]) if name[6:] else 8):
            x = xorshift(x)
            i = x % n
            x = xorshift(x)
            j = x % n
            a[i], a[j] = a[j], a[i]
        return a
    if name == "sortedtail":
        return [i * 2**20 if i < n - n // 64 else r[i] >> 2 for i in range(n)]
    if name == "ninther":
        return [i if (5 * i >= n and 10 * i < 3 * n) or (10 * i >= 7 * n and 5 * i < 4 * n) else n + i
                for i in range(n)]
    if name == "pathological":
        return [0 if i + 1 == n else i + 1 for i in range(n)]
    if name == "runs2":
        return [2 * i if i < n // 2 else 2 * (i - n // 2) + 1 for i in range(n)]
    if name.startswith("runs"):
        k = int(name[4:])
        return [(i % (n // k + 1)) * k + i // (n // k + 1) for i in range(n)]
    if name.startswith("blocks"):
        k = int(name[6:])
        m = n // k + 1
        out = []
        for j in range((n + m - 1) // m):
            out += sorted(x >> 2 for x in r[j * m:j * m + m])
        return out
    raise SystemExit(f"unknown pattern {name}")


@dataclass
class Config:
    cut: int = 12
    lomuto: bool = False
    hybrid: bool = False
    pairs: bool = False
    branchless: bool = False
    block: bool = False
    median3: bool = False
    child_tries: bool = True
    hoare_bl: bool = False
    brk9: bool = False
    lean2: bool = False
    ends: bool = False
    pis8: bool = False
    hybp: bool = False
    pisx: bool = False  # partial insertion sort gives up at a descent between ordered blocks
    pisw: int = 1  # with pisx: how far the test looks (1: v[i+1] < v[i-2]; 6: v[i+5] < v[i-6])
    pred: bool = False  # with ends: pdq's loop where the windows at the ends rarely flip side
    predt: int = 3  # at most this many flips
    predm: bool = False  # windows at the quarter points inside the middle, not at its ends
    pos: str = "quarters"  # or golden, hashed
    seed_start: bool = False
    cap: int = -1  # failed partial insertion sorts allowed per path (-1: unlimited)


def parse(name: str) -> Config:
    if name == "pdq":  # production pdq: cutoff 24 since matthias/qsort 6527464
        return Config(cut=24)
    if name == "lab-base":
        return Config()
    if name == "lab-c24":
        return Config(cut=24)
    if name == "lab-lomuto":
        return Config(lomuto=True)
    if name == "lab-lomuto-c24":
        return Config(cut=24, lomuto=True)
    if name.startswith("lab-c"):
        return Config(cut=int(name[5:]))
    assert name.startswith("lab:"), name
    c = Config()
    for o in name[4:].split(","):
        match o:
            case "lomuto": c.lomuto = True
            case "hyb": c.hybrid = True
            case "block": c.block = True
            case "bl": c.branchless = True
            case "pairs": c.pairs = True
            case "m3": c.median3 = True
            case "nochild": c.child_tries = False
            case "bh": c.hoare_bl = True
            case "brk9": c.brk9 = True
            case "bl2": c.branchless = True; c.lean2 = True
            case "ends": c.branchless = True; c.ends = True
            case "pis8": c.pis8 = True
            case "hybp": c.hybp = True
            case "pisx": c.pisx = True
            case "predm": c.predm = True
            case "pisx6": c.pisx = True; c.pisw = 6
            case "gold": c.pos = "golden"
            case "hash": c.pos = "hashed"
            case "seeda": c.seed_start = True
            case "pred": c.pred = True
            case _ if o.startswith("pred") and o[4:].isdigit(): c.pred = True; c.predt = int(o[4:])
            case _ if o.startswith("cap"): c.cap = int(o[3:])
            case _:
                assert o.startswith("c"), o
                c.cut = int(o[1:])
    return c


@dataclass
class Stats:
    cmps: int = 0
    swaps: int = 0
    partitions: list = field(default_factory=list)  # (depth, size, left, kind)
    pis_tried: int = 0
    pis_won: int = 0
    pis_won_elems: int = 0
    heaps: list = field(default_factory=list)  # (depth, size)
    ins_elems: int = 0
    ins_calls: int = 0
    equal_parts: int = 0
    phase_cmps: dict = field(default_factory=dict)
    breaks: int = 0
    reversals: int = 0


class Sorter:
    def __init__(self, lt, cfg: Config):
        self.lt0 = lt
        self.cfg = cfg
        self.s = Stats()

    phase = "other"

    def lt(self, x, y) -> bool:
        self.s.cmps += 1
        self.s.phase_cmps[self.phase] = self.s.phase_cmps.get(self.phase, 0) + 1
        return self.lt0(x, y)

    def in_phase(self, name, f, *args):
        old, self.phase = self.phase, name
        try:
            return f(*args)
        finally:
            self.phase = old

    def swap(self, v, i, j):
        self.s.swaps += 1
        v[i], v[j] = v[j], v[i]

    # --- Pdq pieces -----------------------------------------------------------------------------

    def insertion(self, v, a, b):
        self.s.ins_calls += 1
        self.s.ins_elems += b - a
        for i in range(a + 1, b):
            j = i
            while j > a and self.lt(v[j], v[j - 1]):
                self.swap(v, j, j - 1)
                j -= 1

    def sift(self, v, root, hi, first):
        while 2 * root + 1 < hi:
            c = 2 * root + 1
            if 2 * root + 2 < hi and self.lt(v[first + c], v[first + c + 1]):
                c += 1
            if self.lt(v[first + root], v[first + c]):
                self.swap(v, first + root, first + c)
                root = c
            else:
                return

    def heapsort(self, v, a, b):
        n = b - a
        for k in range((n - 1) // 2, -1, -1):
            self.sift(v, k, n, a)
        for i in range(n - 1, -1, -1):
            self.swap(v, a, a + i)
            self.sift(v, 0, i, a)

    def break_patterns(self, v, a, b):
        if b - a >= 8:
            self.s.breaks += 1
            r = (b - a) & M64
            groups = (1, 2, 3) if self.cfg.brk9 and b - a >= 50 else (2,)
            for g in groups:
                for t in range(3):
                    r = xorshift(r)
                    self.swap(v, a + (b - a) // 4 * g - 1 + t, a + r % (b - a))

    def order2(self, v, x, y, swaps):
        if self.lt(v[y], v[x]):
            return y, x, swaps + 1
        return x, y, swaps

    def median(self, v, x, y, z, swaps):
        x, y, swaps = self.order2(v, x, y, swaps)
        y, _, swaps = self.order2(v, y, z, swaps)
        _, y, swaps = self.order2(v, x, y, swaps)
        return y, swaps

    def choose_pivot(self, v, a, b):
        L = b - a
        if L >= 8:
            q1, q2, q3 = L // 4, L // 4 * 2, L // 4 * 3
            if L >= 50:
                i, s = self.median(v, a + q1 - 1, a + q1, a + q1 + 1, 0)
                j, s = self.median(v, a + q2 - 1, a + q2, a + q2 + 1, s)
                k, s = self.median(v, a + q3 - 1, a + q3, a + q3 + 1, s)
            else:
                i, j, k, s = a + q1, a + q2, a + q3, 0
            j, s = self.median(v, i, j, k, s)
            return j, ("inc" if s == 0 else "dec" if s == 12 else "unk")
        return a + L // 4 * 2, "inc"

    @staticmethod
    def hash64(u):
        m = 0xc6a4a7935bd1e995
        k = (11 * m) & M64
        k ^= k >> 47
        k ^= m
        return ((u ^ k) * m) & M64

    def choose_pivot_pos(self, v, a, b):
        L = b - a
        if L < 8:
            return a + L // 4 * 2, "inc"
        H = self.hash64
        seed = H((L ^ H(a)) & M64) if self.cfg.seed_start else H(L)
        G = 0x9E3779B97F4A7C15
        if self.cfg.pos == "golden":
            us = [(seed + k * G) & M64 for k in (1, 2, 3)]
        else:
            x2 = H(seed)
            us = [seed, x2, H(x2)]
        us.sort()
        scale = lambda u, span: min(((u >> 32) * span) // 4294967296, span - 1)
        if L >= 50:
            meds = []
            sw = 0
            for u in us:
                o = a + scale(u, L - 2)
                m, sw = self.median(v, o, o + 1, o + 2, sw)
                meds.append(m)
            m, sw = self.median(v, meds[0], meds[1], meds[2], sw)
        else:
            m, sw = self.median(v, *(a + scale(u, L) for u in us), 0)
        return m, ("inc" if sw == 0 else "dec" if sw == 12 else "unk")

    def median3_pivot(self, v, a, b):
        L = b - a
        if L >= 8:
            j, s = self.median(v, a + L // 4, a + L // 4 * 2, a + L // 4 * 3, 0)
            return j, ("inc" if s == 0 else "dec" if s == 3 else "unk")
        return a + L // 4 * 2, "inc"

    def reverse(self, v, i, j):
        while i + 1 < j:
            self.swap(v, i, j - 1)
            i += 1
            j -= 1

    def partial_insertion(self, v, a, b):
        i = a + 1
        for _ in range(5):
            while i < b and not self.lt(v[i], v[i - 1]):
                i += 1
            if i == b:
                return True
            if b - a < 50:
                return False
            w = self.cfg.pisw
            if self.cfg.pisx and i - a >= w + 1 and i + w < b and self.lt(v[i + w], v[i - w - 1]):
                return False
            self.swap(v, i, i - 1)
            if i - a >= 2:
                j = i - 1
                while j > a and self.lt(v[j], v[j - 1]):
                    self.swap(v, j, j - 1)
                    j -= 1
            if b - i >= 2:
                j = i + 1
                while j < b and self.lt(v[j], v[j - 1]):
                    self.swap(v, j, j - 1)
                    j += 1
        return False

    def partial_insertion8(self, v, a, b):
        moved = 0
        for i in range(a + 1, b):
            j = i
            while j > a and self.lt(v[j], v[j - 1]):
                self.swap(v, j, j - 1)
                j -= 1
                moved += 1
            if moved > 8:
                return False
        return True

    def partition_hoare(self, v, a, b, pivot):
        self.swap(v, a, pivot)
        p = v[a]
        i, j = a + 1, b - 1
        while i <= j and self.lt(v[i], p):
            i += 1
        while i <= j and not self.lt(v[j], p):
            j -= 1
        if not i < j:
            self.swap(v, j, a)
            return j, True
        self.swap(v, i, j)
        i, j = i + 1, j - 1
        while True:
            while i <= j and self.lt(v[i], p):
                i += 1
            while i <= j and not self.lt(v[j], p):
                j -= 1
            if i < j:
                self.swap(v, i, j)
                i, j = i + 1, j - 1
            else:
                self.swap(v, j, a)
                return j, False

    def partition_equal(self, v, a, b, pivot):
        self.swap(v, a, pivot)
        p = v[a]
        i, j = a + 1, b - 1
        while True:
            while i <= j and not self.lt(p, v[i]):
                i += 1
            while i <= j and self.lt(p, v[j]):
                j -= 1
            if i < j:
                self.swap(v, i, j)
                i, j = i + 1, j - 1
            else:
                return i

    def hoare_branchless(self, v, a, b, pivot):
        self.swap(v, a, pivot)
        p = v[a]
        i, j = a + 1, b - 1
        still = True
        while i < j:
            c1 = self.lt(v[i], p)
            c2 = self.lt(v[j], p)
            s = not c1 and c2
            if s:
                self.swap(v, i, j)
            still = still and not s
            i += 1 if (c1 or c2) else 0
            j -= 0 if (c1 and c2) else 1
        if i == j and self.lt(v[i], p):
            i += 1
        self.swap(v, a, i - 1)
        return i - 1, still

    def lomuto(self, v, a, b, pivot):
        self.swap(v, a, pivot)
        p = v[a]
        i = a + 1
        still = True
        for k in range(a + 1, b):
            if self.lt(v[k], p):
                still = still and i == k
                self.swap(v, i, k)
                i += 1
        self.swap(v, a, i - 1)
        return i - 1, still

    def lomuto_bl(self, v, a, b, pivot):
        self.swap(v, a, pivot)
        p = v[a]
        i = a + 1
        still = True
        for k in range(a + 1, b):
            c = self.lt(v[k], p)
            self.swap(v, i, k)
            still = still and (i == k or not c)
            i += 1 if c else 0
        self.swap(v, a, i - 1)
        return i - 1, still

    def bf_loop(self, v, p, i, k, b):
        while k < b:
            c = self.lt(v[k], p)
            self.swap(v, i, k)
            i += 1 if c else 0
            k += 1
        return i

    def lomuto_bl2(self, v, a, b, pivot):
        self.swap(v, a, pivot)
        p = v[a]
        f = a + 1
        while f < b and self.lt(v[f], p):
            f += 1
        if f < b:
            i = self.bf_loop(v, p, f, f + 1, b)
            self.swap(v, a, i - 1)
            return i - 1, i == f
        self.swap(v, a, f - 1)
        return f - 1, True

    def lomuto_ends(self, v, a, b, pivot):
        self.swap(v, a, pivot)
        p = v[a]
        i, j = a + 1, b - 1
        while i <= j and self.lt(v[i], p):
            i += 1
        while i <= j and not self.lt(v[j], p):
            j -= 1
        if i < j and self.cfg.pred and i + 64 <= j:
            if self.cfg.predm:
                q = (j - i) // 4
                s1, s2 = i + q, j - q - 15
            else:
                s1, s2 = i, j - 15
            f = 0
            if self.cfg.predm:
                prev = self.lt(v[s1], p)
            else:
                prev = False
            for k in range(s1 + 1, s1 + 16):
                c = self.lt(v[k], p)
                f += c != prev
                prev = c
            prev = self.lt(v[s2], p)
            for k in range(s2 + 1, s2 + 16):
                c = self.lt(v[k], p)
                f += c != prev
                prev = c
            if f <= self.cfg.predt:
                self.s.pred_hoare = getattr(self.s, "pred_hoare", 0) + 1
                self.swap(v, i, j)
                i, j = i + 1, j - 1
                while True:
                    while i <= j and self.lt(v[i], p):
                        i += 1
                    while i <= j and not self.lt(v[j], p):
                        j -= 1
                    if i < j:
                        self.swap(v, i, j)
                        i, j = i + 1, j - 1
                    else:
                        self.swap(v, j, a)
                        return j, False
        if i < j:
            i2 = self.bf_loop(v, p, i, i + 1, j + 1)
            self.swap(v, a, i2 - 1)
            return i2 - 1, False
        self.swap(v, j, a)
        return j, True

    def locally_sorted(self, v, a, b):
        for t in range(8):
            x = a + (b - a - 2) * t // 8
            if self.lt(v[x + 1], v[x]):
                return False
        return True

    def partition(self, v, a, b, pivot, hint):
        c = self.cfg
        if c.hybp and self.tried:
            return self.partition_hoare(v, a, b, pivot) + ("hoare",)
        if c.pairs and a + 16 <= b:
            if self.locally_sorted(v, a, b):
                return self.partition_hoare(v, a, b, pivot) + ("hoare",)
            return self.lomuto_bl(v, a, b, pivot) + ("lbl",)
        if c.lomuto or (c.hybrid and hint != "inc"):
            if c.branchless:
                if c.ends:
                    return self.lomuto_ends(v, a, b, pivot) + ("ends",)
                if c.lean2:
                    return self.lomuto_bl2(v, a, b, pivot) + ("lbl",)
                return self.lomuto_bl(v, a, b, pivot) + ("lbl",)
            return self.lomuto(v, a, b, pivot) + ("lom",)
        if c.hoare_bl:
            return self.hoare_branchless(v, a, b, pivot) + ("bh",)
        if c.block:
            raise SystemExit("block partition not modelled")
        return self.partition_hoare(v, a, b, pivot) + ("hoare",)

    def sort(self, v, lo, a, b, limit, balanced, partitioned, after_equal, depth=0, fails=None):
        if fails is None:
            fails = self.cfg.cap
        while True:  # the second recursive call is a tail call
            if b - a <= max(self.cfg.cut, 12):
                self.in_phase("ins", self.insertion, v, a, b)
                return
            if limit == 0:
                self.s.heaps.append((depth, b - a))
                self.in_phase("heap", self.heapsort, v, a, b)
                return
            if not balanced:
                self.break_patterns(v, a, b)
                limit -= 1
            if self.cfg.median3:
                pivot, hint = self.in_phase("pivot", self.median3_pivot, v, a, b)
            elif self.cfg.pos != "quarters":
                pivot, hint = self.in_phase("pivot", self.choose_pivot_pos, v, a, b)
            else:
                pivot, hint = self.in_phase("pivot", self.choose_pivot, v, a, b)
            if hint == "dec":
                self.s.reversals += 1
                self.reverse(v, a, b)
                pivot = b - 1 - (pivot - a)
                hint = "inc"
            self.tried = balanced and partitioned and hint == "inc" and fails != 0
            if self.tried:
                self.s.pis_tried += 1
                pis = self.partial_insertion8 if self.cfg.pis8 else self.partial_insertion
                if self.in_phase("pis", pis, v, a, b):
                    self.s.pis_won += 1
                    self.s.pis_won_elems += b - a
                    return
                if fails > 0:
                    fails -= 1
            if not after_equal and lo < a and not self.lt(v[a - 1], v[pivot]):
                self.s.equal_parts += 1
                a = self.in_phase("equal", self.partition_equal, v, a, b, pivot)
                after_equal = True
                depth += 1
                continue
            mid, already, kind = self.in_phase("part", self.partition, v, a, b, pivot, hint)
            self.s.partitions.append((depth, b - a, mid - a, kind))
            if mid - a < b - mid:
                self.sort(v, lo, a, mid, limit, True, self.cfg.child_tries, False, depth + 1, fails)
                a, balanced, partitioned, after_equal = mid + 1, mid - a >= (b - a) // 8, already, False
            else:
                self.sort(v, lo, mid + 1, b, limit, True, self.cfg.child_tries, False, depth + 1, fails)
                b, balanced, partitioned, after_equal = mid, b - mid >= (b - a) // 8, already, False
            depth += 1

    def qsort(self, v):
        n = len(v)
        if n:
            self.sort(v, 0, 0, n, n.bit_length(), True, True, False)
        return v


def mix(h: int, x: int) -> int:
    return ((h ^ x) * 1099511628211) & M64


def run(algo: str, typ: str, pat: str, n: int):
    base = pattern(pat, n)
    if typ == "nat":
        v, lt = list(base), (lambda x, y: x < y)
    elif typ == "pair":
        v = [(x % 2**40) * 2**20 + i % 2**20 for i, x in enumerate(base)]
        lt = lambda x, y: (x >> 20) < (y >> 20)
    else:
        raise SystemExit(f"unknown type {typ}")
    s = Sorter(lt, parse(algo))
    sys.setrecursionlimit(10000)
    s.qsort(v)
    key = (lambda x: x) if typ == "nat" else (lambda x: x >> 20)
    assert all(key(v[i]) <= key(v[i + 1]) for i in range(len(v) - 1)), "not sorted"
    h = 0
    for x in v:
        h = mix(h, x & M64)
    return s.s, h


def summary(st: Stats, n: int) -> str:
    parts = st.partitions
    unbal = sum(1 for d, size, left, k in parts if min(left, size - 1 - left) < size // 8)
    work = sum(size for d, size, left, k in parts)
    heap_elems = sum(s for d, s in st.heaps)
    return (f"cmps/n={st.cmps / n:.2f} swaps/n={st.swaps / n:.2f} partitions={len(parts)} "
            f"unbalanced={unbal} partitioned-elems/n={work / n:.2f} heaps={len(st.heaps)} "
            f"heap-elems/n={heap_elems / n:.2f} pis={st.pis_won}/{st.pis_tried} "
            f"pis-won-elems/n={st.pis_won_elems / n:.2f} ins-elems/n={st.ins_elems / n:.2f} "
            f"equal={st.equal_parts} breaks={st.breaks} reversals={st.reversals} "
            + " ".join(f"{k}={c / n:.2f}" for k, c in sorted(st.phase_cmps.items())))


if __name__ == "__main__":
    algo, typ, pat, n = sys.argv[1], sys.argv[2], sys.argv[3], int(sys.argv[4])
    st, h = run(algo, typ, pat, n)
    if pat.startswith("file:"):
        n = len(pattern(pat, n))
    print(f"{algo} {typ} {pat} {n}: {summary(st, n)} hash={h}")
