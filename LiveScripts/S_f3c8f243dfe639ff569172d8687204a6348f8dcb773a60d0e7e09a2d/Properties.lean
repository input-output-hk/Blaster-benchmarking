import LiveScripts.Shared
import LiveScripts.S_f3c8f243dfe639ff569172d8687204a6348f8dcb773a60d0e7e09a2d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f3c8f243dfe639ff569172d8687204a6348f8dcb773a60d0e7e09a2d.script [ctx] 10000]
