import LiveScripts.Shared
import LiveScripts.S_1cf51a54448953d94591dca4132652874cb41ffd0087c633ec3640b3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1cf51a54448953d94591dca4132652874cb41ffd0087c633ec3640b3.script [ctx] 10000]
