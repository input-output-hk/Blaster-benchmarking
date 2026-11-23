import LiveScripts.Shared
import LiveScripts.S_4503652bb9e205f73fd3fe47ba5ddafb9ae15ca7c0cfa77ab33e500b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4503652bb9e205f73fd3fe47ba5ddafb9ae15ca7c0cfa77ab33e500b.script [redeemer, ctx] 10000]
