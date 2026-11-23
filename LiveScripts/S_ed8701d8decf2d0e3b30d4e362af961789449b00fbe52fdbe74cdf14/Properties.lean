import LiveScripts.Shared
import LiveScripts.S_ed8701d8decf2d0e3b30d4e362af961789449b00fbe52fdbe74cdf14.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ed8701d8decf2d0e3b30d4e362af961789449b00fbe52fdbe74cdf14.script [ctx] 10000]
