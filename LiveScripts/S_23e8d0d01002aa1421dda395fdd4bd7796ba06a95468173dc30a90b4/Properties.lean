import LiveScripts.Shared
import LiveScripts.S_23e8d0d01002aa1421dda395fdd4bd7796ba06a95468173dc30a90b4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_23e8d0d01002aa1421dda395fdd4bd7796ba06a95468173dc30a90b4.script [ctx] 10000]
