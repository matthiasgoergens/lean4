import Lake
open Lake DSL

package sorts

lean_lib Sorts where
  globs := #[.submodules `Sorts]

/-- `lake build -Kshuffle=SEED sorts` links the functions (leanc already compiles with
`-ffunction-sections`) in an order lld shuffles with SEED, to sample code layouts. -/
@[default_target] lean_exe sorts where
  root := `Main
  moreLinkArgs := match get_config? shuffle with
    | some seed => #[s!"-Wl,--shuffle-sections=*={seed}"]
    | none => #[]

lean_exe sorttest where
  root := `Test
