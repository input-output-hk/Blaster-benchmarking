import LiveScripts.Shared
import LiveScripts.S_93df43c614ef384be9138d92d0bca38ce34ea20d7f13e3fbaf9180a3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_93df43c614ef384be9138d92d0bca38ce34ea20d7f13e3fbaf9180a3.script [ctx] 10000]
