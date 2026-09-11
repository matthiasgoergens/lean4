import Lean

/-!
Experimental worker/wrapper pass for recursive functions carrying one pair of native scalars.
The original declaration and its aggregate ABI remain as a wrapper. This is deliberately narrow;
it is not an upstream-ready general aggregate scalarisation pass.
-/

meta section
open Lean Compiler LCNF

namespace SplitProd

register_option compiler.splitProd : Bool := {
  defValue := false
  descr := "enable the experimental scalar-pair worker transformation"
}

def scalar (e : Expr) : Bool :=
  [``USize, ``UInt64, ``UInt32, ``UInt16, ``UInt8].any e.isConstOf

def fields? (e : Expr) : Option (Expr × Expr) := do
  guard (e.isAppOfArity ``Prod 2)
  let args := e.getAppArgs
  let a := args[0]!
  let b := args[1]!
  guard (scalar a && scalar b)
  return (a, b)

partial def hasDirectSelfCall (code : Code .pure) (name : Name) (arity index : Nat) : Bool :=
  match code with
  | .let decl k =>
    let found := match decl.value with
      | .const fn _ args => fn == name && args.size >= arity &&
          (args[index]? matches some (.fvar _))
      | _ => false
    found || hasDirectSelfCall k name arity index
  | .fun decl k | .jp decl k =>
    hasDirectSelfCall decl.value name arity index || hasDirectSelfCall k name arity index
  | .cases c => c.alts.any fun alt => hasDirectSelfCall alt.getCode name arity index
  | .return .. | .jmp .. | .unreach .. => false

partial def redirect (code : Code .pure) (original worker : Name) (arity index : Nat)
    (a b : Expr) : CompilerM (Code .pure) := do
  match code with
  | .let decl k =>
    let k ← redirect k original worker arity index a b
    let .const name _ args := decl.value | return code.updateLet! decl k
    unless name == original && args.size >= arity do return code.updateLet! decl k
    let .fvar state := args[index]! | return code.updateLet! decl k
    let fst ← mkLetDecl `splitFst a (.proj ``Prod 0 state)
    let snd ← mkLetDecl `splitSnd b (.proj ``Prod 1 state)
    let args := args[:index].toArray ++ #[.fvar fst.fvarId, .fvar snd.fvarId] ++
      args[index + 1:].toArray
    let decl ← decl.updateValue (.const worker [] args)
    return .let fst (.let snd (code.updateLet! decl k))
  | .fun decl k | .jp decl k =>
    let decl ← decl.updateValue (← redirect decl.value original worker arity index a b)
    return code.updateFun! decl (← redirect k original worker arity index a b)
  | .cases c =>
    let alts ← c.alts.mapM fun alt =>
      return alt.updateCode (← redirect alt.getCode original worker arity index a b)
    return code.updateAlts! alts
  | .return .. | .jmp .. | .unreach .. => return code

def transform (decl : Decl .pure) : CompilerM (Array (Decl .pure)) := do
  unless decl.recursive do return #[decl]
  let .code code := decl.value | return #[decl]
  let candidates := decl.params.toList.zipIdx |>.filter fun (p, _) => (fields? p.type).isSome
  let [(state, index)] := candidates | return #[decl]
  let some (a, b) := fields? state.type | return #[decl]
  unless hasDirectSelfCall code decl.name decl.params.size index do return #[decl]
  let worker := decl.name ++ `_splitProd
  -- The suffix is reserved by this experimental pass; fail closed on a collision.
  if (← getEnv).contains worker then
    throwError "splitProd worker name collision: {worker}"
  let resultType ← code.inferType
  let fst ← mkParam `splitFst a false
  let snd ← mkParam `splitSnd b false
  let params := decl.params[:index].toArray ++ #[fst, snd] ++
    decl.params[index + 1:].toArray
  let body ← redirect code decl.name worker decl.params.size index a b
  -- Rebuild the input as a let, so the following stock simp pass can eliminate its projections.
  eraseParam state
  let pair : LetDecl .pure := {
    fvarId := state.fvarId, binderName := state.binderName, type := state.type
    value := .const ``Prod.mk [] #[.erased, .erased, fst.toArg, snd.toArg]
  }
  modifyLCtx fun ctx => ctx.addLetDecl pair
  let type ← mkForallParams params resultType
  let aux := { decl with name := worker, levelParams := [], params := params, type := type,
                         value := .code (.let pair body) }
  aux.saveMono
  let wrapper ← (do
    let params ← decl.params.mapM Internalize.internalizeParam
    let originalState := params[index]!
    let p ← mkLetDecl `splitFst a (.proj ``Prod 0 originalState.fvarId)
    let q ← mkLetDecl `splitSnd b (.proj ``Prod 1 originalState.fvarId)
    let args := (params[:index].toArray.map Param.toArg) ++ #[.fvar p.fvarId, .fvar q.fvarId] ++
      (params[index + 1:].toArray.map Param.toArg)
    let call ← mkAuxLetDecl (.const worker [] args)
    let value := .code (.let p (.let q (.let call (.return call.fvarId))))
    let wrapper := { decl with
      params := params
      value := value
      recursive := false
      inlineAttr? := if decl.noinlineAttr then decl.inlineAttr? else some .inline }
    wrapper.saveMono
    return wrapper : Internalize.InternalizeM .pure (Decl .pure)).run' {}
  trace[Compiler.saveMono] "splitProd transformed {decl.name}"
  return #[aux, wrapper]

def pass : Pass where
  name := `splitProd
  phase := .mono
  shouldAlwaysRunCheck := true
  run decls := do
    unless compiler.splitProd.get (← getOptions) do return decls
    decls.foldlM (init := #[]) fun acc decl => return acc ++ (← transform decl)

@[cpass] def install : PassInstaller :=
  PassInstaller.installAfter .mono `reduceArity (fun _ => pass)

end SplitProd
