import LiveScripts.Shared
import LiveScripts.S_221ad845313837904c15a0f0107dd0cbe8bdf4a41701866dabe996e4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_221ad845313837904c15a0f0107dd0cbe8bdf4a41701866dabe996e4.script [redeemer, ctx] 10000]
