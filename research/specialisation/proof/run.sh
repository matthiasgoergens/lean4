#!/bin/bash
# Run on the benchmark machine: elaborate ~/qsort-spec/proof/Test.lean with the port's stage 1.
cd ~/qsort-spec/proof || exit 1
podman run --rm --userns=keep-id -v ~/lean4-qsort:/w:ro,Z -v ~/qsort-spec/proof:/p:Z -w /p localhost/lean4-build \
  bash -c 'LEAN_PATH=/w/build/release/stage1/lib/lean timeout 600 /w/build/release/stage1/bin/lean Test.lean'
echo "exit $?"
