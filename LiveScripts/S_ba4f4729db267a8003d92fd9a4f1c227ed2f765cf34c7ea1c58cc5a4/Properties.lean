import LiveScripts.Shared
import LiveScripts.S_ba4f4729db267a8003d92fd9a4f1c227ed2f765cf34c7ea1c58cc5a4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ba4f4729db267a8003d92fd9a4f1c227ed2f765cf34c7ea1c58cc5a4.script [ctx] 10000]
