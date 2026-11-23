import LiveScripts.Shared
import LiveScripts.S_06f3826bd76b498368b1f64a222946fc121000903b4d371d68852add.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_06f3826bd76b498368b1f64a222946fc121000903b4d371d68852add.script [datum, redeemer, ctx] 10000]
