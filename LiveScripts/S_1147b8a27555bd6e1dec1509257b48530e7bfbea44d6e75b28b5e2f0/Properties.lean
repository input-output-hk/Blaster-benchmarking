import LiveScripts.Shared
import LiveScripts.S_1147b8a27555bd6e1dec1509257b48530e7bfbea44d6e75b28b5e2f0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1147b8a27555bd6e1dec1509257b48530e7bfbea44d6e75b28b5e2f0.script [ctx] 10000]
