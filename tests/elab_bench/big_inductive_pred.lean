import Lean
open Lean Elab Command

/-!
A benchmark for an inductive predicate with many constructors that each have many fields, the shape
of generated developments such as the one in #6820. The relation `R` has `n` constructors, each
binding `k` variables and `k - 1` hypotheses that chain them together, for example with `k = 3`:

```
| c5 {x0 x1 x2 : Nat} (h0 : R x0 x1) (h1 : R x1 x2) : R x0 (x2 + 5)
```

Most of the time goes into the kernel checking `R` and the auxiliary inductive `R.below`, in
particular into building their recursors' computation rules.
-/

elab "big_relation" : command => do
  let bench := (← IO.getEnv "TEST_BENCH") == some "1"
  let (n, k) := if bench then (200, 10) else (20, 4)
  let xs := (List.range k).toArray.map fun j => mkIdent (.mkSimple s!"x{j}")
  let ts : Array Term := xs.map (⟨·.raw⟩)
  let r := mkIdent `R
  let ctors ← (List.range n).toArray.mapM fun i => do
    let hyps ← (List.range (k - 1)).toArray.mapM fun j =>
      `(Lean.Parser.Term.bracketedBinderF| ($(mkIdent (.mkSimple s!"h{j}")) : $r $(ts[j]!) $(ts[j+1]!)))
    `(Lean.Parser.Command.ctor|
      | $(mkIdent (.mkSimple s!"c{i}")):ident {$xs* : Nat} $hyps* : $r $(ts[0]!) ($(ts[k - 1]!) + $(quote i)))
  elabCommand (← `(inductive $r:ident : Nat → Nat → Prop where
    | $(mkIdent `refl):ident (x : Nat) : $r x x
    $ctors:ctor*))

big_relation
