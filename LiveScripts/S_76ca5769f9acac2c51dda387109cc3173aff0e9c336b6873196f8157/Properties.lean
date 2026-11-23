import LiveScripts.Shared
import LiveScripts.S_76ca5769f9acac2c51dda387109cc3173aff0e9c336b6873196f8157.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_76ca5769f9acac2c51dda387109cc3173aff0e9c336b6873196f8157.script [ctx] 10000]
