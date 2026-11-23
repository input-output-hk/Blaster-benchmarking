import LiveScripts.Shared
import LiveScripts.S_aadd6ebebadc62c4881949c489c0bb8224aa5310875359b59e5feb4f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aadd6ebebadc62c4881949c489c0bb8224aa5310875359b59e5feb4f.script [ctx] 10000]
