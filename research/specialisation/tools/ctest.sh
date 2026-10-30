#!/bin/bash
# Run on the benchmark machine: ctest of the stage 1 build in ~/lean4-qsort-spec-VARIANT, inside
# localhost/lean4-build, with at most 32 jobs, nice/ionice.  Further arguments go to ctest.
#   Usage: ctest.sh VARIANT [ctest args...]
v=$1; shift
start=$(date +%s)
nice ionice podman run --rm --userns=keep-id -v ~/lean4-qsort-spec-$v:/w:Z -w /w/build/release/stage1 localhost/lean4-build \
  ctest -j32 --output-on-failure "$@"
rc=$?
echo "ctest exit $rc after $(( $(date +%s) - start )) s"
exit $rc
