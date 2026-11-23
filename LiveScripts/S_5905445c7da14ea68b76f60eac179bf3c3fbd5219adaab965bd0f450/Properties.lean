import LiveScripts.Shared
import LiveScripts.S_5905445c7da14ea68b76f60eac179bf3c3fbd5219adaab965bd0f450.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5905445c7da14ea68b76f60eac179bf3c3fbd5219adaab965bd0f450.script [datum, redeemer, ctx] 10000]
