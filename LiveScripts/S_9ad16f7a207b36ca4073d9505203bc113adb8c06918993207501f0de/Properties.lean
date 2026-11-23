import LiveScripts.Shared
import LiveScripts.S_9ad16f7a207b36ca4073d9505203bc113adb8c06918993207501f0de.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9ad16f7a207b36ca4073d9505203bc113adb8c06918993207501f0de.script [datum, redeemer, ctx] 10000]
