import LiveScripts.Shared
import LiveScripts.S_3594895029c12577fb90151c02a07825faae2bc7c456ac326182e2c7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3594895029c12577fb90151c02a07825faae2bc7c456ac326182e2c7.script [datum, redeemer, ctx] 10000]
