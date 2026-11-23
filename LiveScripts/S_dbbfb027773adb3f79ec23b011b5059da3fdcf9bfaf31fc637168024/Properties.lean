import LiveScripts.Shared
import LiveScripts.S_dbbfb027773adb3f79ec23b011b5059da3fdcf9bfaf31fc637168024.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dbbfb027773adb3f79ec23b011b5059da3fdcf9bfaf31fc637168024.script [datum, redeemer, ctx] 10000]
