import LiveScripts.Shared
import LiveScripts.S_79a5a1cc913c402e22f627cb432aa45392212bcde0a22c979f7db0be.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_79a5a1cc913c402e22f627cb432aa45392212bcde0a22c979f7db0be.script [ctx] 10000]
