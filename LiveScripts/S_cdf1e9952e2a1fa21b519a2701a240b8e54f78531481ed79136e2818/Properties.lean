import LiveScripts.Shared
import LiveScripts.S_cdf1e9952e2a1fa21b519a2701a240b8e54f78531481ed79136e2818.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cdf1e9952e2a1fa21b519a2701a240b8e54f78531481ed79136e2818.script [ctx] 10000]
