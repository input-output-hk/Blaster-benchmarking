import LiveScripts.Shared
import LiveScripts.S_0531bdfcb95f5563173d6c629cf0991d2c43ccba16caec3dff75e16b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0531bdfcb95f5563173d6c629cf0991d2c43ccba16caec3dff75e16b.script [ctx] 10000]
