import LiveScripts.Shared
import LiveScripts.S_0bec3153f57eead77974a65dacca7d1f91cdaf163f94b08566ffffc8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0bec3153f57eead77974a65dacca7d1f91cdaf163f94b08566ffffc8.script [ctx] 10000]
