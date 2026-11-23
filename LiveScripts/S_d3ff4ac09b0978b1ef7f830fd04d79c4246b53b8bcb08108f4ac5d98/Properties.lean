import LiveScripts.Shared
import LiveScripts.S_d3ff4ac09b0978b1ef7f830fd04d79c4246b53b8bcb08108f4ac5d98.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d3ff4ac09b0978b1ef7f830fd04d79c4246b53b8bcb08108f4ac5d98.script [redeemer, ctx] 10000]
