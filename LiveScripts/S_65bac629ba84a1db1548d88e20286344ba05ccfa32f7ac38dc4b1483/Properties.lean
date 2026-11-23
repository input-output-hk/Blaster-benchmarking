import LiveScripts.Shared
import LiveScripts.S_65bac629ba84a1db1548d88e20286344ba05ccfa32f7ac38dc4b1483.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_65bac629ba84a1db1548d88e20286344ba05ccfa32f7ac38dc4b1483.script [redeemer, ctx] 10000]
