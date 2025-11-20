import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Examples.Onchain.ProcessSCOrder.ProcessSCOrder
import BlasterBenchmarks.UPLC.PreProcess
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic

namespace Tests.Uplc.Onchain.ProcessSCOrder
open Tests.Uplc.Onchain

-- STO45: Insufficient Operator’s Fees Violation for Selling Stablecoin Order

set_option warn.sorry false
-- NOTE: Example of subgoal splitting to reduce complexity at Smt solver level
theorem sto45 :
  ∀ (x : ProcessSCInput),
  isSellSCOrder x →
  validOrderInput x →
  isInsufficientOperatorFees (fromHaltState $ prop_compiledProcessSCOrder x) →
  validInsufficientFeesForSellSC x := by sorry
  -- intro x;
  -- blaster (only-optimize: 1)
  -- by_cases x.state.crN_SC = 0 <;>
  -- by_cases x.state.crN_RC = 0
  -- . blaster
  -- . blaster
  -- . by_cases x.orderRate < mkRatio x.state.crReserve x.state.crN_SC <;> blaster
  -- . by_cases x.orderRate < fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
  --   . blaster
  --   . let price := fromInteger x.state.crReserve * (unsafeRecip $ fromInteger x.state.crN_SC * x.scBaseFeeBSC)
  --     let priceWithFees := (price * x.scBaseFeeSSC) * x.scOperatorFeeRatio
  --     by_cases fromInteger (truncate priceWithFees) < priceWithFees
  --     . blaster (random-seed: 4)
  --     . blaster

-- NOTE: Remove solver options once subgoal splitting is supported
#solve (timeout: 2) (solve-result: 2) [ sto45 ]


end Tests.Uplc.Onchain.ProcessSCOrder
