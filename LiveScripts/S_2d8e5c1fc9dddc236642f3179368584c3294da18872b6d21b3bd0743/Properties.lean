import LiveScripts.Shared
import LiveScripts.S_2d8e5c1fc9dddc236642f3179368584c3294da18872b6d21b3bd0743.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2d8e5c1fc9dddc236642f3179368584c3294da18872b6d21b3bd0743.script [datum, redeemer, ctx] 10000]
