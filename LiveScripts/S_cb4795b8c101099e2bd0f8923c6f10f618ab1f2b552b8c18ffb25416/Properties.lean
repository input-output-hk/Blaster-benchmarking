import LiveScripts.Shared
import LiveScripts.S_cb4795b8c101099e2bd0f8923c6f10f618ab1f2b552b8c18ffb25416.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cb4795b8c101099e2bd0f8923c6f10f618ab1f2b552b8c18ffb25416.script [ctx] 10000]
