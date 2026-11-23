import LiveScripts.Shared
import LiveScripts.S_b9d8096443b92737191ccea6c2ae2c3503631073bac75f42574838b0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b9d8096443b92737191ccea6c2ae2c3503631073bac75f42574838b0.script [ctx] 10000]
