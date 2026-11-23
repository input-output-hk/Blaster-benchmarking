import LiveScripts.Shared
import LiveScripts.S_3e0ca2b05cc18fb4427fb8d86425840ee699662efd743dd79fa0a2d3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3e0ca2b05cc18fb4427fb8d86425840ee699662efd743dd79fa0a2d3.script [datum, redeemer, ctx] 10000]
