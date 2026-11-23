import LiveScripts.Shared
import LiveScripts.S_65302bbfb05636b784c9b95abf6dd619931e7a5c3f3c7b6fb08d2faf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_65302bbfb05636b784c9b95abf6dd619931e7a5c3f3c7b6fb08d2faf.script [datum, redeemer, ctx] 10000]
