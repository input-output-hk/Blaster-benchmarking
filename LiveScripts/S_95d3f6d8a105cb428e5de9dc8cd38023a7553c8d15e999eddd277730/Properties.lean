import LiveScripts.Shared
import LiveScripts.S_95d3f6d8a105cb428e5de9dc8cd38023a7553c8d15e999eddd277730.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_95d3f6d8a105cb428e5de9dc8cd38023a7553c8d15e999eddd277730.script [datum, redeemer, ctx] 10000]
