import LiveScripts.Shared
import LiveScripts.S_00487b0ee879c1da2a8a3563d11b0eaadf0400960c4233ab3d2c81c1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_00487b0ee879c1da2a8a3563d11b0eaadf0400960c4233ab3d2c81c1.script [datum, redeemer, ctx] 10000]
