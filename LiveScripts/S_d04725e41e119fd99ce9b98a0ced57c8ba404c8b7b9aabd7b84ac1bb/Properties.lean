import LiveScripts.Shared
import LiveScripts.S_d04725e41e119fd99ce9b98a0ced57c8ba404c8b7b9aabd7b84ac1bb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d04725e41e119fd99ce9b98a0ced57c8ba404c8b7b9aabd7b84ac1bb.script [ctx] 10000]
