#!/bin/bash
# Run on the benchmark machine from ~/qsort-pr/bench: build the 8 shuffled-layout binaries of qsortbench
# with each toolchain, in localhost/lean4-build (the image the toolchains were built in), into
# bins/old (origin/master f4856ef9cd, ~/qsort-pr/lean4-master) and bins/new (matthias/qsort-pdq
# 7d8ac86bab, ~/qsort-pr/lean4-branch).  The toolchain trees are mounted read-only.
cd "$(dirname "$0")" || exit 1
for pair in "old lean4-master" "new lean4-branch"; do
  set -- $pair
  rm --recursive --force "bins/$1" || exit 1
  nice ionice podman run --rm --userns=keep-id -v ~/qsort-pr/"$2":/t:ro -v "$PWD":/b:Z -w /b localhost/lean4-build \
    ./shuffled-build.sh /t/build/release/stage1/bin/lake 8 "bins/$1" || exit 1
done
