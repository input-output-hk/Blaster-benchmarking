import LiveScripts.Shared
import LiveScripts.S_1e639d88289457eda0d10cce198153ba1e182a67dd8de5388352e314.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1e639d88289457eda0d10cce198153ba1e182a67dd8de5388352e314.script [ctx] 10000]
