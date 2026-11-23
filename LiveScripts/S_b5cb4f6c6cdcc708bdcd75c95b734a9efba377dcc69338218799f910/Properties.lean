import LiveScripts.Shared
import LiveScripts.S_b5cb4f6c6cdcc708bdcd75c95b734a9efba377dcc69338218799f910.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b5cb4f6c6cdcc708bdcd75c95b734a9efba377dcc69338218799f910.script [ctx] 10000]
