#!/bin/bash
# Run on the benchmark machine: user-space instructions (sudo perf stat -e instructions:u) of the sorts binary
# (shuffled build 1 of sorts-bins/current) for each algorithm and workload, REPS times, pinned to
# CPU 46, in a fresh random order per repetition.  `none` gives the baseline to subtract.
#   Usage: [DIR=sorts dir] [BIN=binary] [ALGOS="..."] instr.sh REPS
reps=${1:-3}
cd "${DIR:-$HOME/qsort-spec/sorts}" || exit 1
bin=${BIN:-../sorts-bins/current/sorts-1}
algos="${ALGOS:-none pdq spec-ctl spec-cold-hp spec-cold-hpp spec-leaves-hp spec-leaves-hpp spec-hot spec-closure}"
loads=("u64 random 6250000 0" "nat random 1000000 0" "nat random 1000000 8" "nat random 1000000 256" "nat nearly300 1000000 0" "nat runs16 100000 0" "str random 1000000 0" "nat dups4 100000 0" "rec random 1000000 0")
echo "rep algo workload instructions"
for r in $(seq 1 "$reps"); do
  for a in $algos; do for i in "${!loads[@]}"; do echo "$a $i"; done; done | shuf | while read a i; do
    w=${loads[$i]}
    n=$(sudo -n perf stat -x, -e instructions:u taskset --cpu-list 46 $bin $a $w nocheck 2>&1 >/dev/null | awk -F, '/instructions/ {print $1}')
    echo "$r $a ${w// /-} $n"
  done
done
