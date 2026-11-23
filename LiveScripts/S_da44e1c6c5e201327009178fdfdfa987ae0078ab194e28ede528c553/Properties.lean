import LiveScripts.Shared
import LiveScripts.S_da44e1c6c5e201327009178fdfdfa987ae0078ab194e28ede528c553.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_da44e1c6c5e201327009178fdfdfa987ae0078ab194e28ede528c553.script [ctx] 10000]
