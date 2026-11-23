import LiveScripts.Shared
import LiveScripts.S_a7a054cbb875e4882f1f3248a078643e66f3d00271c0a74f4d85b477.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a7a054cbb875e4882f1f3248a078643e66f3d00271c0a74f4d85b477.script [ctx] 10000]
