import LiveScripts.Shared
import LiveScripts.S_3d6b603c4c4abe4273223b45a858e7f546b8c520048f43218e250c66.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3d6b603c4c4abe4273223b45a858e7f546b8c520048f43218e250c66.script [datum, redeemer, ctx] 10000]
