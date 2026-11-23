import LiveScripts.Shared
import LiveScripts.S_d50bd72d0768948769da3967f03745019d3020e4d5cafd311dde50d4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d50bd72d0768948769da3967f03745019d3020e4d5cafd311dde50d4.script [redeemer, ctx] 10000]
