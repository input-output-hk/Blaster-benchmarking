import LiveScripts.Shared
import LiveScripts.S_0fc18d7430e723e212dd29bf03745c731d71baf54177da64f93a8535.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0fc18d7430e723e212dd29bf03745c731d71baf54177da64f93a8535.script [ctx] 10000]
