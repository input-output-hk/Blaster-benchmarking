import LiveScripts.Shared
import LiveScripts.S_56fc1f0d4c8f4e4d621c6df85cb74c69985fb719da6e35d47e005e15.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_56fc1f0d4c8f4e4d621c6df85cb74c69985fb719da6e35d47e005e15.script [datum, redeemer, ctx] 10000]
