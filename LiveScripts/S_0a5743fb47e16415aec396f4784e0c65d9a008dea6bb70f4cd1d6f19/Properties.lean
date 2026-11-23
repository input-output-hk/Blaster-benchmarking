import LiveScripts.Shared
import LiveScripts.S_0a5743fb47e16415aec396f4784e0c65d9a008dea6bb70f4cd1d6f19.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0a5743fb47e16415aec396f4784e0c65d9a008dea6bb70f4cd1d6f19.script [ctx] 10000]
