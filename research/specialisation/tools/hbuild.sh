#!/bin/bash
# Run on the benchmark machine: lake build the harness in ~/qsort-spec/sorts inside localhost/lean-bench
# (Lean v4.34.1; the toolchain is kept in ~/qsort-spec/elan-toolchains between runs).
# Arguments go to the container's command line, default `lake build sorts`.
mkdir -p ~/qsort-spec/elan-toolchains || exit 1
[ $# -eq 0 ] && set -- lake build sorts
nice ionice podman run --rm -v ~/qsort-spec:/w:Z -v ~/qsort-spec/elan-toolchains:/root/.elan/toolchains:Z \
  -w /w/sorts localhost/lean-bench "$@"
