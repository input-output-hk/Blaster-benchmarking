import LiveScripts.Shared
import LiveScripts.S_9dfeb6ac8ded24eb42397ef651eca071bec1d8c68f12013fde670164.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9dfeb6ac8ded24eb42397ef651eca071bec1d8c68f12013fde670164.script [ctx] 10000]
