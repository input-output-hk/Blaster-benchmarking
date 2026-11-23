import LiveScripts.Shared
import LiveScripts.S_ae2c33fc2d423e4baf39de83e66d475efbcd57f3f957c99bf659c83e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ae2c33fc2d423e4baf39de83e66d475efbcd57f3f957c99bf659c83e.script [ctx] 10000]
