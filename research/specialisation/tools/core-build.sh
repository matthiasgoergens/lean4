#!/bin/bash
# Run on the benchmark machine: for each variant V given, copy ~/lean4-qsort (the port's tree, with its
# build) to ~/lean4-qsort-spec-V unless that exists, install the files in ~/qsort-spec/core-variants/V/
# (Basic.lean, and Lemmas.lean or Cost.lean if there) into src/Init/Data/Array/QSort/, and build stage 1 as the PR branch's build.sh does
# (localhost/lean4-build, its ccache, -j32, nice/ionice), one variant after the other.
# Logs to ~/qsort-spec/core-logs/build-V.log.
mkdir -p ~/qsort-spec/core-logs || exit 1
for v in "$@"; do
  t=~/lean4-qsort-spec-$v
  src=~/qsort-spec/core-variants/$v/Basic.lean
  [ -f "$src" ] || { echo "no $src"; exit 1; }
  if [ ! -d "$t" ]; then
    cp -a ~/lean4-qsort "$t" || exit 1
  fi
  for f in ~/qsort-spec/core-variants/$v/*.lean; do
    cp "$f" "$t/src/Init/Data/Array/QSort/" || exit 1
  done
  log=~/qsort-spec/core-logs/build-$v.log
  start=$(date +%s)
  { uptime; nice ionice podman run --rm --userns=keep-id -v "$t":/w:Z -v ~/lean4-qsort-build/ccache:/ccache:Z \
      -e CCACHE_DIR=/ccache -w /w localhost/lean4-build \
      bash -c 'cmake --preset release -DUSE_GITHASH=OFF && make -C build/release -j32'; } > "$log" 2>&1
  rc=$?
  echo "build $v exit $rc after $(( $(date +%s) - start )) s" | tee -a "$log"
done
