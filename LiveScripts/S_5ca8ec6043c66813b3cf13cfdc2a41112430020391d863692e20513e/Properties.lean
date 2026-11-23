import LiveScripts.Shared
import LiveScripts.S_5ca8ec6043c66813b3cf13cfdc2a41112430020391d863692e20513e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5ca8ec6043c66813b3cf13cfdc2a41112430020391d863692e20513e.script [ctx] 10000]
