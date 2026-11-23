import LiveScripts.Shared
import LiveScripts.S_6a06ed7e02a5eab96a7943635546f1657cc5b8e595e130486860f3c3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6a06ed7e02a5eab96a7943635546f1657cc5b8e595e130486860f3c3.script [ctx] 10000]
