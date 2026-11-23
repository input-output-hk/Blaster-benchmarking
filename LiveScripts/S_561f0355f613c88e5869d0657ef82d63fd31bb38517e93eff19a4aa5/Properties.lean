import LiveScripts.Shared
import LiveScripts.S_561f0355f613c88e5869d0657ef82d63fd31bb38517e93eff19a4aa5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_561f0355f613c88e5869d0657ef82d63fd31bb38517e93eff19a4aa5.script [ctx] 10000]
