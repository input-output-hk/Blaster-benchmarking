import LiveScripts.Shared
import LiveScripts.S_74de4f3a208d9cd11730357d681b87b640fb67dd128452cd0f754d52.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_74de4f3a208d9cd11730357d681b87b640fb67dd128452cd0f754d52.script [ctx] 10000]
