import LiveScripts.Shared
import LiveScripts.S_998c492302cc5af668a5b11ff4938195fe80d541e06e8a5da25695d9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_998c492302cc5af668a5b11ff4938195fe80d541e06e8a5da25695d9.script [ctx] 10000]
