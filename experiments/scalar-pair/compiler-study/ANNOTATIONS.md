The prototype now supports a deliberately brittle compiler contract: `must_split_prod`. Compilation fails if the annotated definition does not have the required scalar-pair worker transformation. This is a requirement, not an optimisation hint or a warning.

For an ordinary definition, including a `while` loop:

```lean
import MustSplitProd

set_option compiler.splitProd true

@[must_split_prod] def sum (n : USize) (seed : UInt64) : UInt64 := Id.run do
  let mut i : USize := 0
  let mut x := seed
  while i < n do
    x := x + i.toUInt64
    i := i + 1
  return x
```

For a `partial def`, use the equivalent attribute command after the definition:

```lean
partial def sumPair (n : USize) (s : USize × UInt64) : USize × UInt64 :=
  if s.1 < n then sumPair n (s.1 + 1, s.2 + 7) else s

attribute [must_split_prod] sumPair
```

Lean 4.33.1 applies a prefix attribute to a partial definition's temporary opaque declaration before compiling its executable recursive implementation. A prefix `@[must_split_prod] partial def ...` therefore fails explicitly with a missing-compilation-group diagnostic. No deferred or unavailable compiler result counts as success. Imported declarations cannot be retrospectively annotated, and local/scoped attribute forms are rejected. The plugin and attribute module use the legacy file format; importing them from a newer `module` file is currently rejected by Lean itself. Supporting the separate/deferred compilation workflow is future work for an upstream implementation.

The checked contract is deliberately precise. Starting at the annotated definition's saved mono declaration, follow referenced constants within its recorded mono compilation group. At least one reachable recursive declaration must exist. Every reachable declaration whose mono `recursive` flag is true must have evidence that this pass generated its worker and completed the following constructor-placement pass; none may retain an eligible scalar-pair parameter. A missed worker is an error, even when another worker in the group was successfully split. Recursive callees compiled in other groups are outside the contract. For mutual groups, all reachable members are included; this can be stricter than checking only helpers generated for one source definition.

The group is recorded by the pass, not guessed from a name prefix: while specialisations have names such as `_private.Init.While..._at_.sum...`, outside `sum`'s namespace. A previously compiled helper, or a user function named `_splitProd`, cannot manufacture pass evidence. The checker reads synchronous compiler extension state so asynchronous compilation must finish before inspection. It does not launch a second compilation.

This guarantees the specified transformation at the inspected mono representation. It does **not** guarantee that the body allocates nothing, that a reconstructed pair is never needed on a continuing path, that a partial application avoids its wrapper, that later compiler stages preserve a particular assembly shape, or that execution meets a timing bound. A stronger no-per-iteration-allocation contract needs a separate late-IR check. Passing the current contract on escaping state would not establish that stronger property.

The worker/wrapper technique generalises to any fixed finite number of fields: flatten the state into native parameters and reconstruct aggregate values where needed. This implementation still accepts exactly one pair of two native scalars. Three-field state intentionally fails the current contract. Generalisation must account for nested products, object ownership, register pressure, stack spills and profitability; it is not a promise that arbitrarily large state becomes faster.

Validation is retained in [contract-validation.json](contract-validation.json), produced by [test_contract.py](test_contract.py). Nineteen compiler fixtures passed: five successful cases (pair recursion, ordinary/nested while, private while and synchronous compilation), thirteen explicit contract failures, and one separate module-format import rejection. Failures cover disabled optimisation, Nat-index state, mixed objects, three fields, two pairs, non-recursive code, unrelated successful helpers, a fake worker suffix, one missed loop among two, noncomputable declarations, a theorem, an imported declaration and the unsupported partial-prefix form. The tests request `compiler.check=true` and reject compiler panics independently of process status.

Build the core plugin with build.py, then run:

```sh
nice ionice uv run --offline --cache-dir /tmp/faster-lean-uv-cache python compiler-study/test_contract.py
```

All twelve existing Python tests also pass. Current baseline/enabled generated C for both the scalar and byte kernels is byte-identical to the retained pre-annotation C, so this change adds compiler evidence/checking without changing those kernels. No additional performance observations are claimed.

Two abandoned implementation approaches matter for future work. A direct `getMonoDecl?` lookup from a prefix partial attribute runs before the real implementation exists. Attempting to force compilation there compiled the temporary opaque body; forcing a second compilation after the definition instead triggered C-emission index panics, sometimes with status zero. Both approaches were removed. The current checker only reads completed state and errors when it is unavailable. Bounded source review confirmed the partial-definition scheduling rule and the intentionally broad compilation-group scope; the mixed-loop negative test checks the all-workers requirement.

Upstream sequencing remains: local development and validation may precede an issue; the issue must precede a PR. Lean's [contribution guidelines](https://github.com/leanprover/lean4/blob/master/CONTRIBUTING.md#pr-submission), checked on 11 September 2026, require disclosure of AI assistance and human checking before submission, and do not welcome solely AI-authored PRs. No upstream issue or PR has been submitted for this work.
