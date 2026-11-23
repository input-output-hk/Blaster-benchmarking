import LiveScripts.Shared
import LiveScripts.S_c515bfddb362fda03b4345416a48d5fc4ff66e02fd7b94ca0012c9a3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c515bfddb362fda03b4345416a48d5fc4ff66e02fd7b94ca0012c9a3.script [ctx] 10000]
