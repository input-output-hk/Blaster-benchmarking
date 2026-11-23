import LiveScripts.Shared
import LiveScripts.S_e93ec0e79a07e6b3f30c8c9f1e6f463e86363848f5a96d66a5c25ba8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e93ec0e79a07e6b3f30c8c9f1e6f463e86363848f5a96d66a5c25ba8.script [datum, redeemer, ctx] 10000]
