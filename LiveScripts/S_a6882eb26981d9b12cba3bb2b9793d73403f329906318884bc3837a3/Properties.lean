import LiveScripts.Shared
import LiveScripts.S_a6882eb26981d9b12cba3bb2b9793d73403f329906318884bc3837a3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a6882eb26981d9b12cba3bb2b9793d73403f329906318884bc3837a3.script [ctx] 10000]
