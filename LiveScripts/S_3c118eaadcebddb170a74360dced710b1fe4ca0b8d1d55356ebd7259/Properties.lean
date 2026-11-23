import LiveScripts.Shared
import LiveScripts.S_3c118eaadcebddb170a74360dced710b1fe4ca0b8d1d55356ebd7259.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3c118eaadcebddb170a74360dced710b1fe4ca0b8d1d55356ebd7259.script [ctx] 10000]
