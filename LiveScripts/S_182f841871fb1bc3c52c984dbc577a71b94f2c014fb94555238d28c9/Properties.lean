import LiveScripts.Shared
import LiveScripts.S_182f841871fb1bc3c52c984dbc577a71b94f2c014fb94555238d28c9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_182f841871fb1bc3c52c984dbc577a71b94f2c014fb94555238d28c9.script [ctx] 10000]
