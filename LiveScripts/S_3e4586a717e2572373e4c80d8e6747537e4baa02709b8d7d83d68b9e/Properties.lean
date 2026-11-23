import LiveScripts.Shared
import LiveScripts.S_3e4586a717e2572373e4c80d8e6747537e4baa02709b8d7d83d68b9e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3e4586a717e2572373e4c80d8e6747537e4baa02709b8d7d83d68b9e.script [ctx] 10000]
