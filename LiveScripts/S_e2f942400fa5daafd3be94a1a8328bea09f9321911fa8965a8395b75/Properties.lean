import LiveScripts.Shared
import LiveScripts.S_e2f942400fa5daafd3be94a1a8328bea09f9321911fa8965a8395b75.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e2f942400fa5daafd3be94a1a8328bea09f9321911fa8965a8395b75.script [ctx] 10000]
