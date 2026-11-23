import LiveScripts.Shared
import LiveScripts.S_0bc67e9a2ba4553040be667ef735a93412aa0003e23298af56c6571f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0bc67e9a2ba4553040be667ef735a93412aa0003e23298af56c6571f.script [ctx] 10000]
