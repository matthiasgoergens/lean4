#!/bin/bash
# Run on the benchmark machine: for each harness module NS given (Sorts/NS.lean in ~/qsort-spec/sorts),
# compile it and a one-call-site probe (`NS.qsort xs (· < ·)` on `Nat`) with Lean v4.34.1 and print the
# C bytes of the probe per helper family, and the number of calls of the recursion and of
# `partitionM` inside the recursion's body.
cd ~/qsort-spec/sorts || exit 1
mods=("$@")
for m in "${mods[@]}"; do
  printf "import Sorts.$m\n\ndef f (xs : Array Nat) : Array Nat := $m.qsort xs (· < ·)\n" > probe/S$m.lean
done
targets=$(printf "Sorts.%s " "${mods[@]}")
nice ionice podman run --rm -v ~/qsort-spec-dev:/w:Z -v ~/qsort-spec/elan-toolchains:/root/.elan/toolchains:Z -w /w/sorts \
  localhost/lean-bench bash -c "lake build $targets 2>&1 | grep -B2 -A12 'error' | head -40; for m in $*; do LEAN_PATH=.lake/build/lib/lean lean -c probe/S\$m.c probe/S\$m.lean || echo FAIL \$m; done"
for m in "${mods[@]}"; do
  python3 - "$m" <<'PY'
import re, sys
m = sys.argv[1]
src = open(f"probe/S{m}.c").read()
starts = [(x.start(), x.group(1)) for x in re.finditer(r"^LEAN_EXPORT [^\n]*? (l_\w+)\([^\n]*\)\{$", src, re.M)]
starts.append((len(src), None))
fam = {}
rec = part = 0
for (s, n), (e, _) in zip(starts, starts[1:]):
    mm = re.match(rf"l_{m}_([A-Za-z0-9]+)", n)
    k = mm.group(1) if mm else "other"
    fam[k] = fam.get(k, 0) + e - s
    if n.startswith(f"l_{m}_sortCoreM") or n.startswith(f"l_{m}_sortM"):
        body = src[s:e]
        rec += len(re.findall(rf"l_{m}_sort(?:Core)?M___at___\w*?___redArg\(", body)) - 1
        part += len(re.findall(rf"l_{m}_partitionM___at___\w*?___redArg\(", body))
tot = sum(fam.values())
print(f"{m}: total {tot}  " + "  ".join(f"{k} {v}" for k, v in sorted(fam.items(), key=lambda x: -x[1])) + f"  | recursive calls {rec}, partitionM calls {part}")
PY
done
