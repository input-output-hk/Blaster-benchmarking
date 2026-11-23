import LiveScripts.Shared
import LiveScripts.S_4c95d4ab33e859cc1f379a2f0dda7a5719b90127005b67443a20cc10.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4c95d4ab33e859cc1f379a2f0dda7a5719b90127005b67443a20cc10.script [ctx] 10000]
