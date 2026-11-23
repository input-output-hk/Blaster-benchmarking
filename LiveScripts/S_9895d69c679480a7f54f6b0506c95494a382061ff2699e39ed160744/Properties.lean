import LiveScripts.Shared
import LiveScripts.S_9895d69c679480a7f54f6b0506c95494a382061ff2699e39ed160744.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9895d69c679480a7f54f6b0506c95494a382061ff2699e39ed160744.script [ctx] 10000]
