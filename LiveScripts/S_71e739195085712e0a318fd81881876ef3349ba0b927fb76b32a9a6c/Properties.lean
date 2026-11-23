import LiveScripts.Shared
import LiveScripts.S_71e739195085712e0a318fd81881876ef3349ba0b927fb76b32a9a6c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_71e739195085712e0a318fd81881876ef3349ba0b927fb76b32a9a6c.script [ctx] 10000]
