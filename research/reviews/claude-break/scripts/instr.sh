#!/bin/bash
# instr.sh BIN MODE... : instructions:u (atom + core summed) for each algo, minus the `none` run.
# usage: instr.sh BIN pattern PAT N ALGO...   or   instr.sh BIN replay FILE ALGO...
bin=$1; mode=$2; shift 2
count() {
  nice ionice taskset --cpu-list ${CPU:-6} perf stat -x, -e instructions:u -- "$@" 2>&1 >/dev/null | awk -F, '/instructions/ && $1 ~ /^[0-9]+$/ {s += $1} END {print s}'
}
if [ "$mode" = pattern ]; then
  pat=$1; n=$2; shift 2
  base=$(count $bin pattern $pat $n 1 none)
  line="$pat n=$n:"
  for a in "$@"; do c=$(count $bin pattern $pat $n 1 $a); line="$line $a=$(( (c - base) / n ))/elt"; done
else
  f=$1; shift
  base=$(count $bin replay $f 1 none)
  line="$(basename $f):"
  for a in "$@"; do c=$(count $bin replay $f 1 $a); line="$line $a=$(( (c - base) / $(wc -w < $f) ))/elt"; done
fi
echo "$line"
