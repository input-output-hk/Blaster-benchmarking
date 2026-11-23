import LiveScripts.Shared
import LiveScripts.S_470139bdac566b288b2e4f6b333343249bc4da57538f1b1ffe04524a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_470139bdac566b288b2e4f6b333343249bc4da57538f1b1ffe04524a.script [ctx] 10000]
