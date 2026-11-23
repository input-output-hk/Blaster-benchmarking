import LiveScripts.Shared
import LiveScripts.S_b46aaddf9ab952d44c3f7e028c99aa6adb8d6fd9417ff25bb6b9896a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b46aaddf9ab952d44c3f7e028c99aa6adb8d6fd9417ff25bb6b9896a.script [ctx] 10000]
