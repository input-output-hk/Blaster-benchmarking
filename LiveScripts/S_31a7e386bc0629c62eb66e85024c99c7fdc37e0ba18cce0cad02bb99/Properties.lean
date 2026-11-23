import LiveScripts.Shared
import LiveScripts.S_31a7e386bc0629c62eb66e85024c99c7fdc37e0ba18cce0cad02bb99.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_31a7e386bc0629c62eb66e85024c99c7fdc37e0ba18cce0cad02bb99.script [datum, redeemer, ctx] 10000]
