#!/bin/bash
# Run on the benchmark machine from ~/qsort-pr/bench: wait until the 5-minute load average is below
# THRESHOLD (checked every 180 s, for at most MAX_HOURS; every check is logged to OUT/wait.log),
# then run round 2 (random keys and small arrays, 18 blocks: 6 shards of 3 on CPUs 40-45) and then
# 10 io_compute pairs, logging the load before and after each.  Exits 3 if the load never dropped.
#   Usage: ./quiet-run.sh OUT THRESHOLD MAX_HOURS
out=${1:?usage: $0 OUT THRESHOLD MAX_HOURS}
threshold=${2:?usage: $0 OUT THRESHOLD MAX_HOURS}
hours=${3:?usage: $0 OUT THRESHOLD MAX_HOURS}
cd "$(dirname "$0")" || exit 1
[ -e "$out" ] && { echo "$out exists"; exit 1; }
mkdir --parents "$out" || exit 1
deadline=$(( $(date +%s) + hours * 3600 ))
while :; do
  read -r l1 l5 l15 _ < /proc/loadavg
  echo "$(date --iso-8601=seconds) load $l1 $l5 $l15" >> "$out/wait.log"
  if awk -v l="$l5" -v t="$threshold" 'BEGIN { exit !(l < t) }'; then break; fi
  if (( $(date +%s) >= deadline )); then echo "gave up: load never below $threshold" >> "$out/wait.log"; exit 3; fi
  sleep 180
done
{ echo "blocks start $(date --iso-8601=seconds)"; uptime; } >> "$out/load.log"
./shards.py 2 "$out/blocks" 3 40 41 42 43 44 45 > "$out/shards.out" 2>&1
rc=$?
{ echo "blocks end $(date --iso-8601=seconds) exit $rc"; uptime; } >> "$out/load.log"
[ $rc -eq 0 ] || exit 1
{ echo "io start $(date --iso-8601=seconds)"; uptime; } >> "$out/load.log"
./io-compute.sh "$out/io" 10 > "$out/io.out" 2>&1
rc=$?
{ echo "io end $(date --iso-8601=seconds) exit $rc"; uptime; } >> "$out/load.log"
exit $rc
