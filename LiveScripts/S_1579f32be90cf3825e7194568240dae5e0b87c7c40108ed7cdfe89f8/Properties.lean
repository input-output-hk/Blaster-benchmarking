import LiveScripts.Shared
import LiveScripts.S_1579f32be90cf3825e7194568240dae5e0b87c7c40108ed7cdfe89f8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1579f32be90cf3825e7194568240dae5e0b87c7c40108ed7cdfe89f8.script [datum, redeemer, ctx] 10000]
