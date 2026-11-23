import LiveScripts.Shared
import LiveScripts.S_610ddd7df856940b701012e936a5b816d0d30398965856f4bfa24945.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_610ddd7df856940b701012e936a5b816d0d30398965856f4bfa24945.script [datum, redeemer, ctx] 10000]
