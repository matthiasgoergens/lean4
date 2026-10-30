import Lake
open Lake DSL

package qsortbench

/-- `lake build -Kshuffle=SEED qsortbench` links the functions (leanc already compiles with
`-ffunction-sections`) in an order lld shuffles with SEED, to sample code layouts. -/
@[default_target] lean_exe qsortbench where
  root := `Main
  moreLinkArgs := match get_config? shuffle with
    | some seed => #[s!"-Wl,--shuffle-sections=*={seed}"]
    | none => #[]
