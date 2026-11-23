import LiveScripts.Shared
import LiveScripts.S_ad0fe826d37cab5cc03d06603f0fb20773cb063b74a61aa11e6c8058.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ad0fe826d37cab5cc03d06603f0fb20773cb063b74a61aa11e6c8058.script [ctx] 10000]
