import LiveScripts.Shared
import LiveScripts.S_acee18e799d5b4e30046e2eaad1f75fc95997dd6ec37995f02670ccd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_acee18e799d5b4e30046e2eaad1f75fc95997dd6ec37995f02670ccd.script [datum, redeemer, ctx] 10000]
