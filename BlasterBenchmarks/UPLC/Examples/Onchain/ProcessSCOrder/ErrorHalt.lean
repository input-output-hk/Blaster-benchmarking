import BlasterBenchmarks.UPLC.Builtins
import BlasterBenchmarks.UPLC.CekValue
import BlasterBenchmarks.UPLC.Examples.Utils
import BlasterBenchmarks.UPLC.Examples.Onchain.ProcessSCOrder.ProcessSCOrder
import BlasterBenchmarks.UPLC.Uplc
import Solver.Command.Tactic

namespace Tests.Uplc.Onchain.ProcessSCOrder
open Tests.Uplc.Onchain

set_option warn.sorry false
-- Error is only triggered when:
--  - We have a selling order for N tokens;
--  - N > number of SC in circulation.
theorem isErrorState_imp_supply_exceeded :
  ∀ (x : ProcessSCInput),
    validOrderInput x →
    isErrorState (appliedProcessSCOrder x) →
    -x.nbTokens > x.state.crN_SC := by sorry

-- Function either triggers a error or terminates within the provided budget
theorem sufficient_script_budget :
  ∀ (x : ProcessSCInput),
    validOrderInput x →
      isErrorState (appliedProcessSCOrder x) ∨
      isHaltState (appliedProcessSCOrder x) := by sorry

end Tests.Uplc.Onchain.ProcessSCOrder
