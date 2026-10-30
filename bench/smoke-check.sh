#!/bin/bash
# Run on the benchmark machine from ~/qsort-pr/bench: one checked run (no `nocheck`: the result is compared
# with Array.mergeSort) of every workload of cells.py with the old and new builds, six at a time on
# CPUs 40-45, through shuffled.sh.  Prints one line per run; any failure shows as exit != 0.
cd "$(dirname "$0")" || exit 1
uptime
i=0
while read -r line; do
  cpu=$((40 + i % 6)); i=$((i + 1))
  ( out=$(taskset --cpu-list $cpu ./shuffled.sh $line 2>&1); echo "exit=$? cpu=$cpu $line $out" ) &
  if (( i % 6 == 0 )); then wait; fi
done < <(./cells.py 1 0 | uv run --quiet python -I -c 'import json, sys
for c in json.load(sys.stdin):
    if c["impl"] in ("old", "new"):
        print(" ".join(c["argv"][1:-1]))')
wait
uptime
