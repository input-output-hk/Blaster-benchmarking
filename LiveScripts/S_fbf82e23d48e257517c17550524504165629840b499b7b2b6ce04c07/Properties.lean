import LiveScripts.Shared
import LiveScripts.S_fbf82e23d48e257517c17550524504165629840b499b7b2b6ce04c07.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fbf82e23d48e257517c17550524504165629840b499b7b2b6ce04c07.script [ctx] 10000]
