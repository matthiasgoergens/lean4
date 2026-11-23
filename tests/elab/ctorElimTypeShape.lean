import Lean
open Lean Meta Elab Command

/-!
Checks, with the kernel, that `T.ctorElimType` at a variable index is definitionally equal to the
nested `cond` that `mkNatLookupTable` builds over its values at the numerals, for enumerations of 2
to 17 constructors and for types with parameters, indices and universe parameters. Terms written
against the unfolding of `ctorElimType` at a variable index rely on this.
-/

/--
Adds the theorem `T.ctorElimType_shape : ∀ params motive i, T.ctorElimType i = <table>` with the
proof `Eq.refl`, so the kernel checks the definitional equality.
-/
def checkCtorElimTypeShape (indName : Name) : MetaM Unit := do
  let info ← getConstInfoInduct indName
  let c ← getConstVal (indName ++ `ctorElimType)
  let f := mkConst c.name (c.levelParams.map mkLevelParam)
  forallTelescope c.type fun xs sort => do
    let i := xs.back!
    let es ← (List.range info.numCtors).toArray.mapM fun j =>
      whnf (mkAppN f (xs.pop.push (mkRawNatLit j)))
    let lhs := mkAppN f xs
    let rhs ← mkNatLookupTable i sort es
    addDecl <| .thmDecl {
      name := indName ++ `ctorElimType_shape
      levelParams := c.levelParams
      type := ← mkForallFVars xs (← mkEq lhs rhs)
      value := ← mkLambdaFVars xs (← mkEqRefl lhs)
    }

elab "enumerations_up_to_17" : command => do
  for n in [2:18] do
    let ctors ← (List.range n).toArray.mapM fun j =>
      `(Lean.Parser.Command.ctor| | $(mkIdent (.mkSimple s!"c{j}")):ident)
    elabCommand (← `(inductive $(mkIdent (.mkSimple s!"E{n}")):ident where $ctors:ctor*))
    liftTermElabM <| checkCtorElimTypeShape (.mkSimple s!"E{n}")

enumerations_up_to_17

inductive Vec (α : Type) : Nat → Type where
  | nil : Vec α 0
  | cons {n} : α → Vec α n → Vec α (n + 1)

inductive Poly (α : Type u) (β : Sort v) where
  | a (x : α)
  | b
  | c (x y : α) (f : β → α)

inductive Tree : Type where
  | leaf
  | node (l r : Tree)
  | many (ts : List Tree)

run_meta checkCtorElimTypeShape ``Vec
run_meta checkCtorElimTypeShape ``Poly
run_meta checkCtorElimTypeShape ``Tree
