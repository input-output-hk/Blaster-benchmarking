import LiveScripts.Shared
import LiveScripts.S_d15c36d6dec655677acb3318294f116ce01d8d9def3cc54cdd78909b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d15c36d6dec655677acb3318294f116ce01d8d9def3cc54cdd78909b.script [redeemer, ctx] 10000]
