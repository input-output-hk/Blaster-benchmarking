import LiveScripts.Shared
import LiveScripts.S_703cb26d5a14df5724f6f7ab2f5145d8180daee31c93e365c6bf1bc7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_703cb26d5a14df5724f6f7ab2f5145d8180daee31c93e365c6bf1bc7.script [ctx] 10000]
