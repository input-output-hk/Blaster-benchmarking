import LiveScripts.Shared
import LiveScripts.S_6d4c3774fb9efb420e41ed62a3445b65e68ef1f51432e030de44eb7a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6d4c3774fb9efb420e41ed62a3445b65e68ef1f51432e030de44eb7a.script [ctx] 10000]
