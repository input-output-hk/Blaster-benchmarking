import LiveScripts.Shared
import LiveScripts.S_d150182ef4eb2b27d79cb881c463f4e384ec1749cc09c3d61d2078ed.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d150182ef4eb2b27d79cb881c463f4e384ec1749cc09c3d61d2078ed.script [ctx] 10000]
