#!/bin/bash
# Run on the benchmark machine from ~/qsort-pr/bench: compile tests/compile_bench/io_compute.lean with each
# toolchain the way tests/compile_bench/run_test.sh does (lean --c, leanc -O3 -DNDEBUG, linked
# against that toolchain's libleanshared with an rpath to it), then run the two binaries in PAIRS
# pairs, the order within each pair random, pinned to CPU 40, each under
# `sudo perf stat -e task-clock,instructions,cycles,instructions:u,cycles:u` (the program itself
# runs as this user, through setpriv, which execs without forking).  Writes OUT_DIR.
#   Usage: ./io-compute.sh OUT_DIR PAIRS
out=${1:?usage: $0 OUT_DIR PAIRS}
pairs=${2:?usage: $0 OUT_DIR PAIRS}
cd "$(dirname "$0")" || exit 1
[ -e "$out" ] && { echo "$out exists"; exit 1; }
mkdir --parents "$out" || exit 1
out=$(realpath "$out")
root=$HOME/qsort-pr
cmp "$root/lean4-master/tests/compile_bench/io_compute.lean" "$root/lean4-branch/tests/compile_bench/io_compute.lean" || exit 1
cp "$root/lean4-master/tests/compile_bench/io_compute.lean" "$out/" || exit 1
for pair in "old lean4-master" "new lean4-branch"; do
  set -- $pair
  t=$root/$2/build/release/stage1
  nice ionice podman run --rm --userns=keep-id -v "$root/$2":"$root/$2":ro -v "$out":"$out":Z -w "$out" localhost/lean4-build \
    bash -c "$t/bin/lean --c=io_compute-$1.c -Dcompiler.postponeCompile=false io_compute.lean && $t/bin/leanc -O3 -DNDEBUG -o io_compute-$1 io_compute-$1.c -leanshared -lleanshared -Wl,-rpath,$t/lib/lean" || exit 1
  ldd "$out/io_compute-$1" | grep leanshared >> "$out/ldd.txt" || exit 1
done
sha256sum "$out"/io_compute-old "$out"/io_compute-new "$out"/io_compute-old.c "$out"/io_compute-new.c \
  "$root"/lean4-master/build/release/stage1/lib/lean/libleanshared.so "$root"/lean4-branch/build/release/stage1/lib/lean/libleanshared.so \
  > "$out/fingerprints.txt" || exit 1
tmp=/tmp/qsort-pr-io
mkdir --parents "$tmp" || exit 1
printf 'pair\tposition\timpl\tstart\tloadavg1_before\tloadavg1_after\texit\toutput\n' > "$out/runs.tsv"
for p in $(seq 1 "$pairs"); do
  if (( RANDOM % 2 )); then order="old new"; else order="new old"; fi
  pos=0
  for w in $order; do
    before=$(cut -d ' ' -f 1 /proc/loadavg)
    start=$(date --iso-8601=seconds)
    res=$(sudo --non-interactive perf stat -x , -e task-clock,instructions,cycles,instructions:u,cycles:u \
      -o "$out/perf-$p-$w.csv" -- setpriv --reuid="$(id -u)" --regid="$(id -g)" --init-groups \
      env TMPDIR="$tmp" taskset --cpu-list 40 "$out/io_compute-$w" 2>&1)
    rc=$?
    after=$(cut -d ' ' -f 1 /proc/loadavg)
    rm --force "$tmp"/* || exit 1
    printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' "$p" "$pos" "$w" "$start" "$before" "$after" "$rc" "$(echo "$res" | tr '\n' ';')" >> "$out/runs.tsv"
    pos=$((pos + 1))
  done
  echo "pair $p/$pairs done" >&2
done
