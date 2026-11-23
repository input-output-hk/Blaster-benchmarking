import LiveScripts.Shared
import LiveScripts.S_78d8f61e1ecd84d0490c6d2958321ecce0817c188640320f3b7be7f8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_78d8f61e1ecd84d0490c6d2958321ecce0817c188640320f3b7be7f8.script [datum, redeemer, ctx] 10000]
