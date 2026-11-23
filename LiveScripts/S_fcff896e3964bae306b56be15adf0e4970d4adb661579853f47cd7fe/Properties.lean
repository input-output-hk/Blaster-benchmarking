import LiveScripts.Shared
import LiveScripts.S_fcff896e3964bae306b56be15adf0e4970d4adb661579853f47cd7fe.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fcff896e3964bae306b56be15adf0e4970d4adb661579853f47cd7fe.script [ctx] 10000]
