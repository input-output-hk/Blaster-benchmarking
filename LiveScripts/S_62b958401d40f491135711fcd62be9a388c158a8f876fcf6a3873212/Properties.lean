import LiveScripts.Shared
import LiveScripts.S_62b958401d40f491135711fcd62be9a388c158a8f876fcf6a3873212.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_62b958401d40f491135711fcd62be9a388c158a8f876fcf6a3873212.script [ctx] 10000]
