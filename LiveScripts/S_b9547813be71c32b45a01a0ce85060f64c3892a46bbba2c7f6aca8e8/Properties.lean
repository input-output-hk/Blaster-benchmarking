import LiveScripts.Shared
import LiveScripts.S_b9547813be71c32b45a01a0ce85060f64c3892a46bbba2c7f6aca8e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b9547813be71c32b45a01a0ce85060f64c3892a46bbba2c7f6aca8e8.script [ctx] 10000]
