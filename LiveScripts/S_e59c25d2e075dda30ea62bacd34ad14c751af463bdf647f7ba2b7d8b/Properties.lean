import LiveScripts.Shared
import LiveScripts.S_e59c25d2e075dda30ea62bacd34ad14c751af463bdf647f7ba2b7d8b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e59c25d2e075dda30ea62bacd34ad14c751af463bdf647f7ba2b7d8b.script [ctx] 10000]
