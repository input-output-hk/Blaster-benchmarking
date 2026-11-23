import LiveScripts.Shared
import LiveScripts.S_1b98e5ef40ba2beeb2d90db19217d77727703fde36ff024f085a6321.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1b98e5ef40ba2beeb2d90db19217d77727703fde36ff024f085a6321.script [ctx] 10000]
