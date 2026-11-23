import LiveScripts.Shared
import LiveScripts.S_4713a925302692076b686eee3de80963c94e464108522afacf19039c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4713a925302692076b686eee3de80963c94e464108522afacf19039c.script [ctx] 10000]
