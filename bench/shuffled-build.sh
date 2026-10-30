#!/usr/bin/env bash
# Builds K copies of `qsortbench`, each linked with its functions in a different shuffled order
# (`lake -Kshuffle=SEED`, seeds 1..K), into OUT_DIR/qsortbench-SEED, with the toolchain whose `lake`
# is LAKE (a stage 1 build's bin/lake).  Run it inside the build container (see build-bins.sh).
#   Usage: ./shuffled-build.sh LAKE K OUT_DIR
set -u
lake=${1:?usage: $0 LAKE K OUT_DIR}
k=${2:?usage: $0 LAKE K OUT_DIR}
out=${3:?usage: $0 LAKE K OUT_DIR}
cd "$(dirname "$0")" || exit 1
mkdir --parents "$out" || exit 1
rm --recursive --force .lake || exit 1
for seed in $(seq 1 "$k"); do
  "$lake" -R -Kshuffle="$seed" build qsortbench > /dev/null || exit 1
  cp .lake/build/bin/qsortbench "$out/qsortbench-$seed" || exit 1
done
sha256sum "$out"/qsortbench-*
