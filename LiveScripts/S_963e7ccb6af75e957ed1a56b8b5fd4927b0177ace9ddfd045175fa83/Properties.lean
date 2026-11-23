import LiveScripts.Shared
import LiveScripts.S_963e7ccb6af75e957ed1a56b8b5fd4927b0177ace9ddfd045175fa83.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_963e7ccb6af75e957ed1a56b8b5fd4927b0177ace9ddfd045175fa83.script [ctx] 10000]
