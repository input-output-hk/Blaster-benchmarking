import LiveScripts.Shared
import LiveScripts.S_26370b459e5eafe6e179c94a39bb1c278657de5c1875fb9c5d1fa0ba.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_26370b459e5eafe6e179c94a39bb1c278657de5c1875fb9c5d1fa0ba.script [datum, redeemer, ctx] 10000]
