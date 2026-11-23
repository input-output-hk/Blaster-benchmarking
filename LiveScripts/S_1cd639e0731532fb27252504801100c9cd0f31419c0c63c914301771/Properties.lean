import LiveScripts.Shared
import LiveScripts.S_1cd639e0731532fb27252504801100c9cd0f31419c0c63c914301771.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1cd639e0731532fb27252504801100c9cd0f31419c0c63c914301771.script [datum, redeemer, ctx] 10000]
