import LiveScripts.Shared
import LiveScripts.S_8c05c41c326e25989feb2c344f07da27c05166c1e7495f822f976719.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8c05c41c326e25989feb2c344f07da27c05166c1e7495f822f976719.script [ctx] 10000]
