import LiveScripts.Shared
import LiveScripts.S_0de7ecabf1ee6e44318130d606891dd824d087528f81e2b31358d9b1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0de7ecabf1ee6e44318130d606891dd824d087528f81e2b31358d9b1.script [ctx] 10000]
