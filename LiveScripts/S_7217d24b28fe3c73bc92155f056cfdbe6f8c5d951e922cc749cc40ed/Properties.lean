import LiveScripts.Shared
import LiveScripts.S_7217d24b28fe3c73bc92155f056cfdbe6f8c5d951e922cc749cc40ed.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7217d24b28fe3c73bc92155f056cfdbe6f8c5d951e922cc749cc40ed.script [ctx] 10000]
