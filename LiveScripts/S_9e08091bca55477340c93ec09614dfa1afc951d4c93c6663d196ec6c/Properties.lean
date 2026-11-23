import LiveScripts.Shared
import LiveScripts.S_9e08091bca55477340c93ec09614dfa1afc951d4c93c6663d196ec6c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9e08091bca55477340c93ec09614dfa1afc951d4c93c6663d196ec6c.script [ctx] 10000]
