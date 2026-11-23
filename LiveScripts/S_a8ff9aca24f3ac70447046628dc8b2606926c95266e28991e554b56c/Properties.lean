import LiveScripts.Shared
import LiveScripts.S_a8ff9aca24f3ac70447046628dc8b2606926c95266e28991e554b56c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a8ff9aca24f3ac70447046628dc8b2606926c95266e28991e554b56c.script [ctx] 10000]
