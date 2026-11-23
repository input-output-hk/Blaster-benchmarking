import LiveScripts.Shared
import LiveScripts.S_ea5c6035bcfd83a92c04eff0008b6fd02efac6a20e0abdaebaee2808.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ea5c6035bcfd83a92c04eff0008b6fd02efac6a20e0abdaebaee2808.script [redeemer, ctx] 10000]
