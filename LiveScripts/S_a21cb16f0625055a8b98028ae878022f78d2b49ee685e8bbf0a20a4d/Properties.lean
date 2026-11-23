import LiveScripts.Shared
import LiveScripts.S_a21cb16f0625055a8b98028ae878022f78d2b49ee685e8bbf0a20a4d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a21cb16f0625055a8b98028ae878022f78d2b49ee685e8bbf0a20a4d.script [ctx] 10000]
