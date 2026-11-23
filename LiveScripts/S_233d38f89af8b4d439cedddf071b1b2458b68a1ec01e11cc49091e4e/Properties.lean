import LiveScripts.Shared
import LiveScripts.S_233d38f89af8b4d439cedddf071b1b2458b68a1ec01e11cc49091e4e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_233d38f89af8b4d439cedddf071b1b2458b68a1ec01e11cc49091e4e.script [ctx] 10000]
