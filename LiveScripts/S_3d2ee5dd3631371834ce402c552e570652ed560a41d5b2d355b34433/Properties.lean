import LiveScripts.Shared
import LiveScripts.S_3d2ee5dd3631371834ce402c552e570652ed560a41d5b2d355b34433.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3d2ee5dd3631371834ce402c552e570652ed560a41d5b2d355b34433.script [ctx] 10000]
