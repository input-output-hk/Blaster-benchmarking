import LiveScripts.Shared
import LiveScripts.S_d19b6d146fe97260f83ed1e0dbb62e74598569b13ba07165a46ecd22.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d19b6d146fe97260f83ed1e0dbb62e74598569b13ba07165a46ecd22.script [ctx] 10000]
