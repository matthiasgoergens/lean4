/-!
`Float.toString` and `Float32.toString` have a logical model, so the kernel can evaluate them.
-/

example : (0.1 : Float).toString = "0.1" := by decide
example : (0.1 + 0.2 : Float).toString = "0.30000000000000004" := by decide
example : (1e22 : Float).toString = "1e+22" := by decide
example : (-0.0 : Float).toString = "-0.0" := by decide
example : (1 / 0 : Float).toString = "inf" := by decide
example : (0.1 : Float32).toString = "0.1" := by decide
