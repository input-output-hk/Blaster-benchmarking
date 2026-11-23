import LiveScripts.Shared
import LiveScripts.S_09a373a82abf0f2577700dde990fa9d8deace63127827f007b5ed020.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_09a373a82abf0f2577700dde990fa9d8deace63127827f007b5ed020.script [ctx] 10000]
