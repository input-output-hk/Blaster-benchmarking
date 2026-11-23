import LiveScripts.Shared
import LiveScripts.S_eeffa9d57275c21650f4cb713cc2c42e02bab9de14d97ccfcdc43d38.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eeffa9d57275c21650f4cb713cc2c42e02bab9de14d97ccfcdc43d38.script [ctx] 10000]
