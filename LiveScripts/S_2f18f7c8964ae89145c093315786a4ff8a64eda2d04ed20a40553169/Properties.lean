import LiveScripts.Shared
import LiveScripts.S_2f18f7c8964ae89145c093315786a4ff8a64eda2d04ed20a40553169.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2f18f7c8964ae89145c093315786a4ff8a64eda2d04ed20a40553169.script [datum, redeemer, ctx] 10000]
