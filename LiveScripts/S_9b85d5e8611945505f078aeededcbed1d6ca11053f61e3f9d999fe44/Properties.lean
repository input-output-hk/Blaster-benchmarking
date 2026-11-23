import LiveScripts.Shared
import LiveScripts.S_9b85d5e8611945505f078aeededcbed1d6ca11053f61e3f9d999fe44.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9b85d5e8611945505f078aeededcbed1d6ca11053f61e3f9d999fe44.script [datum, redeemer, ctx] 10000]
