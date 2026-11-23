import LiveScripts.Shared
import LiveScripts.S_3c212bf999c50552a513ff1b0d77045ea9a437c45e30f3bfbac72674.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3c212bf999c50552a513ff1b0d77045ea9a437c45e30f3bfbac72674.script [ctx] 10000]
