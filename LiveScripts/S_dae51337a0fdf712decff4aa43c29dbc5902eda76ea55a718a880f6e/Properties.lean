import LiveScripts.Shared
import LiveScripts.S_dae51337a0fdf712decff4aa43c29dbc5902eda76ea55a718a880f6e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dae51337a0fdf712decff4aa43c29dbc5902eda76ea55a718a880f6e.script [datum, redeemer, ctx] 10000]
