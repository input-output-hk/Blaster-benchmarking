import LiveScripts.Shared
import LiveScripts.S_5958e0869f3d4bb5c2531097f8e93ec34b78b71cccfe19cad031a3eb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5958e0869f3d4bb5c2531097f8e93ec34b78b71cccfe19cad031a3eb.script [ctx] 10000]
