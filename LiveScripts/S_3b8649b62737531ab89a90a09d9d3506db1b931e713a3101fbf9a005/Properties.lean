import LiveScripts.Shared
import LiveScripts.S_3b8649b62737531ab89a90a09d9d3506db1b931e713a3101fbf9a005.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3b8649b62737531ab89a90a09d9d3506db1b931e713a3101fbf9a005.script [ctx] 10000]
