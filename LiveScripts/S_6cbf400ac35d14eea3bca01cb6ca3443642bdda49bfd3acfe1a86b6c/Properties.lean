import LiveScripts.Shared
import LiveScripts.S_6cbf400ac35d14eea3bca01cb6ca3443642bdda49bfd3acfe1a86b6c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6cbf400ac35d14eea3bca01cb6ca3443642bdda49bfd3acfe1a86b6c.script [ctx] 10000]
