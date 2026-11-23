import LiveScripts.Shared
import LiveScripts.S_99c4a25d7b6b8097d24303cdf3fab4479decaf617ab791bf46ed9f82.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_99c4a25d7b6b8097d24303cdf3fab4479decaf617ab791bf46ed9f82.script [ctx] 10000]
