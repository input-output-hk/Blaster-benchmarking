import LiveScripts.Shared
import LiveScripts.S_ce8e96d395f59678928a373a7d875248fda496c78461ad832055c900.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ce8e96d395f59678928a373a7d875248fda496c78461ad832055c900.script [ctx] 10000]
