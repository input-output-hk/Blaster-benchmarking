import LiveScripts.Shared
import LiveScripts.S_975905ffa8c04b2823fda4c9331670a9f8f51c20bb8325867798bfc8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_975905ffa8c04b2823fda4c9331670a9f8f51c20bb8325867798bfc8.script [ctx] 10000]
