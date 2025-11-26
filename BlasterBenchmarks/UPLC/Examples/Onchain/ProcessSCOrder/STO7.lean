import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Examples.Onchain.ProcessSCOrder.ProcessSCOrder
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic

namespace Tests.Uplc.Onchain.ProcessSCOrder
open Tests.Uplc.Onchain

set_option warn.sorry false
-- STO7: Successful Buying Stablecoin Order

-- Provable once subgoal splitting supported inherently in blaster
theorem sto7 :
  ∀ (x : ProcessSCInput),
   isBuySCOrder x →
   validOrderInput x →
   successfulOrderImpliesPredicate (fromHaltState $ appliedProcessSCOrder x) (validBuySC x) := by sorry

-- Example of subgoal splitting to reduce complexity at Smt solver level
theorem sto7_part1 :
  ∀ (x : ProcessSCInput),
   isBuySCOrder x →
   validOrderInput x →
   x.state.crN_RC = 0 →
   successfulOrderImpliesPredicate (fromHaltState $ appliedProcessSCOrder x) (validBuySC x) := by sorry

theorem sto7_part2 :
  ∀ (x : ProcessSCInput),
   isBuySCOrder x →
   validOrderInput x →
   x.state.crN_RC ≠ 0 →
   successfulOrderImpliesPredicate (fromHaltState $ appliedProcessSCOrder x) (validBuySC x) := by sorry


end Tests.Uplc.Onchain.ProcessSCOrder
