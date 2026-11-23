import LiveScripts.Shared
import LiveScripts.S_09ffee3077d1f7fd4ca93090c6d2461324d505706e60be19d8553d76.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_09ffee3077d1f7fd4ca93090c6d2461324d505706e60be19d8553d76.script [ctx] 10000]
