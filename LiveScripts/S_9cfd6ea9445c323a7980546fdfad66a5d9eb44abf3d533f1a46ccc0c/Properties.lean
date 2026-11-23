import LiveScripts.Shared
import LiveScripts.S_9cfd6ea9445c323a7980546fdfad66a5d9eb44abf3d533f1a46ccc0c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9cfd6ea9445c323a7980546fdfad66a5d9eb44abf3d533f1a46ccc0c.script [ctx] 10000]
