# One-off: removes the pure comparing functions from Sorts/Pdq.lean and moves their docs to the
# monadic functions.
p='Sorts/Pdq.lean'
L=open(p).read().split('\n')
def lines(a,b): return '\n'.join(L[a-1:b])+'\n'
head=lines(1,18)
head2=head.replace("""are never read, which is what the "element before the range" test needs on a subrange.
-/""","""are never read, which is what the "element before the range" test needs on a subrange.

The comparison returns in a monad: `qsort` runs the code at `Id`, and `Sorts.PdqCost` runs the same
code in a state monad that counts the comparisons.
-/""")
assert head2!=head
out=head2+lines(19,26)+lines(70,74)+lines(111,135)
mon='\n'.join(L[284:])
reps=[
("""/-! ### The same algorithm with the comparison in a monad

Each function above that compares has a copy here whose comparison returns in a monad `m`: the same
comparisons in the same order, with the same control flow.  At `Id` the copies compute what the
pure functions compute (`Sorts.PdqMonadic` proves it), and `qsort` runs them; in a state monad they
can count comparisons (`Sorts.PdqCost`).
Results that live in `Type` are wrapped in `ULift`, which the compiler erases. -/""",
"""/-! ### The functions that compare

Their comparison `lt` returns in a monad `m`.  Results that live in `Type` are wrapped in `ULift`,
which the compiler erases. -/"""),
("""/-- `insertionSort`, comparing in `m`. -/""","""/-- Sorts `v[a:b]` by insertion. -/"""),
("""where
  @[specialize] sink (v : Vector α n) (j : Nat) (hj : j < n) : m (Vector α n) :=""",
"""where
  /-- Moves `v[j]` down while it is less than its left neighbour, not below `a`. -/
  @[specialize] sink (v : Vector α n) (j : Nat) (hj : j < n) : m (Vector α n) :="""),
("""/-- `siftDown`, comparing in `m`. -/""","""/-- Restores the max-heap property below `root` in the heap `v[first:first+hi]`. -/"""),
("""/-- `heapSort`, comparing in `m`. -/""","""/-- Sorts `v[a:b]` by heapsort. -/"""),
("""where
  @[specialize] build (v : Vector α n) : Nat → m (Vector α n)""","""where
  /-- Sifts down the roots `k - 1, …, 0`. -/
  @[specialize] build (v : Vector α n) : Nat → m (Vector α n)"""),
("""  @[specialize] pop (v : Vector α n) : (i : Nat) → i ≤ b - a → m (Vector α n)""","""  /-- Moves the maximum of the heap `v[a:a+i]` to its end, `i` times. -/
  @[specialize] pop (v : Vector α n) : (i : Nat) → i ≤ b - a → m (Vector α n)"""),
("""/-- `partialInsertionSort`, comparing in `m`. -/""","""/-- Insertion sort that gives up after moving five elements: returns whether `v[a:b]` ended up
sorted.  Ranges under 50 elements are only checked, not changed. -/"""),
("""where
  @[specialize] scan (v : Vector α n) (i : Nat) (h1 : a < i) (h2 : i ≤ b) :
      m (ULift.{u} {i' : Nat // a < i' ∧ i' ≤ b}) :=""","""where
  /-- The first `i' ≥ i` with `v[i'] < v[i' - 1]`, or `b`. -/
  @[specialize] scan (v : Vector α n) (i : Nat) (h1 : a < i) (h2 : i ≤ b) :
      m (ULift.{u} {i' : Nat // a < i' ∧ i' ≤ b}) :="""),
("""/-- `order2`, comparing in `m`. -/""","""/-- `x` and `y` ordered by their elements, and `swaps` counting the pairs found out of order. -/"""),
("""/-- `median`, comparing in `m`. -/""","""/-- The index of the median of the elements at `x`, `y` and `z`, and `swaps` counting the pairs
found out of order. -/"""),
("""/-- `choosePivot`, comparing in `m`. -/""","""/-- Chooses a pivot in `v[a:b]`, and hints whether the range looked ascending (no pair out of
order) or descending (every pair out of order). -/"""),
("""    (hab : a < b) (hb : b ≤ n) : m (ULift.{u} (Idx a b × Hint)) :=
  let ad""","""    (hab : a < b) (hb : b ≤ n) : m (ULift.{u} (Idx a b × Hint)) :=
  -- The candidates are `a + (b - a) / 4 * t` for `t = 1, 2, 3`, each with its neighbours when the
  -- ninther is used: `ad q d` is `a + q` moved by `d - 1`.
  let ad"""),
("""/-- `partition`, comparing in `m`. -/""","""/-- Partitions `v[a:b]` around `v[pivot]`: returns `mid` with `v[mid]` the pivot, everything before
it less and everything after it not less, and whether no element had to move. -/"""),
("""  let p := v[a]
  let ⟨⟨i, hi⟩⟩ ← scanUp""","""  let p := v[a]
  -- `[a+1, i)` is less than `p`, `(j, b)` is not less, and `[i, j]` is unexamined.
  let ⟨⟨i, hi⟩⟩ ← scanUp"""),
("""/-- `partitionEqual`, comparing in `m`. -/""","""/-- Given that no element of `v[a:b]` is less than `v[pivot]`, moves the elements equal to it to the
front and returns where the greater ones start. -/"""),
("""/-- `sort`, comparing in `m`.  The test for a partition into "equal" and "greater" compares only
when `afterEqual` is false and `lo < a`, as the `&&` in `sort` does. -/""","""/-- Sorts `v[a:b]`.  `limit` is the number of unbalanced partitions left before heapsort;
`balanced` and `partitioned` describe the partition that produced this range.  `afterEqual` says
that it is what a partition into "equal" and "greater" left: then no element of the range is
equivalent to the one before it, so the test for that is skipped (it compares only when
`afterEqual` is false and `lo < a`).  For a lawful `lt` this changes nothing; for an unlawful one,
it stops a chain of such partitions, each of which might take a single element off the range
without counting against `limit`, from costing quadratic time.  `fuel` bounds the length of the
range, so that the recursion is structural. -/"""),
("""/-- Sorts `as[lo..=hi]` in place, with the same interface as `Array.qsort`.  It runs `sortM` at
`Id`, which computes what `sort` computes (`Sorts.PdqMonadic`), so that the same code can also be
run in a monad that counts the comparisons. -/""","""/-- Sorts `as[lo..=hi]` in place, with the same interface as `Array.qsort`, by running `sortM` at
`Id`. -/"""),
]
for a,b in reps:
    assert mon.count(a)==1, a
    mon=mon.replace(a,b)
open(p,'w').write(out+mon)
