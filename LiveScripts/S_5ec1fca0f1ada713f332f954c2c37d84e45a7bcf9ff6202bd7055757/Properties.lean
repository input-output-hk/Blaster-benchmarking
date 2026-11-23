import LiveScripts.Shared
import LiveScripts.S_5ec1fca0f1ada713f332f954c2c37d84e45a7bcf9ff6202bd7055757.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5ec1fca0f1ada713f332f954c2c37d84e45a7bcf9ff6202bd7055757.script [ctx] 10000]
