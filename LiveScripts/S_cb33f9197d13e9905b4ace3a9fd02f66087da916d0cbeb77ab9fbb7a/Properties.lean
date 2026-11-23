import LiveScripts.Shared
import LiveScripts.S_cb33f9197d13e9905b4ace3a9fd02f66087da916d0cbeb77ab9fbb7a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cb33f9197d13e9905b4ace3a9fd02f66087da916d0cbeb77ab9fbb7a.script [ctx] 10000]
