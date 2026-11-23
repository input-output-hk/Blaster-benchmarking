import LiveScripts.Shared
import LiveScripts.S_0cd585246a46ce0229669b55461079227a4ccbe5f3b8d86e27b31f09.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0cd585246a46ce0229669b55461079227a4ccbe5f3b8d86e27b31f09.script [datum, redeemer, ctx] 10000]
