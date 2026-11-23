import LiveScripts.Shared
import LiveScripts.S_20f765d25da3a36644371f7619d97bdccf034f3067921921d9dce0f7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_20f765d25da3a36644371f7619d97bdccf034f3067921921d9dce0f7.script [ctx] 10000]
