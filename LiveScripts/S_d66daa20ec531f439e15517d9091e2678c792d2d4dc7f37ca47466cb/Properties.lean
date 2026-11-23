import LiveScripts.Shared
import LiveScripts.S_d66daa20ec531f439e15517d9091e2678c792d2d4dc7f37ca47466cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d66daa20ec531f439e15517d9091e2678c792d2d4dc7f37ca47466cb.script [ctx] 10000]
