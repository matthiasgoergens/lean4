#!/usr/bin/env bash
# Checks the proof port: no gaps, only standard axioms, unchanged public statements, build and tests.
# Cutoff-24 variant: the axiom filter accepts any subset of the standard three (verify-port.sh's
# regex counted a lone [propext] as foreign), and qsortComparisons_le, whose constants changed on
# purpose, is printed old and new when it differs.
set -u
cd "$(dirname "$0")/../../sorts" || exit 1
echo "== gaps"
grep --line-number --extended-regexp '\bsorry\b|^axiom|native_decide|\badmit\b' Sorts/*.lean
echo "== axioms outside the standard three, per file"
for f in PdqLemmas PdqSorted PdqCost; do
  echo "$f: $(nice ionice lake env lean "Sorts/$f.lean" 2>&1 | grep --count 'axioms') #print axioms lines"
done
for f in PdqLemmas PdqSorted PdqCost; do
  n=$(nice ionice lake env lean "Sorts/$f.lean" 2>&1 | grep 'axioms' \
      | grep --invert-match --count --extended-regexp \
        'axioms: \[((propext|Classical\.choice|Quot\.sound)(, )?)*\]$|does not depend on any axioms')
  echo "$f: $n"
done
echo "== statements against 764d90a"
statement() {  # file-content theorem-name
  grep --after-context=6 "theorem $2 " <<< "$1" | sed '/:= by/q; /:=$/q' | tr -s ' \n' ' '
}
old=$(git show 764d90a:sorts/Sorts/PdqLemmas.lean; git show 764d90a:sorts/Sorts/PdqSorted.lean; git show 764d90a:sorts/Sorts/PdqCost.lean)
new=$(cat Sorts/PdqLemmas.lean Sorts/PdqSorted.lean Sorts/PdqCost.lean)
for t in qsort_perm size_qsort getElem_qsort_of_not_mem mem_qsort qsortOrd_perm size_qsortOrd \
         mem_qsortOrd "qsort_sorted'" qsort_sorted qsortOrd_sorted qsortComparisons_le; do
  a=$(statement "$old" "$t"); b=$(statement "$new" "$t")
  if [ -n "$a" ] && [ "$a" = "$b" ]; then echo "same: $t"; else echo "DIFFERS: $t"; echo "  old: $a"; echo "  new: $b"; fi
done
echo "== build and tests"
nice ionice lake build Sorts sorts sorttest 2>&1 | tail -1 || exit 1
.lake/build/bin/sorttest
