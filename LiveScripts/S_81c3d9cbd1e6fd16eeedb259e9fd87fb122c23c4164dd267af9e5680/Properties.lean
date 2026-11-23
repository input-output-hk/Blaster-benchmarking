import LiveScripts.Shared
import LiveScripts.S_81c3d9cbd1e6fd16eeedb259e9fd87fb122c23c4164dd267af9e5680.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_81c3d9cbd1e6fd16eeedb259e9fd87fb122c23c4164dd267af9e5680.script [ctx] 10000]
