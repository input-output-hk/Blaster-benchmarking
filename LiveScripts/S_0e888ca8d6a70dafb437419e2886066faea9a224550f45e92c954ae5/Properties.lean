import LiveScripts.Shared
import LiveScripts.S_0e888ca8d6a70dafb437419e2886066faea9a224550f45e92c954ae5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0e888ca8d6a70dafb437419e2886066faea9a224550f45e92c954ae5.script [ctx] 10000]
