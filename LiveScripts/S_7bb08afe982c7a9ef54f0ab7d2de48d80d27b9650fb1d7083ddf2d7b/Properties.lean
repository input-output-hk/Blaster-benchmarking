import LiveScripts.Shared
import LiveScripts.S_7bb08afe982c7a9ef54f0ab7d2de48d80d27b9650fb1d7083ddf2d7b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7bb08afe982c7a9ef54f0ab7d2de48d80d27b9650fb1d7083ddf2d7b.script [redeemer, ctx] 10000]
