import sys, random
sys.path.insert(0, '.')
import port
from port import Sorter, Cfg
sys.setrecursionlimit(10000)
orig = Sorter.sort
viol = [0]; calls = [0]
def checked(self, lo, a, b, limit, balanced, partitioned, after_equal):
    calls[0] += 1
    if lo < a and a < b:
        p = self.v[a - 1]
        if any(x < p for x in self.v[a:b]): viol[0] += 1
        if after_equal and any(not (p < x) for x in self.v[a:b]): viol[0] += 1000000
    return orig(self, lo, a, b, limit, balanced, partitioned, after_equal)
Sorter.sort = checked
rnd = random.Random(5)
for trial in range(3000):
    n = rnd.choice([30, 60, 100, 200, 500, 2000, 5000])
    kind = rnd.randrange(4)
    k = rnd.choice([2, 3, 5, 10, 1000])
    if kind == 0: v = [rnd.randrange(k) for _ in range(n)]
    elif kind == 1: v = sorted(rnd.randrange(k) for _ in range(n)); [v.__setitem__(rnd.randrange(n), rnd.randrange(k)) for _ in range(5)]
    elif kind == 2: v = [i % k for i in range(n)]
    else: v = [(n - i) // 3 for i in range(n)]
    for algo in ['lab:lomuto,ends,c24,brk9,pisx6,pred6', 'lab:lomuto,ends,c24,brk9,pisx6,pred0', 'lab:lomuto,ends,c24,brk9,pisx6,pred100']:
        s = Sorter(v[:], Cfg.parse(algo)); r = s.run()
        assert r == sorted(v)
print('calls', calls[0], 'violations', viol[0])
