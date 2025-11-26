import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Examples.Onchain.ProcessSCOrder.ProcessSCOrder
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic

namespace Tests.Uplc.Onchain.ProcessSCOrder
open Tests.Uplc.Onchain

set_option warn.sorry false
-- STO8: Successful Selling Stablecoin Order

-- Provable once subgoal splitting supported inherently in blaster
theorem sto8 :
  ∀ (x : ProcessSCInput) (s : ComputeReserve),
    isSellSCOrder x →
    validOrderInput x →
    resultToComputeReserve (fromHaltState $ appliedProcessSCOrder x) = some s →
    validSellSC x s := by sorry

end Tests.Uplc.Onchain.ProcessSCOrder
