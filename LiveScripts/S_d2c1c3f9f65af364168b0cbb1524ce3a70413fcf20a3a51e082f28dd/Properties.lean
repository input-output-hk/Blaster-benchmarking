import LiveScripts.Shared
import LiveScripts.S_d2c1c3f9f65af364168b0cbb1524ce3a70413fcf20a3a51e082f28dd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d2c1c3f9f65af364168b0cbb1524ce3a70413fcf20a3a51e082f28dd.script [redeemer, ctx] 10000]
