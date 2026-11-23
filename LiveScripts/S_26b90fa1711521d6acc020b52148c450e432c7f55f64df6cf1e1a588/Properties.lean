import LiveScripts.Shared
import LiveScripts.S_26b90fa1711521d6acc020b52148c450e432c7f55f64df6cf1e1a588.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_26b90fa1711521d6acc020b52148c450e432c7f55f64df6cf1e1a588.script [ctx] 10000]
