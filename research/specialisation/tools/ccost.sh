#!/bin/bash
# Run on the benchmark machine: time the C compile (leanc -O3 -DNDEBUG -c) of the C that stage 1 generated
# for a few modules that call Array.qsort, in each of the given trees (names after ~/lean4-qsort-,
# `master` for ~/lean4-qsort-master, `port` for ~/lean4-qsort), in randomised blocks (each block runs
# every module x tree cell once, in random order), pinned to CPU 46.  As the PR branch's
# measure/ccost.sh, with the trees as arguments.
#   Usage: ccost.sh BLOCKS TREE...
blocks=$1; shift
mods="Lean/Util/SortExprs Lean/Level Lean/Meta/Tactic/Grind/VarRename"
vols=(); names=()
for t in "$@"; do
  case $t in master) d=~/lean4-qsort-master ;; port) d=~/lean4-qsort ;; *) d=~/lean4-qsort-spec-$t ;; esac
  vols+=(-v "$d:/t/$t:ro,Z"); names+=("$t")
done
uptime
podman run --rm --userns=keep-id "${vols[@]}" localhost/lean4-build bash -c '
  blocks=$1; mods=$2; shift 2
  for blk in $(seq 1 $blocks); do
    for mod in $mods; do for tree in "$@"; do echo "$tree $mod"; done; done | shuf | while read tree mod; do
      s=$(date +%s%N)
      taskset --cpu-list 46 /t/port/build/release/stage1/bin/leanc -O3 -DNDEBUG -c /t/$tree/build/release/stage1/lib/temp/$mod.c -o /tmp/out.o || echo FAIL
      e=$(date +%s%N)
      echo "$blk $tree $mod $(( (e - s) / 1000000 )) $(stat -c %s /tmp/out.o)"
    done
  done' bash "$blocks" "$mods" "${names[@]}"
