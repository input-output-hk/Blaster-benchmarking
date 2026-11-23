import LiveScripts.Shared
import LiveScripts.S_134e32c1a707ac2d9950263957d3133f6b46f7bf85141db32ec6586b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_134e32c1a707ac2d9950263957d3133f6b46f7bf85141db32ec6586b.script [redeemer, ctx] 10000]
