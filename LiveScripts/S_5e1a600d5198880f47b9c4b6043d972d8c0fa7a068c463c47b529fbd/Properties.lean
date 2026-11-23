import LiveScripts.Shared
import LiveScripts.S_5e1a600d5198880f47b9c4b6043d972d8c0fa7a068c463c47b529fbd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5e1a600d5198880f47b9c4b6043d972d8c0fa7a068c463c47b529fbd.script [ctx] 10000]
