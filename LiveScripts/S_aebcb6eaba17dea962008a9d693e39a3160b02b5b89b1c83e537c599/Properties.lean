import LiveScripts.Shared
import LiveScripts.S_aebcb6eaba17dea962008a9d693e39a3160b02b5b89b1c83e537c599.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aebcb6eaba17dea962008a9d693e39a3160b02b5b89b1c83e537c599.script [redeemer, ctx] 10000]
