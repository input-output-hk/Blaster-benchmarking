import LiveScripts.Shared
import LiveScripts.S_58cca561c98d589a89394d14e403c39c13cfe13358bfae96d6557be5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_58cca561c98d589a89394d14e403c39c13cfe13358bfae96d6557be5.script [ctx] 10000]
