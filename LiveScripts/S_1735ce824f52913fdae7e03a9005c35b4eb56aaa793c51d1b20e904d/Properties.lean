import LiveScripts.Shared
import LiveScripts.S_1735ce824f52913fdae7e03a9005c35b4eb56aaa793c51d1b20e904d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1735ce824f52913fdae7e03a9005c35b4eb56aaa793c51d1b20e904d.script [ctx] 10000]
