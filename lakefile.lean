import Lake
open Lake DSL

package BlasterBenchmarks where

require «Solver» from git
  "https://github.com/input-output-hk/Lean-blaster" @ "staging"

def leanVersion : String := s!"v{Lean.versionString}"
require "leanprover-community" / mathlib @ git leanVersion

@[default_target]
lean_lib BlasterBenchmarks where
