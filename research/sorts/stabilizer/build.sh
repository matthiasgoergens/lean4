#!/usr/bin/env bash
# Builds `sorts` three ways, inside the image localhost/sorts-stabilizer (Lean 4.34.1, LLVM 21,
# Stabilizer), from a fresh copy of the sorts sources:
#
#   lake/sorts     Lake's own build (Lean's bundled clang, -O3, static Lean runtime): the reference.
#   native/sorts   the same Lean-generated C through Stabilizer's driver `szc` without -R: clang 21,
#                  llvm-link of all modules, opt -O3, llc -O3 with frame pointers.
#   stab/sorts     the same, plus `szc -Rcode`: every function of the Lean-generated C (Main and the
#                  Sorts modules) is registered with Stabilizer's runtime and relocated at run time.
#
# Both szc builds link Lean's runtime and core library as the release's libleanshared.so, which
# stays native (uninstrumented).  OUT/leanlib holds a copy of it, so that the binaries also run
# outside the image, on any host with a glibc at least as new as Ubuntu 24.04's.  Run them with
#   LD_LIBRARY_PATH=OUT/stabilizer:OUT/leanlib
# and, for stab/sorts, STABILIZER_CODE_MODE=retained (see Stabilizer's README;
# STABILIZER_REPORT=1 prints the epoch count at exit).
#
#   Usage: build.sh SORTS_SRC STAB_SRC OUT
#     SORTS_SRC  the sorts Lake project (only its sources are copied; .lake is ignored)
#     STAB_SRC   a Stabilizer checkout; it is copied to OUT/stabilizer and built there as a
#                release build, with Heap-Layers and DieHard taken from /opt/stabilizer
#     OUT        a new directory
set -u
src=${1:?usage: $0 SORTS_SRC STAB_SRC OUT}
stab_src=${2:?usage: $0 SORTS_SRC STAB_SRC OUT}
out=${3:?usage: $0 SORTS_SRC STAB_SRC OUT}
mkdir "$out" || exit 1
out=$(cd "$out" && pwd) || exit 1
log=$out/build.log
step() { echo "+ $*" >> "$log"; "$@" >> "$log" 2>&1 || { echo "FAILED: $*" >&2; tail -30 "$log" >&2; exit 1; }; }

{
  echo "date: $(date --utc +%FT%TZ)"
  echo "lean: $(lean --version)"
  echo "clang: $(clang --version | head -1)"
  echo "sorts source: $src"
  echo "stabilizer source: $stab_src ($(git -C "$stab_src" rev-parse HEAD 2>/dev/null || echo 'not a git checkout'))"
  git -C "$stab_src" status --short 2>/dev/null | sed 's/^/  dirty: /'
} > "$log"

# Stabilizer, release build (no debug output, no assertions).
step cp --recursive "$stab_src" "$out/stabilizer"
stab=$out/stabilizer
for dep in Heap-Layers DieHard; do
  [ -e "$stab/$dep" ] || step cp --recursive "/opt/stabilizer/$dep" "$stab/$dep"
done
step make -C "$stab" clean
step env CPLUS_INCLUDE_PATH=/usr/lib/llvm-21/include make -C "$stab" release

# Lake's build, which also generates the C.
step mkdir "$out/src"
tar --create --directory "$src" --exclude ./.lake . | tar --extract --directory "$out/src" || exit 1
(cd "$out/src" && step lake build sorts) || exit 1
lean_prefix=$(lean --print-prefix) || exit 1
step mkdir "$out/lake" "$out/native" "$out/stab" "$out/bc" "$out/leanlib"
step cp "$lean_prefix"/lib/lean/libleanshared.so "$lean_prefix"/lib/lean/libleanshared_1.so \
  "$lean_prefix"/lib/lean/libleanshared_2.so "$lean_prefix"/lib/lean/libInit_shared.so "$out/leanlib/"
step cp "$out/src/.lake/build/bin/sorts" "$out/lake/sorts"

# The modules Lake links into sorts, in its order.
mapfile -t objects < <(grep --only-matching '[^"]*\.c\.o\.export' "$out/src/.lake/build/bin/sorts.rsp")
[ "${#objects[@]}" -gt 0 ] || { echo "no objects in sorts.rsp" >&2; exit 1; }

# leanc's compile flags (`leanc --print-cflags` and Lake's -O3 -DNDEBUG -DLEAN_EXPORTING), as far
# as they mean something to the szc pipeline: -ffunction-sections and -fdata-sections do not
# reach llc, which does the code generation.
cflags=(-O3 -I "$lean_prefix/include" -f stack-clash-protection -f fp-contract=off -f PIC
        -f visibility=hidden -D NDEBUG -D LEAN_EXPORTING)
bcs=()
for object in "${objects[@]}"; do
  c=${object%.o.export}
  rel=${c#"$out/src/.lake/build/ir/"}
  bc=$out/bc/${rel//\//.}.bc.o
  step "$stab/szc" -v "${cflags[@]}" -c "$c" -o "$bc"
  bcs+=("$bc")
done

link=(-L "$lean_prefix/lib/lean" -l leanshared)
step "$stab/szc" -v -O3 "${bcs[@]}" "${link[@]}" -o "$out/native/sorts"
step "$stab/szc" -v -O3 -Rcode "${bcs[@]}" "${link[@]}" -o "$out/stab/sorts"
step sh "$stab/tests/Harness/check-instrumentation.sh" "$out/stab/sorts"

{
  echo "lean prefix: $lean_prefix"
  (cd "$out" && sha256sum lake/sorts native/sorts stab/sorts stabilizer/libstabilizer.so \
     stabilizer/LLVMStabilizer.so leanlib/*.so src/.lake/build/ir/*.c src/.lake/build/ir/Sorts/*.c)
} > "$out/manifest.txt"
echo "built: $out/{lake,native,stab}/sorts"
