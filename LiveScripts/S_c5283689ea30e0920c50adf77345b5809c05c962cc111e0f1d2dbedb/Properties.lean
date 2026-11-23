import LiveScripts.Shared
import LiveScripts.S_c5283689ea30e0920c50adf77345b5809c05c962cc111e0f1d2dbedb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c5283689ea30e0920c50adf77345b5809c05c962cc111e0f1d2dbedb.script [datum, redeemer, ctx] 10000]
