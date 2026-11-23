import LiveScripts.Shared
import LiveScripts.S_41d70b513674c8d6c4d68bede2d1a394d536b3226759cd174132015a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_41d70b513674c8d6c4d68bede2d1a394d536b3226759cd174132015a.script [ctx] 10000]
