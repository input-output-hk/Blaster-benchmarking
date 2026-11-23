import LiveScripts.Shared
import LiveScripts.S_52630854693cac06d7fb06aa45e339b24676c369aa995d888768c260.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_52630854693cac06d7fb06aa45e339b24676c369aa995d888768c260.script [redeemer, ctx] 10000]
