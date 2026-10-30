#!/bin/bash
# Run on the benchmark machine: copy a lean4 tree with its build (cp -a keeps the timestamps make relies on)
# to a new directory unless it exists, then finish its stage 1 build the way the PR branch's
# build.sh does (localhost/lean4-build, its ccache, -j32, nice/ionice).  The source tree is not touched.
#   Usage: build-copy.sh SRC DST LOG
src=${1:?usage: $0 SRC DST LOG}
dst=${2:?usage: $0 SRC DST LOG}
log=${3:?usage: $0 SRC DST LOG}
if [ ! -d "$dst" ]; then
  nice ionice cp -a "$src" "$dst" || exit 1
fi
start=$(date +%s)
{ date; uptime; nice ionice podman run --rm --userns=keep-id -v "$dst":/w:Z -v ~/lean4-qsort-build/ccache:/ccache:Z \
    -e CCACHE_DIR=/ccache -w /w localhost/lean4-build \
    bash -c 'cmake --preset release -DUSE_GITHASH=OFF && make -C build/release -j32'; } > "$log" 2>&1
rc=$?
echo "build $dst exit $rc after $(( $(date +%s) - start )) s" | tee -a "$log"
exit $rc
