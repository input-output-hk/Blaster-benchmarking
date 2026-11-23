import LiveScripts.Shared
import LiveScripts.S_588bff228f6290f6c8308b909bac77adb82b7f6738c185008714b3b9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_588bff228f6290f6c8308b909bac77adb82b7f6738c185008714b3b9.script [redeemer, ctx] 10000]
