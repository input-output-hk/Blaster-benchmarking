import LiveScripts.Shared
import LiveScripts.S_d8906ca5c7ba124a0407a32dab37b2c82b13b3dcd9111e42940dcea4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d8906ca5c7ba124a0407a32dab37b2c82b13b3dcd9111e42940dcea4.script [redeemer, ctx] 10000]
