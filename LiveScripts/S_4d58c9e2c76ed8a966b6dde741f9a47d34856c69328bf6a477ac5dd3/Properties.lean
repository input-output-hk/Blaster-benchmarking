import LiveScripts.Shared
import LiveScripts.S_4d58c9e2c76ed8a966b6dde741f9a47d34856c69328bf6a477ac5dd3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4d58c9e2c76ed8a966b6dde741f9a47d34856c69328bf6a477ac5dd3.script [ctx] 10000]
