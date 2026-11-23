import LiveScripts.Shared
import LiveScripts.S_9b06fc85e5adfe2d69cab7cdeae544f9a6d2162a71ee593ef2921139.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9b06fc85e5adfe2d69cab7cdeae544f9a6d2162a71ee593ef2921139.script [ctx] 10000]
