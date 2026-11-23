import LiveScripts.Shared
import LiveScripts.S_09426f3e02d260d6f44df2cdcea66f761f7074b5279e2e7e7e59e010.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_09426f3e02d260d6f44df2cdcea66f761f7074b5279e2e7e7e59e010.script [ctx] 10000]
