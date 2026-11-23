import LiveScripts.Shared
import LiveScripts.S_04fbaa660b5dd0ba16416e4cf2f5993757258646033124a88be524f3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_04fbaa660b5dd0ba16416e4cf2f5993757258646033124a88be524f3.script [ctx] 10000]
