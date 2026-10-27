#!/usr/bin/env bash
# Elaborates ClientReviewRepros.lean the way the Lean repository's tests/elab/run_test.sh runs a
# test, with the toolchain under test's `lean` on PATH.  Each failing test prints one error; the
# exit status is 1 if any test fails.
here=$(cd "$(dirname "$0")" && pwd) || exit 1
command -v lean >/dev/null || { echo "run.sh: lean is not on PATH" >&2; exit 1; }
echo "### $(lean --version)"
cd "$here" || exit 1
lean --root=.. -DprintMessageEndPos=true -Dlinter.all=false -DElab.inServer=true \
  -Dcompiler.postponeCompile=false ClientReviewRepros.lean
status=$?
echo "### exit status $status"
exit "$status"
