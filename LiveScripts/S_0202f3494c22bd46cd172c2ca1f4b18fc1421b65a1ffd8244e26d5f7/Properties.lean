import LiveScripts.Shared
import LiveScripts.S_0202f3494c22bd46cd172c2ca1f4b18fc1421b65a1ffd8244e26d5f7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0202f3494c22bd46cd172c2ca1f4b18fc1421b65a1ffd8244e26d5f7.script [datum, redeemer, ctx] 10000]
