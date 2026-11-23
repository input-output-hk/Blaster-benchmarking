import LiveScripts.Shared
import LiveScripts.S_9cf457f26a201e775346d34e37df280a0147b70bd02839d97e28f1ce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9cf457f26a201e775346d34e37df280a0147b70bd02839d97e28f1ce.script [ctx] 10000]
