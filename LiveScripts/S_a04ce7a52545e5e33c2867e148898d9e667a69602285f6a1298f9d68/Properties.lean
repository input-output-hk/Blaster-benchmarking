import LiveScripts.Shared
import LiveScripts.S_a04ce7a52545e5e33c2867e148898d9e667a69602285f6a1298f9d68.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a04ce7a52545e5e33c2867e148898d9e667a69602285f6a1298f9d68.script [redeemer, ctx] 10000]
