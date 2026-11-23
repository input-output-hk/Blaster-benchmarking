import LiveScripts.Shared
import LiveScripts.S_ba3992aec07b62936694315c9d526174a26a42b7588347f3446401a4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ba3992aec07b62936694315c9d526174a26a42b7588347f3446401a4.script [ctx] 10000]
