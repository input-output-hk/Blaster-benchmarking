import LiveScripts.Shared
import LiveScripts.S_a3c493c1eaadf0c98f06b12658c9ec658fbc21699992839a0f5641f0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a3c493c1eaadf0c98f06b12658c9ec658fbc21699992839a0f5641f0.script [ctx] 10000]
