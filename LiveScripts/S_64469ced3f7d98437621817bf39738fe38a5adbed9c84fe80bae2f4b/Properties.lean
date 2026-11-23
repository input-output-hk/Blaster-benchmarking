import LiveScripts.Shared
import LiveScripts.S_64469ced3f7d98437621817bf39738fe38a5adbed9c84fe80bae2f4b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_64469ced3f7d98437621817bf39738fe38a5adbed9c84fe80bae2f4b.script [ctx] 10000]
