import LiveScripts.Shared
import LiveScripts.S_28929cf014d78db7b41764c33965febfffc44abc97076e325c3a9877.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_28929cf014d78db7b41764c33965febfffc44abc97076e325c3a9877.script [ctx] 10000]
