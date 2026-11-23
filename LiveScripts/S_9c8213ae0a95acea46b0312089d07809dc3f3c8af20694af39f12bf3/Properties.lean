import LiveScripts.Shared
import LiveScripts.S_9c8213ae0a95acea46b0312089d07809dc3f3c8af20694af39f12bf3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9c8213ae0a95acea46b0312089d07809dc3f3c8af20694af39f12bf3.script [datum, redeemer, ctx] 10000]
