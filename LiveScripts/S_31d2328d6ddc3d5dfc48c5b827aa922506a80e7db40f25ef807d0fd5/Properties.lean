import LiveScripts.Shared
import LiveScripts.S_31d2328d6ddc3d5dfc48c5b827aa922506a80e7db40f25ef807d0fd5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_31d2328d6ddc3d5dfc48c5b827aa922506a80e7db40f25ef807d0fd5.script [ctx] 10000]
