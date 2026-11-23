import LiveScripts.Shared
import LiveScripts.S_8b43b26e921b8d578e83aabd234dd4b76138db5875cb9a7554867769.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8b43b26e921b8d578e83aabd234dd4b76138db5875cb9a7554867769.script [ctx] 10000]
