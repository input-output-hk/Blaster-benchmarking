import LiveScripts.Shared
import LiveScripts.S_55f51f745aea45ae8f432265c51660f50b9b74be6068a5a2707d9de1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_55f51f745aea45ae8f432265c51660f50b9b74be6068a5a2707d9de1.script [ctx] 10000]
