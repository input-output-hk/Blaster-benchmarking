import LiveScripts.Shared
import LiveScripts.S_d4f20108f6b8bbaf61190794d0ae98d6c394748c80cf0b7c1044206e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d4f20108f6b8bbaf61190794d0ae98d6c394748c80cf0b7c1044206e.script [ctx] 10000]
