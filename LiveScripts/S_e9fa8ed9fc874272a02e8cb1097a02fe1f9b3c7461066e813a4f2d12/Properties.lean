import LiveScripts.Shared
import LiveScripts.S_e9fa8ed9fc874272a02e8cb1097a02fe1f9b3c7461066e813a4f2d12.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e9fa8ed9fc874272a02e8cb1097a02fe1f9b3c7461066e813a4f2d12.script [ctx] 10000]
