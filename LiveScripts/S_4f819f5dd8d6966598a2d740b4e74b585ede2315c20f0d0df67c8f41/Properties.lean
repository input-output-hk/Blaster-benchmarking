import LiveScripts.Shared
import LiveScripts.S_4f819f5dd8d6966598a2d740b4e74b585ede2315c20f0d0df67c8f41.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4f819f5dd8d6966598a2d740b4e74b585ede2315c20f0d0df67c8f41.script [datum, redeemer, ctx] 10000]
