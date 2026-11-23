import LiveScripts.Shared
import LiveScripts.S_b09775cba66375b3287233c6f809036c066937d05254df82c2e4cfd3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b09775cba66375b3287233c6f809036c066937d05254df82c2e4cfd3.script [datum, redeemer, ctx] 10000]
