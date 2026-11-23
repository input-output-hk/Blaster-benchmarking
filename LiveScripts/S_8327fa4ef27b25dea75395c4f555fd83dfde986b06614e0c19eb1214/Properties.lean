import LiveScripts.Shared
import LiveScripts.S_8327fa4ef27b25dea75395c4f555fd83dfde986b06614e0c19eb1214.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8327fa4ef27b25dea75395c4f555fd83dfde986b06614e0c19eb1214.script [ctx] 10000]
