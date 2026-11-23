import LiveScripts.Shared
import LiveScripts.S_4bc915a1a5f0d6278abd4cea346b1abd2b96cad62a692a3b0f902f79.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4bc915a1a5f0d6278abd4cea346b1abd2b96cad62a692a3b0f902f79.script [ctx] 10000]
