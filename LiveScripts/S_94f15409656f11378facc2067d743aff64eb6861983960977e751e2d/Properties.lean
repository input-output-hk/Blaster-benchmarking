import LiveScripts.Shared
import LiveScripts.S_94f15409656f11378facc2067d743aff64eb6861983960977e751e2d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_94f15409656f11378facc2067d743aff64eb6861983960977e751e2d.script [ctx] 10000]
