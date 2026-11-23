import LiveScripts.Shared
import LiveScripts.S_2b48af6fd01c49d05ddee3badaba999c4cf8c41ca69c71928a3a6986.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2b48af6fd01c49d05ddee3badaba999c4cf8c41ca69c71928a3a6986.script [datum, redeemer, ctx] 10000]
