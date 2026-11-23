import LiveScripts.Shared
import LiveScripts.S_e5d5ee3cde5950edff5fc9d2b93593cec8f11092500309362fed14d2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e5d5ee3cde5950edff5fc9d2b93593cec8f11092500309362fed14d2.script [ctx] 10000]
