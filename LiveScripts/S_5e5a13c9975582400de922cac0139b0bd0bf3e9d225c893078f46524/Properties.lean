import LiveScripts.Shared
import LiveScripts.S_5e5a13c9975582400de922cac0139b0bd0bf3e9d225c893078f46524.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5e5a13c9975582400de922cac0139b0bd0bf3e9d225c893078f46524.script [datum, redeemer, ctx] 10000]
