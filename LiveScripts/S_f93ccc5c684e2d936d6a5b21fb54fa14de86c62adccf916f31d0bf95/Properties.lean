import LiveScripts.Shared
import LiveScripts.S_f93ccc5c684e2d936d6a5b21fb54fa14de86c62adccf916f31d0bf95.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f93ccc5c684e2d936d6a5b21fb54fa14de86c62adccf916f31d0bf95.script [datum, redeemer, ctx] 10000]
