import LiveScripts.Shared
import LiveScripts.S_02790a1e33482988ac30ff8fac1979255556d7f3ff3c15404f3ae111.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_02790a1e33482988ac30ff8fac1979255556d7f3ff3c15404f3ae111.script [redeemer, ctx] 10000]
