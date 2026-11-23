import LiveScripts.Shared
import LiveScripts.S_396972391648fcbe882444d12bfdb9a5946017e05a509775c8bc1bb3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_396972391648fcbe882444d12bfdb9a5946017e05a509775c8bc1bb3.script [ctx] 10000]
