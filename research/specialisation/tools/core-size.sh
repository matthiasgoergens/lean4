#!/bin/bash
# Run on the benchmark machine: sizes of the stage 1 builds of the given trees (paths): libleanshared.so
# (file size, and text/data from `size`), the total generated C, and the generated C of every
# module whose source mentions `qsort` (the PR branch's 96-module set: those with a .c file).
# Prints one TSV block per tree: tree, kind, name, bytes.
for t in "$@"; do
  so=$t/build/release/stage1/lib/lean/libleanshared.so
  echo -e "$t\tso_file\tlibleanshared.so\t$(stat -c %s "$so")"
  size "$so" | awk -v t="$t" 'NR==2 {print t "\tso_text\tlibleanshared.so\t" $1; print t "\tso_data\tlibleanshared.so\t" $2+$3}'
  temp=$t/build/release/stage1/lib/temp
  echo -e "$t\tc_total\tall\t$(find "$temp" -name '*.c' -printf '%s\n' | awk '{s+=$1} END {print s}')"
  (cd "$t/src" && grep -rl qsort --include='*.lean' . | sed 's|^\./||; s|^lake/||; s|\.lean$||') | sort | while read m; do
    [ -f "$temp/$m.c" ] && echo -e "$t\tc_mod\t$m\t$(stat -c %s "$temp/$m.c")"
  done
done
