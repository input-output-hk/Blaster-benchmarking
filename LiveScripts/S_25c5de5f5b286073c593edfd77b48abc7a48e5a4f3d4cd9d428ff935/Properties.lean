import LiveScripts.Shared
import LiveScripts.S_25c5de5f5b286073c593edfd77b48abc7a48e5a4f3d4cd9d428ff935.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_25c5de5f5b286073c593edfd77b48abc7a48e5a4f3d4cd9d428ff935.script [redeemer, ctx] 10000]
