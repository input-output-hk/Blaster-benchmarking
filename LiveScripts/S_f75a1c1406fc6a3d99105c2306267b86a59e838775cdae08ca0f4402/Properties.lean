import LiveScripts.Shared
import LiveScripts.S_f75a1c1406fc6a3d99105c2306267b86a59e838775cdae08ca0f4402.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f75a1c1406fc6a3d99105c2306267b86a59e838775cdae08ca0f4402.script [ctx] 10000]
