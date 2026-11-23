import LiveScripts.Shared
import LiveScripts.S_612e14e2dda6f90d726d95b7c11fb74ab4d06bcebdbc83048cbf55bd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_612e14e2dda6f90d726d95b7c11fb74ab4d06bcebdbc83048cbf55bd.script [ctx] 10000]
