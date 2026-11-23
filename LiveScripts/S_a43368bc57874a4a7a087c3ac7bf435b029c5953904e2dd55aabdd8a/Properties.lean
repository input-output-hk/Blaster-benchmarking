import LiveScripts.Shared
import LiveScripts.S_a43368bc57874a4a7a087c3ac7bf435b029c5953904e2dd55aabdd8a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a43368bc57874a4a7a087c3ac7bf435b029c5953904e2dd55aabdd8a.script [ctx] 10000]
