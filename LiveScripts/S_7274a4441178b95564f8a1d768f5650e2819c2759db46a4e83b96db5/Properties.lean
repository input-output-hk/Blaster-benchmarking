import LiveScripts.Shared
import LiveScripts.S_7274a4441178b95564f8a1d768f5650e2819c2759db46a4e83b96db5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7274a4441178b95564f8a1d768f5650e2819c2759db46a4e83b96db5.script [ctx] 10000]
