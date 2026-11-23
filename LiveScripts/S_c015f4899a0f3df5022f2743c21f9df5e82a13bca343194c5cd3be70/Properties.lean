import LiveScripts.Shared
import LiveScripts.S_c015f4899a0f3df5022f2743c21f9df5e82a13bca343194c5cd3be70.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c015f4899a0f3df5022f2743c21f9df5e82a13bca343194c5cd3be70.script [redeemer, ctx] 10000]
