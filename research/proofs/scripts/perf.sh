#!/bin/bash
# Instruction counts of pdq on 2,000,000 random keys, pinned to CPU 6 (a performance core).
cd "$(dirname "$0")/../../sorts" || exit 1
sha256sum .lake/build/bin/sorts
for r in 1 2 3; do
  for t in u64 nat rec; do
    printf '%s run%s ' "$t" "$r"
    perf stat -e cpu_core/instructions/u -x, taskset --cpu-list 6 .lake/build/bin/sorts pdq "$t" random 2000000 0 nocheck 2>&1 | tr '\n' ' '
    echo
  done
done
