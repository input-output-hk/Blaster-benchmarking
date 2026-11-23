import LiveScripts.Shared
import LiveScripts.S_9a81be8900f34a86e80c1a7f6345abe5bd86f60b4700a047e513a3b0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9a81be8900f34a86e80c1a7f6345abe5bd86f60b4700a047e513a3b0.script [ctx] 10000]
