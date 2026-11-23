import LiveScripts.Shared
import LiveScripts.S_acafb9a5d6d47da80350456a2d3d7775dcc7972076d387f45824e710.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_acafb9a5d6d47da80350456a2d3d7775dcc7972076d387f45824e710.script [ctx] 10000]
