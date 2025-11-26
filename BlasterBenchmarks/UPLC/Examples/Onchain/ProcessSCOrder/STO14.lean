import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Examples.Onchain.ProcessSCOrder.ProcessSCOrder
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic

namespace Tests.Uplc.Onchain.ProcessSCOrder
open Tests.Uplc.Onchain

set_option warn.sorry false
-- STO14: Min Ratio Violation for Buying Stablecoin Order

-- Provable once subgoal splitting supported inherently in blaster
theorem sto14 :
  ∀ (x : ProcessSCInput),
  isBuySCOrder x →
  validOrderInput x →
  isInvalidMinReserveStatus (fromHaltState $ appliedProcessSCOrder x) →
  validMinRatioViolation x := by sorry

-- Example of subgoal splitting to reduce complexity at Smt solver level
theorem sto14_part1 :
  ∀ (x : ProcessSCInput),
  isBuySCOrder x →
  validOrderInput x →
  x.state.crN_SC = 0 →
  isInvalidMinReserveStatus (fromHaltState $ appliedProcessSCOrder x) →
  validMinRatioViolation x := by sorry

theorem sto14_part2 :
  ∀ (x : ProcessSCInput),
  isBuySCOrder x →
  validOrderInput x →
  x.state.crN_SC ≠ 0 →
  isInvalidMinReserveStatus (fromHaltState $ appliedProcessSCOrder x) →
  validMinRatioViolation x := by sorry

end Tests.Uplc.Onchain.ProcessSCOrder
