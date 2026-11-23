import LiveScripts.Shared
import LiveScripts.S_90aea9d173648992e190bc17f95aaecc31e1598b58517faa7e23a6e9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_90aea9d173648992e190bc17f95aaecc31e1598b58517faa7e23a6e9.script [ctx] 10000]
