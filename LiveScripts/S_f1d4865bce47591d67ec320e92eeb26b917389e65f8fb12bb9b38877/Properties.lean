import LiveScripts.Shared
import LiveScripts.S_f1d4865bce47591d67ec320e92eeb26b917389e65f8fb12bb9b38877.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f1d4865bce47591d67ec320e92eeb26b917389e65f8fb12bb9b38877.script [datum, redeemer, ctx] 10000]
