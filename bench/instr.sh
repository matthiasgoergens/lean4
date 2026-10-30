#!/bin/bash
# Run on the benchmark machine from ~/qsort-pr/bench: user-space instruction counts (load-insensitive) of
# the random-key and small-array workloads, for old, new and both identity baselines, with layout
# seeds 1-3 of each build, six at a time on CPUs 40-45, each under
# `sudo perf stat -x , -e instructions:u,cycles:u` (the program runs as this user via setpriv).
# Writes OUT_DIR/instr.tsv.  instr_analyse.py turns it into sort-only ratios.
#   Usage: ./instr.sh OUT_DIR
out=${1:?usage: $0 OUT_DIR}
cd "$(dirname "$0")" || exit 1
[ -e "$out" ] && { echo "$out exists"; exit 1; }
mkdir --parents "$out" || exit 1
workloads=("nat random 1000000 8" "nat random 1000000 32" "nat random 1000000 256"
  "nat random 1000000 0" "str random 1000000 0" "rec random 1000000 0" "u64 random 6250000 0")
uptime > "$out/load.txt"
i=0
for w in "${workloads[@]}"; do
  for seed in 1 2 3; do
    for impl in "old old core" "new new core" "none old none" "none-new new none"; do
      set -- $impl
      cpu=$((40 + i % 6)); i=$((i + 1))
      f="$out/$(echo "$w" | tr ' ' '-')-$1-$seed.csv"
      ( sudo --non-interactive perf stat -x , -e instructions:u,cycles:u -o "$f" -- \
          setpriv --reuid="$(id -u)" --regid="$(id -g)" --init-groups \
          taskset --cpu-list $cpu bins/$2/qsortbench-$seed $3 $w nocheck > "$f.out" 2>&1
        echo "rc=$?" >> "$f.out" ) &
      if (( i % 6 == 0 )); then wait; fi
    done
  done
done
wait
uptime >> "$out/load.txt"
for f in "$out"/*.csv; do
  printf '%s\t%s\t%s\t%s\n' "$(basename "$f" .csv)" "$(grep ',instructions:u,' "$f" | cut -d , -f 1)" \
    "$(grep ',cycles:u,' "$f" | cut -d , -f 1)" "$(tr '\n' ' ' < "$f.out")"
done > "$out/instr.tsv"
