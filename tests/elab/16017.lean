module

import Std.Internal.Parsec

/-!
Regression test for #16017: proofs in other modules about a `Parsec` parser written with `do` can
unfold the monad operations.
-/

open Std.Internal Std.Internal.Parsec.String

example (it : Sigma String.Pos) :
    (do let x ← pure 1; pure (x + 1) : Parser Nat) it = .success it 2 := by
  simp [bind, pure, Parsec.bind, Parsec.pure]
