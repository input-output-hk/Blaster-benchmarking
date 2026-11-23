import LiveScripts.Shared
import LiveScripts.S_d74de93a7e4940462c4509f59c712889422506f8b63dcfd0c266dc7b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d74de93a7e4940462c4509f59c712889422506f8b63dcfd0c266dc7b.script [ctx] 10000]
