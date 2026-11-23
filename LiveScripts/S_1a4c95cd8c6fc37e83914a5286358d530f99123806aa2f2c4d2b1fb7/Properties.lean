import LiveScripts.Shared
import LiveScripts.S_1a4c95cd8c6fc37e83914a5286358d530f99123806aa2f2c4d2b1fb7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1a4c95cd8c6fc37e83914a5286358d530f99123806aa2f2c4d2b1fb7.script [redeemer, ctx] 10000]
