import LiveScripts.Shared
import LiveScripts.S_0f4e61b4f21178be59b9b6d90675c0f42f7a8763b6492b4873e2b4f0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0f4e61b4f21178be59b9b6d90675c0f42f7a8763b6492b4873e2b4f0.script [redeemer, ctx] 10000]
