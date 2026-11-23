import LiveScripts.Shared
import LiveScripts.S_453dca3cc4bcb4bd5e72875748ea8900d5c4b4d8e2def3979d4a28f2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_453dca3cc4bcb4bd5e72875748ea8900d5c4b4d8e2def3979d4a28f2.script [datum, redeemer, ctx] 10000]
