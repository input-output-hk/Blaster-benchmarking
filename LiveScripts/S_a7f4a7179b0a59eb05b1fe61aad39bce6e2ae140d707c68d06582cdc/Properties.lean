import LiveScripts.Shared
import LiveScripts.S_a7f4a7179b0a59eb05b1fe61aad39bce6e2ae140d707c68d06582cdc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a7f4a7179b0a59eb05b1fe61aad39bce6e2ae140d707c68d06582cdc.script [ctx] 10000]
