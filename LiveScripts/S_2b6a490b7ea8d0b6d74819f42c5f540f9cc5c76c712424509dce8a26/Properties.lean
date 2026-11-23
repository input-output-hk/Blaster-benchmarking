import LiveScripts.Shared
import LiveScripts.S_2b6a490b7ea8d0b6d74819f42c5f540f9cc5c76c712424509dce8a26.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2b6a490b7ea8d0b6d74819f42c5f540f9cc5c76c712424509dce8a26.script [ctx] 10000]
