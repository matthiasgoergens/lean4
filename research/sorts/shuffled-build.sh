#!/usr/bin/env bash
# Builds K copies of `sorts`, each linked with its functions in a different shuffled order
# (`lake -Kshuffle=SEED`, seeds 1..K), into OUT_DIR/sorts-SEED, then restores the plain build.
#   Usage: ./shuffled-build.sh K OUT_DIR
set -u
k=${1:?usage: $0 K OUT_DIR}
out=${2:?usage: $0 K OUT_DIR}
cd "$(dirname "$0")" || exit 1
mkdir --parents "$out" || exit 1
for seed in $(seq 1 "$k"); do
  lake -R -Kshuffle="$seed" build sorts > /dev/null || exit 1
  cp .lake/build/bin/sorts "$out/sorts-$seed" || exit 1
done
lake -R build sorts > /dev/null || exit 1
sha256sum "$out"/sorts-*
