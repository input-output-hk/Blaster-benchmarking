import LiveScripts.Shared
import LiveScripts.S_99d006a6611bfa1dbaa9852aa1f9adf8ce4d20e36a2e52eac28f7fd9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_99d006a6611bfa1dbaa9852aa1f9adf8ce4d20e36a2e52eac28f7fd9.script [ctx] 10000]
