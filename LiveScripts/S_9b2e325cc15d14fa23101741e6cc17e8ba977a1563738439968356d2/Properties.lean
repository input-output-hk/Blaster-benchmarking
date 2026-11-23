import LiveScripts.Shared
import LiveScripts.S_9b2e325cc15d14fa23101741e6cc17e8ba977a1563738439968356d2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9b2e325cc15d14fa23101741e6cc17e8ba977a1563738439968356d2.script [ctx] 10000]
