import LiveScripts.Shared
import LiveScripts.S_fa6a58bbe2d0ff05534431c8e2f0ef2cbdc1602a8456e4b13c8f3077.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fa6a58bbe2d0ff05534431c8e2f0ef2cbdc1602a8456e4b13c8f3077.script [datum, redeemer, ctx] 10000]
