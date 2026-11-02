/-
Copyright (c) 2022 Microsoft Corporation. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Leonardo de Moura
-/
module

prelude
public import Lean.Compiler.LCNF.PassManager
public import Lean.Compiler.LCNF.PublicDeclsExt
import Lean.Compiler.InitAttr
import Lean.Compiler.ExportAttr

public section

namespace Lean.Compiler.LCNF

-- The following extensions are per-phase as e.g. a declaration may be inlineable in the mono phase
-- because it directly unfolds to a `_redArg` call, but making its body in the base phase available
-- as well may lead to opportunistic inlining there, exposing references to declarations that we did
-- not export, leading to compilation errors. Ensuring those declarations are exported as well would
-- be possible, but would mean more information than intended is exported, potentially leading to
-- surprising rebuilds.

/--
Set of public declarations whose base bodies should be exported to other modules
-/
private builtin_initialize baseTransparentDeclsExt : EnvExtension (List Name × NameSet) ← mkOrderedDeclSetExt
/--
Set of public declarations whose mono bodies should be exported to other modules
-/
private builtin_initialize monoTransparentDeclsExt : EnvExtension (List Name × NameSet) ← mkOrderedDeclSetExt
/--
Set of public declarations whose impure bodies should be exported to other modules
-/
private builtin_initialize impureTransparentDeclsExt : EnvExtension (List Name × NameSet) ← mkOrderedDeclSetExt

private def getTransparencyExt : Phase → EnvExtension (List Name × NameSet)
  | .base => baseTransparentDeclsExt
  | .mono => monoTransparentDeclsExt
  | .impure => impureTransparentDeclsExt


def isDeclTransparent (env : Environment) (phase : Phase) (declName : Name) : Bool := Id.run do
  if !env.header.isModule then
    return true
  let (_, map) := getTransparencyExt phase |>.getState env
  map.contains declName

def setDeclTransparent (env : Environment) (phase : Phase) (declName : Name) : Environment :=
  if isDeclTransparent env phase declName then
    env
  else
    getTransparencyExt phase |>.modifyState env fun s =>
      (declName :: s.1, s.2.insert declName)

abbrev AbstractDeclExtState (pu : Purity) (β : Purity → Type) := PHashMap Name (β pu)

private def sortedEntries (s : AbstractDeclExtState pu β) (lt : β pu → β pu → Bool) : Array (β pu) :=
  let decls := s.foldl (init := #[]) fun ps _ v => ps.push v
  decls.qsort lt

private def replayFn (phase : Phase) : ReplayFn (AbstractDeclExtState phase.toPurity β) :=
  fun oldState newState _ otherState =>
    PersistentHashMap.foldlNewEntries (·.insert · ·) newState oldState otherState

private def statsFn (state : AbstractDeclExtState pu β) : Format :=
  let numEntries := state.foldl (init := 0) (fun count _ _ => count + 1)
  format "number of local entries: " ++ format numEntries

abbrev DeclExtState (pu : Purity) := AbstractDeclExtState pu Decl

private abbrev declLt (a b : Decl pu) :=
  Name.quickLt a.name b.name

private abbrev findDeclAtSorted? (decls : Array (Decl pu)) (declName : Name) : Option (Decl pu) :=
  let tmpDecl : Decl pu := default
  let tmpDecl := { tmpDecl with name := declName }
  decls.binSearch tmpDecl declLt

@[expose] def DeclExt (pu : Purity) :=
   PersistentEnvExtension (Decl pu) (Decl pu) (DeclExtState pu)

instance : Inhabited (DeclExt pu) :=
  inferInstanceAs (Inhabited (PersistentEnvExtension (Decl pu) (Decl pu) (DeclExtState pu)))

def mkDeclExt (phase : Phase) (name : Name := by exact decl_name%) :
    IO (DeclExt phase.toPurity) :=
  registerPersistentEnvExtension {
    name,
    mkInitial := pure {},
    addImportedFn := fun _ => pure {},
    addEntryFn := fun s decl => s.insert decl.name decl
    exportEntriesFnEx env s := Id.run do
      let all := sortedEntries s declLt
      let exported := all.filterMap fun decl => do
        guard <| isDeclPublic env decl.name
        if isDeclTransparent env phase decl.name then
          some decl
        else
          some { decl with value := .extern { entries := [.opaque] } }
      return { exported, server := exported, «private» := all }
    statsFn := statsFn,
    asyncMode := .sync,
    replay? := some (replayFn phase)
  }


builtin_initialize baseExt : DeclExt .pure ← mkDeclExt .base
builtin_initialize monoExt : DeclExt .pure ← mkDeclExt .mono
builtin_initialize impureExt : EnvExtension (DeclExtState .impure) ←
  registerEnvExtension (mkInitial := pure {}) (asyncMode := .sync) (replay? := some (replayFn .impure))


abbrev SigExtState (pu : Purity) := AbstractDeclExtState pu Signature

@[expose] def SigExt (pu : Purity) :=
   PersistentEnvExtension (Signature pu) (Signature pu) (SigExtState pu)

instance : Inhabited (SigExt pu) :=
  inferInstanceAs (Inhabited (PersistentEnvExtension (Signature pu) (Signature pu) (SigExtState pu)))

private abbrev sigLt (a b : Signature pu) :=
  Name.quickLt a.name b.name

private abbrev findSigAtSorted? (sigs : Array (Signature pu)) (declName : Name) : Option (Signature pu) :=
  let tmpSig : Signature pu := default
  let tmpSig := { tmpSig with name := declName }
  sigs.binSearch tmpSig sigLt

def mkSigDeclExt (phase : Phase) (name : Name := by exact decl_name%) :
    IO (SigExt phase.toPurity) :=
  registerPersistentEnvExtension {
    name,
    mkInitial := pure {},
    addImportedFn := fun _ => pure {},
    addEntryFn := fun s sig => s.insert sig.name sig
    exportEntriesFnEx env s := Id.run do
      let all := sortedEntries s sigLt
      let exported := all.filterMap fun sig => do
        guard <| isDeclPublic env sig.name
        some sig
      return { exported, server := exported, «private» := all }
    statsFn := statsFn,
    asyncMode := .sync,
    replay? := some (replayFn phase)
  }

builtin_initialize impureSigExt : SigExt .impure ← mkSigDeclExt .impure

def getDeclCore? (env : Environment) (ext : DeclExt pu) (declName : Name) : Option (Decl pu) :=
  findExtEntry? env ext declName findDeclAtSorted? (·.find?)

def getSigCore? (env : Environment) (ext : SigExt pu) (declName : Name) : Option (Signature pu) :=
  findExtEntry? env ext declName findSigAtSorted? (·.find?)

def getBaseDecl? (declName : Name) : CoreM (Option (Decl .pure)) := do
  return getDeclCore? (← getEnv) baseExt declName

def getMonoDecl? (declName : Name) : CoreM (Option (Decl .pure)) := do
  return getDeclCore? (← getEnv) monoExt declName

def getLocalImpureDecl? (declName : Name) : CoreM (Option (Decl .impure)) := do
  return impureExt.getState (← getEnv) |>.find? declName

def getLocalImpureDecls : CoreM (Array Name) := do
  return impureExt.getState (← getEnv) |>.toArray |>.map (·.fst)

def getImpureSignature? (declName : Name) : CoreM (Option (Signature .impure)) := do
  return getSigCore? (← getEnv) impureSigExt declName

def saveBaseDeclCore (env : Environment) (decl : Decl .pure) : Environment :=
  baseExt.addEntry env decl

def saveMonoDeclCore (env : Environment) (decl : Decl .pure) : Environment :=
  monoExt.addEntry env decl

def saveImpureDeclCore (env : Environment) (decl : Decl .impure) : Environment :=
  let env := impureExt.modifyState env (fun s => s.insert decl.name decl)
  impureSigExt.addEntry env decl.toSignature

def Decl.saveBase (decl : Decl .pure) : CoreM Unit :=
  modifyEnv (saveBaseDeclCore · decl)

def Decl.saveMono (decl : Decl .pure) : CoreM Unit :=
  modifyEnv (saveMonoDeclCore · decl)

def Decl.saveImpure (decl : Decl .impure) : CoreM Unit :=
  modifyEnv (saveImpureDeclCore · decl)

def Decl.save (decl : Decl pu) : CompilerM Unit := do
  match (← getPhase) with
  | .base => Phase.withPurityCheck .base pu fun h =>
      (h.symm ▸ decl).saveBase
  | .mono => Phase.withPurityCheck .mono pu fun h =>
      (h.symm ▸ decl).saveMono
  | .impure => Phase.withPurityCheck .impure pu fun h =>
      (h.symm ▸ decl).saveImpure

def getDeclAt? (declName : Name) (phase : Phase) : CoreM (Option (Decl phase.toPurity)) :=
  match phase with
  | .base => getBaseDecl? declName
  | .mono => getMonoDecl? declName
  | .impure => throwError "Internal compiler error: getDecl? on impure is unsupported for now"

@[inline]
def getDecl? (declName : Name) : CompilerM (Option ((pu : Purity) × Decl pu)) := do
  let some decl ← getDeclAt? declName (← getPhase) | return none
  return some ⟨_, decl⟩

def getLocalDeclAt? (declName : Name) (phase : Phase) : CompilerM (Option (Decl phase.toPurity)) :=
  match phase with
  | .base => return baseExt.getState (← getEnv) |>.find? declName
  | .mono => return monoExt.getState (← getEnv) |>.find? declName
  | .impure => return impureExt.getState (← getEnv) |>.find? declName

@[inline]
def getLocalDecl? (declName : Name) : CompilerM (Option ((pu : Purity) × Decl pu)) := do
  let some decl ← getLocalDeclAt? declName (← getPhase) | return none
  return some ⟨_, decl⟩

/--
Whether the attributes of `declName` still allow it to be lazy: `[init]`/`[builtin_init]`
declarations are set by the module initialiser, and `@[export]`ed ones may be read directly by C
code.
-/
def lazyConstAttrsAllow (env : Environment) (declName : Name) : Bool :=
  !hasInitAttr env declName && !isIOUnitInitFn env declName &&
    (getExportNameFor? env declName).isNone

/--
Arity-0 declarations that the C emitter initialises lazily: instead of being computed by the
module initialiser, each gets a once cell and is computed on first use (see `detectLazyConst`).

The set is persistent because importing modules need it to read such a constant: a lazy constant
must be read through its once cell, while an eager one (or a statically initialised one, which
importers cannot otherwise tell apart from an eager one) is read directly. Recording the decision
of the module that emitted the constant, rather than recomputing it in importers, also keeps
modules compiled by an older compiler (stage 0 output, for instance) readable: they have no
entries, so all their constants are read directly.

The decision is taken when the constant is compiled, but `attribute [init f] c` or
`attribute [export n] c` can still be applied to it later in the same module, and both make it
ineligible (see `Decl.isLazyConstCandidate`). So the entries are filtered again, with the final
attributes, when they are exported and when the defining module emits its C code
(`isLazyConst`).
-/
builtin_initialize lazyConstExt : PersistentEnvExtension Name Name (PHashMap Name Unit) ←
  registerPersistentEnvExtension {
    mkInitial := pure {},
    addImportedFn := fun _ => pure {},
    addEntryFn := fun s n => s.insert n ()
    exportEntriesFnEx env s := Id.run do
      let all := s.foldl (init := #[]) (fun ns n _ => ns.push n) |>.qsort Name.quickLt
      let all := all.filter (lazyConstAttrsAllow env ·)
      -- Same visibility as `impureSigExt`: an importer that can see the signature sees the tag.
      let exported := all.filter (isDeclPublic env ·)
      return { exported, server := exported, «private» := all }
    asyncMode := .sync,
    replay? := some fun oldState newState _ otherState =>
      PersistentHashMap.foldlNewEntries (·.insert · ·) newState oldState otherState
  }

def markLazyConst (env : Environment) (declName : Name) : Environment :=
  lazyConstExt.addEntry env declName

/-- Whether `declName` (local or imported) is initialised lazily through a once cell. -/
def isLazyConst (env : Environment) (declName : Name) : Bool :=
  (findExtEntry? env lazyConstExt declName
    (fun names n => names.binSearch n Name.quickLt)
    (fun s n => if s.contains n then some n else none)
  |>.isSome) && lazyConstAttrsAllow env declName

builtin_initialize declOrderExt : EnvExtension (List Name × NameSet) ← mkOrderedDeclSetExt

def recordFinalImpureDecl (env : Environment) (name : Name) : Environment :=
  declOrderExt.modifyState env fun s =>
    (name :: s.1, s.2.insert name)

def getImpureDeclIndices (env : Environment) (targets : Array Name) : Std.HashMap Name Nat := Id.run do
  let (names, set) := declOrderExt.getState env
  let mut map := Std.HashMap.emptyWithCapacity set.size
  let targetSet := Std.HashSet.ofArray targets
  let mut i := set.size
  for name in names do
    if targetSet.contains name then
      map := map.insert name i
    assert! i != 0
    i := i - 1
  assert! map.size == targets.size
  return map

end Lean.Compiler.LCNF
