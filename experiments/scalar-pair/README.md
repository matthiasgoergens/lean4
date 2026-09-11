This is a standalone, opt-in research experiment for review in a Lean fork. It does not change Lean's production compiler or its CI targets.

Read [the findings and complete timing tables](compiler-study/README.md), [the checked annotation contract](compiler-study/ANNOTATIONS.md), and [review findings](REVIEW.md).

The experiment is tested with Lean 4.33.1, independently of the surrounding Lean checkout. The build driver explicitly selects that installed toolchain. Ensure it is installed and `uv`, `nice` and `ionice` are available, then run these commands separately from this directory:

```sh
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python compiler-study/build.py
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python -m unittest discover --start-directory compiler-study --pattern 'test_*.py'
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python compiler-study/test_contract.py
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python compiler-study/verify.py
```

Timing commands are in the findings document. Do not build or run other tests during timed campaigns. Each campaign creates a new archive; historical observations are retained unchanged. No measurements on the current upstream compiler, general finite-arity implementation, whole-application speedup or layout-seed replication are claimed.

Historical commit identifiers and absolute paths in the archived reports refer to the local investigation from which this snapshot was prepared. Retained source snapshots, hashes, commands and raw observations provide the reproduction record. See PROVENANCE.json for the prepared file manifest. The fork-local draft is pending human review; AI assistance is disclosed in the companion issue and PR text.
