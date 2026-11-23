import LiveScripts.Shared
import LiveScripts.S_f28cc873561315e2fbb5369a4d8a8453b6b0f1e32f0fe3c12ede381c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f28cc873561315e2fbb5369a4d8a8453b6b0f1e32f0fe3c12ede381c.script [datum, redeemer, ctx] 10000]
