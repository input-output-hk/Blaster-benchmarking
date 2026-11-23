import LiveScripts.Shared
import LiveScripts.S_7ee8756d6138c3b66eb34d07a81449efb19740a3ac12c1aa60efe8ed.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7ee8756d6138c3b66eb34d07a81449efb19740a3ac12c1aa60efe8ed.script [ctx] 10000]
