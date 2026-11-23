import LiveScripts.Shared
import LiveScripts.S_811094657656b96d19e9cbd2a12803a2b32c1e17513712614edc2307.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_811094657656b96d19e9cbd2a12803a2b32c1e17513712614edc2307.script [ctx] 10000]
