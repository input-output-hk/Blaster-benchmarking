import LiveScripts.Shared
import LiveScripts.S_c086509c779aedb5e7827f26c80a92e9237f4b045e84ac20a7ca3435.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c086509c779aedb5e7827f26c80a92e9237f4b045e84ac20a7ca3435.script [datum, redeemer, ctx] 10000]
