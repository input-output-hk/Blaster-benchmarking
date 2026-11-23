import LiveScripts.Shared
import LiveScripts.S_07f9840cc1855457af29510a4a05d0424d75bc0a4e67cb02b8b55269.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_07f9840cc1855457af29510a4a05d0424d75bc0a4e67cb02b8b55269.script [ctx] 10000]
