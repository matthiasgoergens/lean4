/-
Copyright (c) 2026 Matthias Görgens. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Matthias Görgens
-/
module

prelude
public import Lean.Compiler.LCNF.CompilerM
public import Lean.Compiler.LCNF.PassManager
import Lean.Compiler.LCNF.PhaseExt
import Lean.Compiler.LCNF.SimpleGroundExpr
import Lean.Compiler.ClosedTermCache
import Lean.Compiler.NeverExtractAttr

/-!
This module decides which top-level constants (declarations of arity 0) the C emitter initialises
lazily. A lazy constant is not computed by the module initialiser before `main` runs; it gets a
once cell and is computed by the first reader, exactly like an extracted closed term (see
`lean_obj_once` in `lean.h`). The decision is recorded in `lazyConstExt` so that importing modules
read the constant through its once cell as well.
-/

namespace Lean.Compiler.LCNF

open ImpureType

/--
Whether values of type `ty` can be read through a once cell: these are the types
`lean.h` has a `lean_*_once` reader for.
-/
def isLazyConstType (ty : Expr) : Bool :=
  match ty with
  | float | float32 | uint8 | uint16 | uint32 | uint64 | usize
  | object | tobject | tagged => true
  | _ => false

/--
Whether the body of `code` directly applies a declaration marked `@[never_extract]`. Closed-term
extraction leaves such applications where they are, so they are never run lazily; a constant whose
body contains one stays eager for the same reason.
-/
def hasNeverExtractApp (env : Environment) (code : Code .impure) : Bool :=
  let visit (c : Code .impure) : StateM Bool Unit := do
    if let .let decl _ := c then
      match decl.value with
      | .fap fn _ | .pap fn _ =>
        if hasNeverExtractAttribute env fn then set true
      | _ => pure ()
  let ((), found) := Id.run ((code.forM visit).run false)
  found

/--
Whether `decl` can be initialised lazily. Constants stay eager when:

* they are not arity-0 Lean code (`@[extern]` constants have no body to run);
* their type has no once reader (`isLazyConstType`);
* they are extracted closed terms (already lazy, with a module-private once cell) or simple ground
  values (statically initialised, nothing to run);
* they carry `[init]`/`[builtin_init]` (`initialize`/`builtin_initialize`): these are IO actions
  whose effects and ordering the module initialiser is responsible for;
* they are `@[export]`ed: C code may read the exported global directly, without knowing about the
  once cell;
* they are marked `@[never_extract]` or apply such a declaration directly, mirroring the rule that
  keeps such applications out of lazily initialised closed terms.
-/
def Decl.isLazyConstCandidate (decl : Decl .impure) : CoreM Bool := do
  let env ← getEnv
  let .code code := decl.value | return false
  unless decl.params.isEmpty do return false
  unless isLazyConstType decl.type do return false
  if isClosedTermName env decl.name || isSimpleGroundDecl env decl.name then return false
  unless lazyConstAttrsAllow env decl.name do return false
  if hasNeverExtractAttribute env decl.name || hasNeverExtractApp env code then return false
  return true

public def detectLazyConst : Pass where
  phase := .impure
  name := `detectLazyConst
  run := fun decls => do
    for decl in decls do
      if (← decl.isLazyConstCandidate) then
        trace[Compiler.lazyConst] m!"Marked {decl.name} as lazily initialised"
        modifyEnv fun env => markLazyConst env decl.name
    return decls

builtin_initialize registerTraceClass `Compiler.lazyConst (inherited := true)

end Lean.Compiler.LCNF
