import LiveScripts.Shared
import LiveScripts.S_0237cc313756ebb5bcfc2728f7bdc6a8047b471220a305aa373b278a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0237cc313756ebb5bcfc2728f7bdc6a8047b471220a305aa373b278a.script [datum, redeemer, ctx] 10000]
