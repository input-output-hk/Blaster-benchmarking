import LiveScripts.Shared
import LiveScripts.S_3a561e401144af4f5dfeeb28ad7fe16b33e656ad5099a93e434928a4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3a561e401144af4f5dfeeb28ad7fe16b33e656ad5099a93e434928a4.script [ctx] 10000]
