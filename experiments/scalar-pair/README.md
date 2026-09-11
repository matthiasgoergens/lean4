Opt-in Lean 4.33.1 prototype for [scalarising recursive pair state](https://github.com/matthiasgoergens/lean4/issues/1).

Start with [SplitProd.lean](compiler-study/SplitProd.lean) (worker/wrapper and constructor placement), [MustSplitProd.lean](compiler-study/MustSplitProd.lean) (checked annotation), and [the annotation contract](compiler-study/ANNOTATIONS.md). The prototype supports one pair of native scalars and is disabled by default.

With Lean 4.33.1, `uv`, `nice` and `ionice` installed, run these commands separately from this directory:

```sh
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python compiler-study/build.py
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python -m unittest discover --start-directory compiler-study --pattern 'test_*.py'
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python compiler-study/test_contract.py
```

For fresh measurements, read [the protocol](compiler-study/DESIGN.md) and [the constructor-placement follow-up](compiler-study/REGRESSION.md). The runner writes new archives under `compiler-study/results/`; `verify.py` checks those archives. Keep builds and tests out of timed campaigns.

The [original evidence snapshot](https://github.com/matthiasgoergens/lean4/tree/3ba0f04652387a57937e9e35aeda2099b050938b/experiments/scalar-pair) retains full timing tables, raw observations, generated C/assembly, validation records and Kimi review. Those files are excluded from this review diff. Measurements concern synthetic workloads on one host, not application speedups.

Kimi reviewed a bounded source bundle, not the original 207-file PR or this revised diff.

AI assisted this research prototype and its tests. Human review and broader compiler validation remain necessary before upstream integration.
