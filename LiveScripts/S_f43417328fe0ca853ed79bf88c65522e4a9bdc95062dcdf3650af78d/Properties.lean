import LiveScripts.Shared
import LiveScripts.S_f43417328fe0ca853ed79bf88c65522e4a9bdc95062dcdf3650af78d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f43417328fe0ca853ed79bf88c65522e4a9bdc95062dcdf3650af78d.script [ctx] 10000]
