import LiveScripts.Shared
import LiveScripts.S_41223b3ecf502363dc465dce5ad6671b83ac790e229d3f49e68c3353.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_41223b3ecf502363dc465dce5ad6671b83ac790e229d3f49e68c3353.script [redeemer, ctx] 10000]
