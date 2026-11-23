import LiveScripts.Shared
import LiveScripts.S_dae4b059c19b0d0f1ac034ebb7334739511ae977c86468a27aeac44e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dae4b059c19b0d0f1ac034ebb7334739511ae977c86468a27aeac44e.script [ctx] 10000]
