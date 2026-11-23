import LiveScripts.Shared
import LiveScripts.S_f008d0e927cc4164c40873a6dcc22965b9f0f955ed45b5f316c53ed3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f008d0e927cc4164c40873a6dcc22965b9f0f955ed45b5f316c53ed3.script [ctx] 10000]
