import LiveScripts.Shared
import LiveScripts.S_cbbfafb9407b062f9d3263897d08712d2a3dd71a367182c134315dc1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cbbfafb9407b062f9d3263897d08712d2a3dd71a367182c134315dc1.script [ctx] 10000]
