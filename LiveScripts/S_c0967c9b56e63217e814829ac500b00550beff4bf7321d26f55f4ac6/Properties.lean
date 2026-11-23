import LiveScripts.Shared
import LiveScripts.S_c0967c9b56e63217e814829ac500b00550beff4bf7321d26f55f4ac6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c0967c9b56e63217e814829ac500b00550beff4bf7321d26f55f4ac6.script [ctx] 10000]
