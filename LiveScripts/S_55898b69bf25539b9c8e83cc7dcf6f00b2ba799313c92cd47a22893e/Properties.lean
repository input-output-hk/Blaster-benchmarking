import LiveScripts.Shared
import LiveScripts.S_55898b69bf25539b9c8e83cc7dcf6f00b2ba799313c92cd47a22893e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_55898b69bf25539b9c8e83cc7dcf6f00b2ba799313c92cd47a22893e.script [ctx] 10000]
