import LiveScripts.Shared
import LiveScripts.S_06d4ac7c42f3cfd00b3b932332519f71a87acddd89a96f67d0d30d57.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_06d4ac7c42f3cfd00b3b932332519f71a87acddd89a96f67d0d30d57.script [ctx] 10000]
