import LiveScripts.Shared
import LiveScripts.S_8e9b1551c1057f857f52ee733f8076fe791d7102b252adec4ceb974a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8e9b1551c1057f857f52ee733f8076fe791d7102b252adec4ceb974a.script [datum, redeemer, ctx] 10000]
