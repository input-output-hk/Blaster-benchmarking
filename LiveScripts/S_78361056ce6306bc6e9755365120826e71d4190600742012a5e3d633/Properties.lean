import LiveScripts.Shared
import LiveScripts.S_78361056ce6306bc6e9755365120826e71d4190600742012a5e3d633.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_78361056ce6306bc6e9755365120826e71d4190600742012a5e3d633.script [ctx] 10000]
