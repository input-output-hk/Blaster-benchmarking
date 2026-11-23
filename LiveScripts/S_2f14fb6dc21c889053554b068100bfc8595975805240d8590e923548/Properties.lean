import LiveScripts.Shared
import LiveScripts.S_2f14fb6dc21c889053554b068100bfc8595975805240d8590e923548.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2f14fb6dc21c889053554b068100bfc8595975805240d8590e923548.script [datum, redeemer, ctx] 10000]
