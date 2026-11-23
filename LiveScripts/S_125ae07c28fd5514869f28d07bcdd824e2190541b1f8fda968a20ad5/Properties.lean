import LiveScripts.Shared
import LiveScripts.S_125ae07c28fd5514869f28d07bcdd824e2190541b1f8fda968a20ad5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_125ae07c28fd5514869f28d07bcdd824e2190541b1f8fda968a20ad5.script [ctx] 10000]
