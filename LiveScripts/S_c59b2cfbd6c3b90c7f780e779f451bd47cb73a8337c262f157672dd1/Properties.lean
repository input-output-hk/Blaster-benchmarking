import LiveScripts.Shared
import LiveScripts.S_c59b2cfbd6c3b90c7f780e779f451bd47cb73a8337c262f157672dd1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c59b2cfbd6c3b90c7f780e779f451bd47cb73a8337c262f157672dd1.script [ctx] 10000]
