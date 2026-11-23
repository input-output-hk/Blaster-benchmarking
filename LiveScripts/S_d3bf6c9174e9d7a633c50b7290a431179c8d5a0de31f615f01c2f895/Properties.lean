import LiveScripts.Shared
import LiveScripts.S_d3bf6c9174e9d7a633c50b7290a431179c8d5a0de31f615f01c2f895.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d3bf6c9174e9d7a633c50b7290a431179c8d5a0de31f615f01c2f895.script [datum, redeemer, ctx] 10000]
