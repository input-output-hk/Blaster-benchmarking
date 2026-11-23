import LiveScripts.Shared
import LiveScripts.S_694417e4f60a21dab4b3b29bb0beeb5511e8617ea4df682db5a505ab.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_694417e4f60a21dab4b3b29bb0beeb5511e8617ea4df682db5a505ab.script [ctx] 10000]
