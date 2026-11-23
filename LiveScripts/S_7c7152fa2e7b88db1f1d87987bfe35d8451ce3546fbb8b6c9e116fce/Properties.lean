import LiveScripts.Shared
import LiveScripts.S_7c7152fa2e7b88db1f1d87987bfe35d8451ce3546fbb8b6c9e116fce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7c7152fa2e7b88db1f1d87987bfe35d8451ce3546fbb8b6c9e116fce.script [ctx] 10000]
