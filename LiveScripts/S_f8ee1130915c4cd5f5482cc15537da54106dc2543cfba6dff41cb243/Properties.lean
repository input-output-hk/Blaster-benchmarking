import LiveScripts.Shared
import LiveScripts.S_f8ee1130915c4cd5f5482cc15537da54106dc2543cfba6dff41cb243.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f8ee1130915c4cd5f5482cc15537da54106dc2543cfba6dff41cb243.script [ctx] 10000]
