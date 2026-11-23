import LiveScripts.Shared
import LiveScripts.S_149b14b6b7d3891557f11ce57ffe96427b789df236baae0f8c90f1c2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_149b14b6b7d3891557f11ce57ffe96427b789df236baae0f8c90f1c2.script [ctx] 10000]
