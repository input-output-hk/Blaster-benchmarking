import LiveScripts.Shared
import LiveScripts.S_a694861c3cbad1e438c662e6728afbcf01db5adf3767f22e6db929e4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a694861c3cbad1e438c662e6728afbcf01db5adf3767f22e6db929e4.script [ctx] 10000]
