import LiveScripts.Shared
import LiveScripts.S_4c4d65a0616f60adc2cba70f533705233b1d7e8cb3e9868cdca39d86.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4c4d65a0616f60adc2cba70f533705233b1d7e8cb3e9868cdca39d86.script [datum, redeemer, ctx] 10000]
