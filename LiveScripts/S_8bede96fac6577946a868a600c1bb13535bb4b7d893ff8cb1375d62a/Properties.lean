import LiveScripts.Shared
import LiveScripts.S_8bede96fac6577946a868a600c1bb13535bb4b7d893ff8cb1375d62a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8bede96fac6577946a868a600c1bb13535bb4b7d893ff8cb1375d62a.script [ctx] 10000]
