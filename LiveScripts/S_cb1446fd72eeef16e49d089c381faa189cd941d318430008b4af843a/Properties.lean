import LiveScripts.Shared
import LiveScripts.S_cb1446fd72eeef16e49d089c381faa189cd941d318430008b4af843a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cb1446fd72eeef16e49d089c381faa189cd941d318430008b4af843a.script [datum, redeemer, ctx] 10000]
