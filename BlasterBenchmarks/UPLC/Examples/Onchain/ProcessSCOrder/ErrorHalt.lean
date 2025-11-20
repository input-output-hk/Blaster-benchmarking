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
-- Error is only triggered when:
--  - We have a selling order for N tokens;
--  - N > number of SC in circulation.
theorem isErrorState_imp_supply_exceeded :
  ∀ (x : ProcessSCInput),
    validOrderInput x →
    isErrorState (prop_compiledProcessSCOrder x) →
    -x.nbTokens > x.state.crN_SC := by blaster

#solve [ isErrorState_imp_supply_exceeded ]

-- Function either triggers a error or terminates within the provided budget
theorem sufficient_script_budget :
  ∀ (x : ProcessSCInput),
    let res := prop_compiledProcessSCOrder x
    validOrderInput x →
    isErrorState res ∨ isHaltState res := by blaster

#solve [ sufficient_script_budget ]

end Tests.Uplc.Onchain.ProcessSCOrder
