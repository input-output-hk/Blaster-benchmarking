import LiveScripts.Shared
import LiveScripts.S_e745ed48a4fd3d106af624218ad347db9a64b188f31b083264bdc88b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e745ed48a4fd3d106af624218ad347db9a64b188f31b083264bdc88b.script [ctx] 10000]
