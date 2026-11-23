import LiveScripts.Shared
import LiveScripts.S_543740d898d0cda14f9e6e24800b311ce159a133e09a5b43e0dbae54.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_543740d898d0cda14f9e6e24800b311ce159a133e09a5b43e0dbae54.script [datum, redeemer, ctx] 10000]
