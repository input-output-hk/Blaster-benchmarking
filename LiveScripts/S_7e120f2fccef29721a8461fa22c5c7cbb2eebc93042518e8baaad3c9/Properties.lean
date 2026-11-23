import LiveScripts.Shared
import LiveScripts.S_7e120f2fccef29721a8461fa22c5c7cbb2eebc93042518e8baaad3c9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7e120f2fccef29721a8461fa22c5c7cbb2eebc93042518e8baaad3c9.script [ctx] 10000]
