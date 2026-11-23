import LiveScripts.Shared
import LiveScripts.S_58d33b5203a1a5a4157cab5503ae579f5277dacf7fa07dccb428cc59.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_58d33b5203a1a5a4157cab5503ae579f5277dacf7fa07dccb428cc59.script [datum, redeemer, ctx] 10000]
