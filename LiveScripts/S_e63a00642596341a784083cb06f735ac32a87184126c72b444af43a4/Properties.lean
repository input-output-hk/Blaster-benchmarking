import LiveScripts.Shared
import LiveScripts.S_e63a00642596341a784083cb06f735ac32a87184126c72b444af43a4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e63a00642596341a784083cb06f735ac32a87184126c72b444af43a4.script [ctx] 10000]
