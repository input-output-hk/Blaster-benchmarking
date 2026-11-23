import LiveScripts.Shared
import LiveScripts.S_90924c21b3572838a9e75a2e2319ae9808481b54694049227cf7b568.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_90924c21b3572838a9e75a2e2319ae9808481b54694049227cf7b568.script [ctx] 10000]
