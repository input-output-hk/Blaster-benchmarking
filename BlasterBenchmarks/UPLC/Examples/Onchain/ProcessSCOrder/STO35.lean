import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Examples.Onchain.ProcessSCOrder.ProcessSCOrder
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic

namespace Tests.Uplc.Onchain.ProcessSCOrder
open Tests.Uplc.Onchain

set_option warn.sorry false
-- STO35: Maximum Minting Violation for Buying Stablecoin Order
-- Proved only with optimization rules
theorem sto35 :
  ∀ (x : ProcessSCInput),
    isBuySCOrder x →
    validOrderInput x →
    isMaxStablecoinMintingReachedStatus (fromHaltState $ appliedProcessSCOrder x) →
    validMaxMintingViolation x := by sorry


end Tests.Uplc.Onchain.ProcessSCOrder
