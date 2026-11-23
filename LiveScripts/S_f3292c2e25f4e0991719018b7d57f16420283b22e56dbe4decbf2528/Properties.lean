import LiveScripts.Shared
import LiveScripts.S_f3292c2e25f4e0991719018b7d57f16420283b22e56dbe4decbf2528.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f3292c2e25f4e0991719018b7d57f16420283b22e56dbe4decbf2528.script [ctx] 10000]
