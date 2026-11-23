import LiveScripts.Shared
import LiveScripts.S_b575da974ec756ba2afdccdc07cbd1839acaf0a24c4f80afd81d3fb6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b575da974ec756ba2afdccdc07cbd1839acaf0a24c4f80afd81d3fb6.script [datum, redeemer, ctx] 10000]
