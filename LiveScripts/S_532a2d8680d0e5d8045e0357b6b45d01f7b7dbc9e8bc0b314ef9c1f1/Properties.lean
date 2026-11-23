import LiveScripts.Shared
import LiveScripts.S_532a2d8680d0e5d8045e0357b6b45d01f7b7dbc9e8bc0b314ef9c1f1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_532a2d8680d0e5d8045e0357b6b45d01f7b7dbc9e8bc0b314ef9c1f1.script [datum, redeemer, ctx] 10000]
