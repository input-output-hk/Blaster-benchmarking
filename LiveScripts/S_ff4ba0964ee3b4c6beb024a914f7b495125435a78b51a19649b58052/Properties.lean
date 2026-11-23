import LiveScripts.Shared
import LiveScripts.S_ff4ba0964ee3b4c6beb024a914f7b495125435a78b51a19649b58052.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ff4ba0964ee3b4c6beb024a914f7b495125435a78b51a19649b58052.script [redeemer, ctx] 10000]
