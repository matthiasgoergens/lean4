/-! Converts `7 ^ n` to decimal; `Nat.repr` is subquadratic on large numbers. -/

def main : List String → IO Unit
| [n] => IO.println (toString (7 ^ n.toNat!)).length
| _ => throw $ IO.userError "give the exponent"
