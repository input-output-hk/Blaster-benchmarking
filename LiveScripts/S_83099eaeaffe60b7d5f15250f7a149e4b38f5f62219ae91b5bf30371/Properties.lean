import LiveScripts.Shared
import LiveScripts.S_83099eaeaffe60b7d5f15250f7a149e4b38f5f62219ae91b5bf30371.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_83099eaeaffe60b7d5f15250f7a149e4b38f5f62219ae91b5bf30371.script [ctx] 10000]
