import LiveScripts.Shared
import LiveScripts.S_9b673b246a910cfdba752c35fd6905ba5521abe0dc534db345b3e379.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9b673b246a910cfdba752c35fd6905ba5521abe0dc534db345b3e379.script [ctx] 10000]
