#!/bin/bash
# Run on the benchmark machine from ~/qsort-pr/bench: one run of each candidate cell with the old and new
# binary (layout seed 1), checked against Array.mergeSort, six at a time on CPUs 40-45, to size the
# plan (which 1M cells the old code finishes in time).  Output: one line per run.
cd "$(dirname "$0")" || exit 1
cells=(
  "nat organ 100000" "nat runs2 100000"
  "nat nearly 1000000" "nat sorted 1000000" "nat reversed 1000000" "nat nearly300 1000000"
  "nat zipf 1000000" "nat jitter64 1000000" "nat organ 1000000" "nat runs2 1000000"
  "nat random 1000000" "str random 1000000" "rec random 1000000" "u64 random 6250000"
  "nat random 1000000 8" "nat random 1000000 32" "nat random 1000000 256"
  "nat constant 300000" "nat dups4 300000" "nat pathological 300000"
)
uptime
i=0
for c in "${cells[@]}"; do
  for w in old new; do
    cpu=$((40 + i % 6)); i=$((i + 1))
    ( out=$(timeout 120 taskset --cpu-list $cpu bins/$w/qsortbench-1 core $c 2>&1); echo "$w $c cpu=$cpu exit=$? $out" ) &
    if (( i % 6 == 0 )); then wait; fi
  done
done
wait
uptime
