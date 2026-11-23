import LiveScripts.Shared
import LiveScripts.S_2bf3ec8a9ad822aee323f9b4a21dfdbd07ffc94c21cdd9096bb2bc70.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2bf3ec8a9ad822aee323f9b4a21dfdbd07ffc94c21cdd9096bb2bc70.script [ctx] 10000]
