import LiveScripts.Shared
import LiveScripts.S_7845f8733855e17eb57ceec769581c4cdb8b78ae4e58753c0fb7ef0a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7845f8733855e17eb57ceec769581c4cdb8b78ae4e58753c0fb7ef0a.script [redeemer, ctx] 10000]
