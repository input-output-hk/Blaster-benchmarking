import LiveScripts.Shared
import LiveScripts.S_15c51263493c61617973eb73f7a43d787f0d5d8cb4b0fea263a0ccc6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_15c51263493c61617973eb73f7a43d787f0d5d8cb4b0fea263a0ccc6.script [ctx] 10000]
