import LiveScripts.Shared
import LiveScripts.S_0aa10edb016c9d596864fc2e2f9b1b96eebb0092a500cc9a562b7679.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0aa10edb016c9d596864fc2e2f9b1b96eebb0092a500cc9a562b7679.script [ctx] 10000]
