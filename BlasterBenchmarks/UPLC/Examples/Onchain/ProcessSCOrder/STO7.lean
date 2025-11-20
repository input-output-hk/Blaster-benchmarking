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
-- set_option pp.deepTerms.threshold 50000 in
-- set_option pp.deepTerms true in
-- set_option pp.maxSteps 50000 in
-- set_option trace.Translate.optExpr true in

-- STO7: Successful Buying Stablecoin Order
theorem sto7 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
   isBuySCOrder x →
   validOrderInput x →
   resultToComputeReserve (fromHaltState $ prop_compiledProcessSCOrder x) = some s →
   validBuySC x s := by sorry
  --  intro x s;
  --  blaster (only-optimize: 1)
  --  by_cases x.state.crN_RC = 0
  --  . let price := fromInteger x.nbTokens * (x.orderRate * x.scBaseFeeBSC)
  --    by_cases fromInteger (truncate price) < price <;> blaster
  --  . blaster (random-seed: 3) (timeout: 5)

-- NOTE: Remove solver options once subgoal splitting is supported
#solve (timeout: 10) (solve-result: 2) [ sto7 ]


end Tests.Uplc.Onchain.ProcessSCOrder
