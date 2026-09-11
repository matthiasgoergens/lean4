import SplitProd

/-!
Checked compiler contract for this prototype, scoped to one definition and its generated workers.
This requires actual scalar-pair worker splitting, not allocation freedom or a timing bound.
-/

meta section
open Lean Compiler LCNF

namespace SplitProd.Contract

partial def constants (code : Code .pure) (names : NameSet := {}) : NameSet :=
  match code with
  | .let decl k =>
    let names := match decl.value with
      | .const name _ _ => names.insert name
      | _ => names
    constants k names
  | .fun decl k | .jp decl k => constants k (constants decl.value names)
  | .cases c => c.alts.foldl (fun names alt => constants alt.getCode names) names
  | .return .. | .jmp .. | .unreach .. => names

def check (root : Name) : CoreM Unit := do
  unless compiler.splitProd.get (← getOptions) do
    throwError "[must_split_prod] {root}: compiler.splitProd is disabled"
  let completed := completedWorkers.getState (← getEnv)
  let mono := monoExt.getState (← getEnv)
  let some group := compilationGroups.getState (← getEnv) |>.find? root |
    throwError "[must_split_prod] {root}: no completed compilation group; \
      apply the attribute after the definition and disable deferred compilation"
  let mut pending := [root]
  let mut visited : NameSet := {}
  let mut count := 0
  while let name :: rest := pending do
    pending := rest
    if visited.contains name then continue
    visited := visited.insert name
    let some decl := mono.find? name |
      throwError "[must_split_prod] {root}: no compiled mono body for {name}; \
        apply `attribute [must_split_prod] {root}` after the definition and disable deferred compilation"
    let .code body := decl.value |
      throwError "[must_split_prod] {root}: unavailable compiled body for {name}"
    trace[Compiler.saveMono] "must_split_prod inspected {name}, recursive={decl.recursive}, refs={(constants body).toList}"
    if decl.recursive then
      unless completed.contains name do
        throwError "[must_split_prod] {root}: recursive worker {name} was not split; \
          this prototype requires exactly one pair of native scalars and a direct self-call"
      if decl.params.any (fun p => (fields? p.type).isSome) then
        throwError "[must_split_prod] {root}: worker {name} still has scalar-pair parameters"
      count := count + 1
    for callee in (constants body).toList do
      if group.contains callee then pending := callee :: pending
  if count == 0 then
    throwError "[must_split_prod] {root}: no reachable split recursive worker was found"

initialize
  registerBuiltinAttribute {
    name := `must_split_prod
    descr := "require scalar-pair splitting of this definition's recursive workers"
    applicationTime := .afterCompilation
    add := fun decl stx kind => do
      Attribute.Builtin.ensureNoArgs stx
      unless kind == .global do throwError "[must_split_prod] must be global"
      if (← getEnv).getModuleIdxFor? decl |>.isSome then
        throwError "[must_split_prod] must be checked in the defining module"
      withoutExporting <| check decl
  }

end SplitProd.Contract
