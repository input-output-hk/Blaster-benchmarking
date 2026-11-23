import LiveScripts.Shared
import LiveScripts.S_84b4d2685752e6e6ec7f21b89c7351659d93f30e64c828f8058d4cac.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_84b4d2685752e6e6ec7f21b89c7351659d93f30e64c828f8058d4cac.script [redeemer, ctx] 10000]
