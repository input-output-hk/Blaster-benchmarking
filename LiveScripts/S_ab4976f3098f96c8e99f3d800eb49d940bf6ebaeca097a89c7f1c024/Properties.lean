import LiveScripts.Shared
import LiveScripts.S_ab4976f3098f96c8e99f3d800eb49d940bf6ebaeca097a89c7f1c024.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ab4976f3098f96c8e99f3d800eb49d940bf6ebaeca097a89c7f1c024.script [ctx] 10000]
