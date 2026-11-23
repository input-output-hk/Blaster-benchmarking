import LiveScripts.Shared
import LiveScripts.S_3429463efbc284ce2e409da6a666c209c0bfa5b06ac13b2a7344da18.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3429463efbc284ce2e409da6a666c209c0bfa5b06ac13b2a7344da18.script [datum, redeemer, ctx] 10000]
