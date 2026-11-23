import LiveScripts.Shared
import LiveScripts.S_6a5cc1df4295d4deb9637414b371a1b47abc7dd202065fb01f79a2b8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6a5cc1df4295d4deb9637414b371a1b47abc7dd202065fb01f79a2b8.script [ctx] 10000]
