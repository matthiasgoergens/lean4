inductive Vec (α : Type) : Nat → Type where
  | nil : Vec α 0
  | cons {n} : α → Vec α n → Vec α (n + 1)

/--
info: @[reducible] protected def Vec.nil.elim.{u} : {α : Type} →
  {motive : (a : Nat) → Vec α a → Sort u} → {a : Nat} → (t : Vec α a) → t.ctorIdx = 0 → motive 0 Vec.nil → motive a t
-/
#guard_msgs in
#print sig Vec.nil.elim

/--
info: @[reducible] protected def Vec.cons.elim.{u} : {α : Type} →
  {motive : (a : Nat) → Vec α a → Sort u} →
    {a : Nat} →
      (t : Vec α a) →
        t.ctorIdx = 1 → ({n : Nat} → (a : α) → (a_1 : Vec α n) → motive (n + 1) (Vec.cons a a_1)) → motive a t
-/
#guard_msgs in
#print sig Vec.cons.elim


structure JustOneConstructor where
  (x : Nat)
  (y : Bool)

/-- error: Unknown constant `JustOneConstructor.mk.elim` -/
#guard_msgs in #print sig JustOneConstructor.mk.elim

-- Test that the compiler compiles the ctorelim to straight line code

set_option trace.Compiler.saveBase true

/--
trace: [Compiler.saveBase] size: 0
    def testDecl1 α motive a.1 t h nil : motive lcAny lcAny :=
      return nil
-/
#guard_msgs in
def testDecl1 :=@Vec.nil.elim

/--
trace: [Compiler.saveBase] size: 3
    def testDecl2 α motive a.1 t h cons : motive lcAny lcAny :=
      cases t : motive lcAny lcAny
      | Vec.cons n a.2 a.3 =>
        let _x.4 := cons n a.2 a.3;
        return _x.4
-/
#guard_msgs in
def testDecl2 := @Vec.cons.elim

set_option trace.Compiler.saveBase false

/-!
`ctorElimType` reduces at a numeral to the lifted alternative, and at any other index to nested
`cond`s over the lifted alternatives.
-/

inductive Three where
  | a | b | c

example {motive : Three → Sort u} :
    Three.ctorElimType (motive := motive) 1 = PULift.{u, u} (motive .b) := rfl

example {motive : Three → Sort u} (i : Nat) : Three.ctorElimType (motive := motive) i =
    (bif i.ble 0 then PULift.{u, u} (motive .a)
     else bif i.ble 1 then PULift.{u, u} (motive .b) else PULift.{u, u} (motive .c)) := rfl

example {motive : (n : Nat) → Vec Bool n → Sort u} (i : Nat) :
    Vec.ctorElimType (motive := motive) i =
    (bif i.ble 0 then PULift.{u, u} (motive 0 .nil)
     else PULift.{u, u} ({n : Nat} → (a : Bool) → (v : Vec Bool n) → motive (n + 1) (.cons a v))) := rfl
