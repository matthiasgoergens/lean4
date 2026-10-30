#!/bin/bash
# Instruction counts (user mode, CPU 6, a performance core) of the given sorts binaries, three
# rounds; each round runs every binary on every key type, in a shuffled order.
# Usage: perf2.sh algo binary...
algo=$1; shift
for b in "$@"; do sha256sum "$b"; done
for r in 1 2 3; do
  for cell in $(for b in "$@"; do for t in u64 nat rec; do echo "$b,$t"; done; done | shuf); do
    b=${cell%,*}; t=${cell#*,}
    printf '%s %s %s run%s ' "$algo" "$(basename "$b")" "$t" "$r"
    perf stat -e cpu_core/instructions/u -x, taskset --cpu-list 6 "$b" "$algo" "$t" random 2000000 0 nocheck 2>&1 | tr '\n' ' '
    echo
  done
done
