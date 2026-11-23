import LiveScripts.Shared
import LiveScripts.S_842bff521e286a7e512bb9cba2516ea43cd6b4ec38743592702247cc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_842bff521e286a7e512bb9cba2516ea43cd6b4ec38743592702247cc.script [redeemer, ctx] 10000]
