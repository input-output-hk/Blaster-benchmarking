import LiveScripts.Shared
import LiveScripts.S_ea8ded36e77d9f6050fe8fe6f6c20aef12bd7f7deaff60fb64d2b6cc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ea8ded36e77d9f6050fe8fe6f6c20aef12bd7f7deaff60fb64d2b6cc.script [ctx] 10000]
