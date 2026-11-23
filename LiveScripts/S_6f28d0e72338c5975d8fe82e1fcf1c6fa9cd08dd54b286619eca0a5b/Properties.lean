import LiveScripts.Shared
import LiveScripts.S_6f28d0e72338c5975d8fe82e1fcf1c6fa9cd08dd54b286619eca0a5b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f28d0e72338c5975d8fe82e1fcf1c6fa9cd08dd54b286619eca0a5b.script [redeemer, ctx] 10000]
