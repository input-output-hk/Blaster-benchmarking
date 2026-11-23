import LiveScripts.Shared
import LiveScripts.S_60c72f786f3559bb706b40a86e05b08ec27c846e596716bdcc742944.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_60c72f786f3559bb706b40a86e05b08ec27c846e596716bdcc742944.script [ctx] 10000]
