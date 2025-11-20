import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Examples.Onchain.ProcessSCOrder.ProcessSCOrder
import BlasterBenchmarks.UPLC.PreProcess
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic

namespace Tests.Uplc.Onchain.ProcessSCOrder
open Tests.Uplc.Onchain

set_option warn.sorry false
-- STO14: Min Ratio Violation for Buying Stablecoin Order
theorem sto14 :
  ∀ (x : ProcessSCInput),
  isBuySCOrder x →
  validOrderInput x →
  isInvalidMinReserveStatus (fromHaltState $ prop_compiledProcessSCOrder x) →
  validMinRatioViolation x := by sorry
  -- intro x
  -- blaster (only-optimize: 1)
  -- by_cases x.state.crN_SC = 0
  -- . blaster
  -- . by_cases x.state.crN_RC = 0
  --   . by_cases x.orderRate < mkRatio x.state.crReserve x.state.crN_SC <;> blaster
  --   . blaster

-- NOTE: Remove solver options once subgoal splitting is supported
#solve (timeout: 2) (solve-result: 2) [ sto14 ]

end Tests.Uplc.Onchain.ProcessSCOrder
