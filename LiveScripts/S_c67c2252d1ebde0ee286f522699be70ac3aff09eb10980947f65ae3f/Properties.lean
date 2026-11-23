import LiveScripts.Shared
import LiveScripts.S_c67c2252d1ebde0ee286f522699be70ac3aff09eb10980947f65ae3f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c67c2252d1ebde0ee286f522699be70ac3aff09eb10980947f65ae3f.script [ctx] 10000]
