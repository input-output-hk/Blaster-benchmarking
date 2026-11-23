import LiveScripts.Shared
import LiveScripts.S_ab835b719a82f620d5517b7fe846b4db1c8caadd024befe63efce5b6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ab835b719a82f620d5517b7fe846b4db1c8caadd024befe63efce5b6.script [ctx] 10000]
