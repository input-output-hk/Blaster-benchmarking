import LiveScripts.Shared
import LiveScripts.S_ab5fba3021ed9d8d2453481334b46d8eaf837cf3183db70b05566b62.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ab5fba3021ed9d8d2453481334b46d8eaf837cf3183db70b05566b62.script [ctx] 10000]
