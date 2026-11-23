import LiveScripts.Shared
import LiveScripts.S_04321298f7df820d6f7550f5f3a5e5aa2fc1b0a646b351f663038684.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_04321298f7df820d6f7550f5f3a5e5aa2fc1b0a646b351f663038684.script [datum, redeemer, ctx] 10000]
