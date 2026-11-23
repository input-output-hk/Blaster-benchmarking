import LiveScripts.Shared
import LiveScripts.S_9d18593a364304d5afb8bab2f792125edfb26ce97837fb5921f36407.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9d18593a364304d5afb8bab2f792125edfb26ce97837fb5921f36407.script [datum, redeemer, ctx] 10000]
