import LiveScripts.Shared
import LiveScripts.S_494849f205a3c5765cbb152846b86ffd10d88c0f41d1da5e833449d8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_494849f205a3c5765cbb152846b86ffd10d88c0f41d1da5e833449d8.script [ctx] 10000]
