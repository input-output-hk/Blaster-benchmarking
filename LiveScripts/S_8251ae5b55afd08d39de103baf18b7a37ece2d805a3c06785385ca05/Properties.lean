import LiveScripts.Shared
import LiveScripts.S_8251ae5b55afd08d39de103baf18b7a37ece2d805a3c06785385ca05.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8251ae5b55afd08d39de103baf18b7a37ece2d805a3c06785385ca05.script [redeemer, ctx] 10000]
