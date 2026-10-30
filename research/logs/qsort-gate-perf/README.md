# Hardware counters at the gate case (2026-10-27)

`perf stat` on the benchmark machine, CPU 100, three alternating rounds, for 6,250,000 random `UInt64` sorted through `Ord` (as Lean's `io_compute` benchmark sorts them), with core's `Array.qsortOrd` and `Pdq.qsortOrd`:

    sudo perf stat -e instructions,cycles,branch-misses -x, taskset --cpu-list 100 .lake/build/bin/sorts ALGO u64 random 6250000

built from commit cfadab0 (`lake build sorts` in `localhost/lean-bench`, Lean v4.34.1; `fingerprint.txt`).  The `none` runs do everything but sort (generation, then the check against `Array.mergeSort`, which then fails), so subtracting them leaves the sort: about 5.97 G instructions for core and 4.84 G for pdq.  Branch misses are equal (about 135 M against 73 M for `none`); cycles vary too much between rounds here to separate the two.
