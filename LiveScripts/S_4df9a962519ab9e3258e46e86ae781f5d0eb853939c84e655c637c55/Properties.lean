import LiveScripts.Shared
import LiveScripts.S_4df9a962519ab9e3258e46e86ae781f5d0eb853939c84e655c637c55.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4df9a962519ab9e3258e46e86ae781f5d0eb853939c84e655c637c55.script [redeemer, ctx] 10000]
