import LiveScripts.Shared
import LiveScripts.S_611b94423b6abb20405b9e874a9e527291c32daf80698ff244546568.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_611b94423b6abb20405b9e874a9e527291c32daf80698ff244546568.script [redeemer, ctx] 10000]
