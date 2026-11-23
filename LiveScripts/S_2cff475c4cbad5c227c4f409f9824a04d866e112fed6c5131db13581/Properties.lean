import LiveScripts.Shared
import LiveScripts.S_2cff475c4cbad5c227c4f409f9824a04d866e112fed6c5131db13581.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2cff475c4cbad5c227c4f409f9824a04d866e112fed6c5131db13581.script [ctx] 10000]
