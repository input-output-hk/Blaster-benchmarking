import LiveScripts.Shared
import LiveScripts.S_5aabbbea2f38db0031c07fe4654107710bc6a67ede0736508f04f6ce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5aabbbea2f38db0031c07fe4654107710bc6a67ede0736508f04f6ce.script [ctx] 10000]
