import LiveScripts.Shared
import LiveScripts.S_6d50ac9bbaa793fa5192a58ff40a5e2899b0cdc184618d0a1f024bd6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6d50ac9bbaa793fa5192a58ff40a5e2899b0cdc184618d0a1f024bd6.script [datum, redeemer, ctx] 10000]
