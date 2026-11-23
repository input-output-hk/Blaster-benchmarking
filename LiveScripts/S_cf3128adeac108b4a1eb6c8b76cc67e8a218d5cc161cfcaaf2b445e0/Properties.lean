import LiveScripts.Shared
import LiveScripts.S_cf3128adeac108b4a1eb6c8b76cc67e8a218d5cc161cfcaaf2b445e0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cf3128adeac108b4a1eb6c8b76cc67e8a218d5cc161cfcaaf2b445e0.script [datum, redeemer, ctx] 10000]
