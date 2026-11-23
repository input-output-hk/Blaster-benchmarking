import LiveScripts.Shared
import LiveScripts.S_517621694bd0355dec8cc3b1860571d73f80fad05c14df435551852c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_517621694bd0355dec8cc3b1860571d73f80fad05c14df435551852c.script [ctx] 10000]
