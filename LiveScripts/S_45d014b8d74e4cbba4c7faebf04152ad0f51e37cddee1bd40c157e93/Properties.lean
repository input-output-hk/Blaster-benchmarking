import LiveScripts.Shared
import LiveScripts.S_45d014b8d74e4cbba4c7faebf04152ad0f51e37cddee1bd40c157e93.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_45d014b8d74e4cbba4c7faebf04152ad0f51e37cddee1bd40c157e93.script [ctx] 10000]
