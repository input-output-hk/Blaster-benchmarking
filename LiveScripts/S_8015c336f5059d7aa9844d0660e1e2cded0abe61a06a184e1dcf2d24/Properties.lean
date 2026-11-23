import LiveScripts.Shared
import LiveScripts.S_8015c336f5059d7aa9844d0660e1e2cded0abe61a06a184e1dcf2d24.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8015c336f5059d7aa9844d0660e1e2cded0abe61a06a184e1dcf2d24.script [ctx] 10000]
