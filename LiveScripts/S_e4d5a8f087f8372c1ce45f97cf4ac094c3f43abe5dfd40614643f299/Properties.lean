import LiveScripts.Shared
import LiveScripts.S_e4d5a8f087f8372c1ce45f97cf4ac094c3f43abe5dfd40614643f299.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e4d5a8f087f8372c1ce45f97cf4ac094c3f43abe5dfd40614643f299.script [ctx] 10000]
