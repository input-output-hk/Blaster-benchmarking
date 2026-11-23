import LiveScripts.Shared
import LiveScripts.S_09c983f78f4b51df76cfd41936906d898d66fc90a782b51e9a12b0f1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_09c983f78f4b51df76cfd41936906d898d66fc90a782b51e9a12b0f1.script [ctx] 10000]
