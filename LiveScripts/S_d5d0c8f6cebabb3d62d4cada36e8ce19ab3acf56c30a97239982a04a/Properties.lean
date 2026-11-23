import LiveScripts.Shared
import LiveScripts.S_d5d0c8f6cebabb3d62d4cada36e8ce19ab3acf56c30a97239982a04a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d5d0c8f6cebabb3d62d4cada36e8ce19ab3acf56c30a97239982a04a.script [ctx] 10000]
