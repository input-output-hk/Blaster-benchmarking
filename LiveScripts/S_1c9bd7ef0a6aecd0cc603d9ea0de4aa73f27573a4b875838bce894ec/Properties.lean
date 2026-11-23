import LiveScripts.Shared
import LiveScripts.S_1c9bd7ef0a6aecd0cc603d9ea0de4aa73f27573a4b875838bce894ec.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1c9bd7ef0a6aecd0cc603d9ea0de4aa73f27573a4b875838bce894ec.script [ctx] 10000]
