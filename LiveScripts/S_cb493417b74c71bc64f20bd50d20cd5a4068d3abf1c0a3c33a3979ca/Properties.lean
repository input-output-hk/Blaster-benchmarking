import LiveScripts.Shared
import LiveScripts.S_cb493417b74c71bc64f20bd50d20cd5a4068d3abf1c0a3c33a3979ca.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cb493417b74c71bc64f20bd50d20cd5a4068d3abf1c0a3c33a3979ca.script [ctx] 10000]
