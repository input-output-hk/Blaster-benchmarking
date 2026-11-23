import LiveScripts.Shared
import LiveScripts.S_06527ef9fa190184f1f23cdf2bce2b92dd35a3c30892ecd3fb53b894.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_06527ef9fa190184f1f23cdf2bce2b92dd35a3c30892ecd3fb53b894.script [redeemer, ctx] 10000]
