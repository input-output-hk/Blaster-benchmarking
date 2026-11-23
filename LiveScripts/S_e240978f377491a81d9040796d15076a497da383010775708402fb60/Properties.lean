import LiveScripts.Shared
import LiveScripts.S_e240978f377491a81d9040796d15076a497da383010775708402fb60.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e240978f377491a81d9040796d15076a497da383010775708402fb60.script [ctx] 10000]
