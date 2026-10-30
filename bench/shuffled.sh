#!/usr/bin/env bash
# Runs one of the shuffled builds in BIN_DIR (from shuffled-build.sh; adapted from the research harness b629463), chosen at random, with the
# remaining arguments, and prints `bin=SEED` before its output on the same line.
#   Usage: ./shuffled.sh BIN_DIR ARGS...
set -u
dir=${1:?usage: $0 BIN_DIR ARGS...}
shift
bins=("$dir"/qsortbench-*)
bin=${bins[RANDOM % ${#bins[@]}]}
out=$("$bin" "$@")
status=$?
echo "bin=${bin##*-} $out"
exit $status
