import LiveScripts.Shared
import LiveScripts.S_37ec24e17e453a54c428b9312a5b0791a7232456835da5aeb5c4ed8a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_37ec24e17e453a54c428b9312a5b0791a7232456835da5aeb5c4ed8a.script [redeemer, ctx] 10000]
