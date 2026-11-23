import LiveScripts.Shared
import LiveScripts.S_4cffc25c184b6b452b9de831da55a2b9677dc7a9b2c06b362e5ba3d8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4cffc25c184b6b452b9de831da55a2b9677dc7a9b2c06b362e5ba3d8.script [datum, redeemer, ctx] 10000]
