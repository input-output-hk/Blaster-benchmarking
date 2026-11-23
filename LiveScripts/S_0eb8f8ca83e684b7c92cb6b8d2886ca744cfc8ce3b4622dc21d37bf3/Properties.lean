import LiveScripts.Shared
import LiveScripts.S_0eb8f8ca83e684b7c92cb6b8d2886ca744cfc8ce3b4622dc21d37bf3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0eb8f8ca83e684b7c92cb6b8d2886ca744cfc8ce3b4622dc21d37bf3.script [redeemer, ctx] 10000]
