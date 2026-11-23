import LiveScripts.Shared
import LiveScripts.S_2aa1ae236856def55f77e6bb1aa5b43801ec0097f9e0a69fa24fc0ed.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2aa1ae236856def55f77e6bb1aa5b43801ec0097f9e0a69fa24fc0ed.script [datum, redeemer, ctx] 10000]
