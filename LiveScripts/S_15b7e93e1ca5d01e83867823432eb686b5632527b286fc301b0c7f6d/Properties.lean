import LiveScripts.Shared
import LiveScripts.S_15b7e93e1ca5d01e83867823432eb686b5632527b286fc301b0c7f6d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_15b7e93e1ca5d01e83867823432eb686b5632527b286fc301b0c7f6d.script [ctx] 10000]
