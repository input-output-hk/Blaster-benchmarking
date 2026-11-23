import LiveScripts.Shared
import LiveScripts.S_995420d14e9f72b6dcb60cce4c473ad5d5d68f047759ff8cf07aaf04.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_995420d14e9f72b6dcb60cce4c473ad5d5d68f047759ff8cf07aaf04.script [ctx] 10000]
