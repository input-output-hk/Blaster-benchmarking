import LiveScripts.Shared
import LiveScripts.S_6a0e34af4d51828a50c6f3d4b1610381de87f95d199a143efdcb8123.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6a0e34af4d51828a50c6f3d4b1610381de87f95d199a143efdcb8123.script [datum, redeemer, ctx] 10000]
