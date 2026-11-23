import LiveScripts.Shared
import LiveScripts.S_6e5d66c69b0cba0acb4f9b451845764befc3ae27f3affd7524c85e6b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6e5d66c69b0cba0acb4f9b451845764befc3ae27f3affd7524c85e6b.script [ctx] 10000]
