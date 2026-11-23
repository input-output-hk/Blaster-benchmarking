import LiveScripts.Shared
import LiveScripts.S_aca4083ff40fe65cd938ad4bb3f0dced138dba21529b9eb216033c8d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aca4083ff40fe65cd938ad4bb3f0dced138dba21529b9eb216033c8d.script [ctx] 10000]
