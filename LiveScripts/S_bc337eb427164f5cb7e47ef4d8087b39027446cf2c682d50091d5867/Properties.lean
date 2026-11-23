import LiveScripts.Shared
import LiveScripts.S_bc337eb427164f5cb7e47ef4d8087b39027446cf2c682d50091d5867.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bc337eb427164f5cb7e47ef4d8087b39027446cf2c682d50091d5867.script [ctx] 10000]
