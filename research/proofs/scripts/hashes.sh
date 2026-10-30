#!/bin/bash
# Reproduces baseline-hashes.txt: sorttest, then pdq on `pair` keys (N=100000) for eight patterns.
cd "$(dirname "$0")/../../sorts" || exit 1
nice ionice .lake/build/bin/sorttest || exit 1
for p in random dups4 organ nearly pathological tripledesc runs16 sortedtail; do
  printf '%s ' "$p"
  nice ionice .lake/build/bin/sorts pdq pair "$p" 100000 0 nocheck || exit 1
done
