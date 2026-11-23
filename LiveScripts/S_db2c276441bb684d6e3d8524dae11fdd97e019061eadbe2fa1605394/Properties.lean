import LiveScripts.Shared
import LiveScripts.S_db2c276441bb684d6e3d8524dae11fdd97e019061eadbe2fa1605394.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_db2c276441bb684d6e3d8524dae11fdd97e019061eadbe2fa1605394.script [ctx] 10000]
