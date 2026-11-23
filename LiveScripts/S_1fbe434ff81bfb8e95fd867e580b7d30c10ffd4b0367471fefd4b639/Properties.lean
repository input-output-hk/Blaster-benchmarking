import LiveScripts.Shared
import LiveScripts.S_1fbe434ff81bfb8e95fd867e580b7d30c10ffd4b0367471fefd4b639.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1fbe434ff81bfb8e95fd867e580b7d30c10ffd4b0367471fefd4b639.script [ctx] 10000]
