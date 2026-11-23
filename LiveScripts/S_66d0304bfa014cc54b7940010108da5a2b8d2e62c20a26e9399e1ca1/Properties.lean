import LiveScripts.Shared
import LiveScripts.S_66d0304bfa014cc54b7940010108da5a2b8d2e62c20a26e9399e1ca1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_66d0304bfa014cc54b7940010108da5a2b8d2e62c20a26e9399e1ca1.script [ctx] 10000]
