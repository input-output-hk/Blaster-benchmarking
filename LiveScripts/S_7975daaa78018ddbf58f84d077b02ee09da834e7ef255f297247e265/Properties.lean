import LiveScripts.Shared
import LiveScripts.S_7975daaa78018ddbf58f84d077b02ee09da834e7ef255f297247e265.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7975daaa78018ddbf58f84d077b02ee09da834e7ef255f297247e265.script [ctx] 10000]
