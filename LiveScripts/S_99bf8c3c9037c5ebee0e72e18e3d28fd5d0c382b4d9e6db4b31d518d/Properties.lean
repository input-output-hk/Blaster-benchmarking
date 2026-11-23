import LiveScripts.Shared
import LiveScripts.S_99bf8c3c9037c5ebee0e72e18e3d28fd5d0c382b4d9e6db4b31d518d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_99bf8c3c9037c5ebee0e72e18e3d28fd5d0c382b4d9e6db4b31d518d.script [datum, redeemer, ctx] 10000]
