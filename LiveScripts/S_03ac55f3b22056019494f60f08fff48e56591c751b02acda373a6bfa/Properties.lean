import LiveScripts.Shared
import LiveScripts.S_03ac55f3b22056019494f60f08fff48e56591c751b02acda373a6bfa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_03ac55f3b22056019494f60f08fff48e56591c751b02acda373a6bfa.script [ctx] 10000]
