import LiveScripts.Shared
import LiveScripts.S_d3eb03a9d8a323c3aed63102fbabb19ded46e74a71d3a2b46db29719.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d3eb03a9d8a323c3aed63102fbabb19ded46e74a71d3a2b46db29719.script [ctx] 10000]
