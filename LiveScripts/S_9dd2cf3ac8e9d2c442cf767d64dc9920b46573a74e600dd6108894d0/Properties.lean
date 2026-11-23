import LiveScripts.Shared
import LiveScripts.S_9dd2cf3ac8e9d2c442cf767d64dc9920b46573a74e600dd6108894d0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9dd2cf3ac8e9d2c442cf767d64dc9920b46573a74e600dd6108894d0.script [ctx] 10000]
