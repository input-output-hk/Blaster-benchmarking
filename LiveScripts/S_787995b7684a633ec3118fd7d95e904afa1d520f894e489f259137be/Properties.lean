import LiveScripts.Shared
import LiveScripts.S_787995b7684a633ec3118fd7d95e904afa1d520f894e489f259137be.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_787995b7684a633ec3118fd7d95e904afa1d520f894e489f259137be.script [ctx] 10000]
