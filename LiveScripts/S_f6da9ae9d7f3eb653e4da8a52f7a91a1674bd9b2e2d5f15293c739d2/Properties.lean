import LiveScripts.Shared
import LiveScripts.S_f6da9ae9d7f3eb653e4da8a52f7a91a1674bd9b2e2d5f15293c739d2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f6da9ae9d7f3eb653e4da8a52f7a91a1674bd9b2e2d5f15293c739d2.script [redeemer, ctx] 10000]
