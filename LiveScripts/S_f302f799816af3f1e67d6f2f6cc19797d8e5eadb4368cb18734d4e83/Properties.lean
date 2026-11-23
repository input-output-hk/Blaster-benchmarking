import LiveScripts.Shared
import LiveScripts.S_f302f799816af3f1e67d6f2f6cc19797d8e5eadb4368cb18734d4e83.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f302f799816af3f1e67d6f2f6cc19797d8e5eadb4368cb18734d4e83.script [ctx] 10000]
