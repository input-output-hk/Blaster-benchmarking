import LiveScripts.Shared
import LiveScripts.S_968550ca1edefaed2b973fe522b0d06f4919503258cfde532f251af5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_968550ca1edefaed2b973fe522b0d06f4919503258cfde532f251af5.script [datum, redeemer, ctx] 10000]
