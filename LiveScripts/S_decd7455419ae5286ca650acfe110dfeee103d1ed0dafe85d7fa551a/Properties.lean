import LiveScripts.Shared
import LiveScripts.S_decd7455419ae5286ca650acfe110dfeee103d1ed0dafe85d7fa551a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_decd7455419ae5286ca650acfe110dfeee103d1ed0dafe85d7fa551a.script [redeemer, ctx] 10000]
