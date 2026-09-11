This is a fork-local research draft pending human review. The implementation, tests and draft text received generative-AI assistance. Automated reviews do not satisfy upstream Lean's requirement for manual checking.

The earlier independent Codex invocation found a build-admission defect, fixed before this package was prepared; the retained report and disposition are in compiler-study/audit.md. A bounded delegated review checked the annotation's partial-definition scheduling and compilation-group scope. The nineteen compiler fixtures include a mixed supported/unsupported loop case.

A direct Kimi review of the implementation, annotation, harness and proposed issue/PR text is in progress. Its final findings and verified disposition will be recorded here before publication approval. No approval or correctness certification is implied by this draft.

Packaging validation used the pinned Lean 4.33.1 toolchain from this experiment's directory: build.py, twelve Python tests, nineteen compiler contract fixtures and verification of all eight historical archives passed. This validates the standalone experiment's packaging, not a production compiler change on upstream master.
