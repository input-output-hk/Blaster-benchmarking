import LiveScripts.Shared
import LiveScripts.S_a44517f333685fba53a2104b9525e4a754a95e442a8cfa55551d4b2b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a44517f333685fba53a2104b9525e4a754a95e442a8cfa55551d4b2b.script [redeemer, ctx] 10000]
