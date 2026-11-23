/-
Copyright (c) 2025 Lean FRO, LLC. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Joachim Breitner
-/

module
prelude
public import Lean.Meta.Basic
import Lean.Meta.InferType
import Init.Omega

open Lean Meta

/-!
This module provides builder for efficient `Nat → …` functions based on binary decision trees.
-/

namespace Lean

/--
Builds an expression of type `Nat → $type` that returns the `es[i]`, using binary search.
The array must be non-empty.
-/
public def mkNatLookupTable (i : Expr) (type : Expr) (es : Array Expr) : MetaM Expr := do
  if h : es.size = 0 then
    panic! "mkNatLookupTable: expected non-empty array"
  else
    let u ← getLevel type
    let rec go (start stop : Nat) (hstart : start < stop := by omega) (hstop : stop ≤ es.size := by omega) : MetaM Expr := do
      if h : start + 1 = stop then
        return es[start]
      else
        let mid := (start + stop) / 2
        let low ← go start mid
        let high ← go mid stop
        return mkApp4 (mkConst ``cond [u]) type (mkApp2 (mkConst ``Nat.ble) i (mkRawNatLit (mid-1))) low high
    go 0 es.size

/--
Builds a closed expression `fun (i : Nat) xs => es[i]`, using binary search like
`mkNatLookupTable`: each inner node is `fun i xs => cond (Nat.ble i k) (lo i xs) (hi i xs)`, where
`lo` and `hi` are themselves closed tables. Substituting for variables bound around an application
of the table therefore never traverses it, and reducing an application at a literal index selects
one path from the root to a leaf. At any index, the application unfolds, up to β-reduction, to the
same nested `cond` that `mkNatLookupTable` builds. An index at or past the end selects the last
entry.

`xs` must be local variables, `type` the type of every entry, and `type` and the entries may only
mention variables among `xs`. The array must be non-empty.
-/
public def mkClosedNatLookupTable (xs : Array Expr) (type : Expr) (es : Array Expr) : MetaM Expr := do
  if h : es.size = 0 then
    panic! "mkClosedNatLookupTable: expected non-empty array"
  else
    let u ← getLevel type
    withLocalDeclD `i (mkConst ``Nat) fun i => do
      let bs := #[i] ++ xs
      let rec go (start stop : Nat) (hstart : start < stop := by omega)
          (hstop : stop ≤ es.size := by omega) : MetaM Expr := do
        if h : start + 1 = stop then
          mkLambdaFVars bs es[start]
        else
          let mid := (start + stop) / 2
          let lo ← go start mid
          let hi ← go mid stop
          mkLambdaFVars bs <| mkApp4 (mkConst ``cond [u]) type
            (mkApp2 (mkConst ``Nat.ble) i (mkRawNatLit (mid-1))) (mkAppN lo bs) (mkAppN hi bs)
      go 0 es.size

end Lean
