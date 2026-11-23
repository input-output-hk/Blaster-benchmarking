import LiveScripts.Shared
import LiveScripts.S_279d91a45e494de463bc3701bbd7eba04a13882cfbe2f8d72b2a3ed6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_279d91a45e494de463bc3701bbd7eba04a13882cfbe2f8d72b2a3ed6.script [redeemer, ctx] 10000]
