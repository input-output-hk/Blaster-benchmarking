import LiveScripts.Shared
import LiveScripts.S_da9bd639aa6f0a63d7cba0992c7638cf2baf80aa5c518ec60550f3ad.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_da9bd639aa6f0a63d7cba0992c7638cf2baf80aa5c518ec60550f3ad.script [ctx] 10000]
