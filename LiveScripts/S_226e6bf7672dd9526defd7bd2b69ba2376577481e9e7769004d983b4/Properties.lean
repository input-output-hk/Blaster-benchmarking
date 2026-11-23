import LiveScripts.Shared
import LiveScripts.S_226e6bf7672dd9526defd7bd2b69ba2376577481e9e7769004d983b4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_226e6bf7672dd9526defd7bd2b69ba2376577481e9e7769004d983b4.script [ctx] 10000]
