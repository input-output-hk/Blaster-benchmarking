import LiveScripts.Shared
import LiveScripts.S_2c0f418d944902f96424cbc65283a18bd16f29386a4912bda3d8f1f8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2c0f418d944902f96424cbc65283a18bd16f29386a4912bda3d8f1f8.script [datum, redeemer, ctx] 10000]
