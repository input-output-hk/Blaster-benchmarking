import LiveScripts.Shared
import LiveScripts.S_d0ad49d646d73205c3dc88c31f786752fa38b06a2e10d7bdf1f73352.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d0ad49d646d73205c3dc88c31f786752fa38b06a2e10d7bdf1f73352.script [ctx] 10000]
