import LiveScripts.Shared
import LiveScripts.S_fe066e4d2fbeb7903666ca21356af699decdfd32ba1e15d3b7f73968.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fe066e4d2fbeb7903666ca21356af699decdfd32ba1e15d3b7f73968.script [ctx] 10000]
