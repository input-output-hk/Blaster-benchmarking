import LiveScripts.Shared
import LiveScripts.S_338167df66231d6a89ead058f7d3366fce2d0a278612d003989cc0f4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_338167df66231d6a89ead058f7d3366fce2d0a278612d003989cc0f4.script [ctx] 10000]
