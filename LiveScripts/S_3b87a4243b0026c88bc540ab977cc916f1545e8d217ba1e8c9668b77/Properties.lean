import LiveScripts.Shared
import LiveScripts.S_3b87a4243b0026c88bc540ab977cc916f1545e8d217ba1e8c9668b77.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3b87a4243b0026c88bc540ab977cc916f1545e8d217ba1e8c9668b77.script [datum, redeemer, ctx] 10000]
