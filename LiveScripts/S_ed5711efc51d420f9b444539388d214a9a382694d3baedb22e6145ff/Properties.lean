import LiveScripts.Shared
import LiveScripts.S_ed5711efc51d420f9b444539388d214a9a382694d3baedb22e6145ff.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ed5711efc51d420f9b444539388d214a9a382694d3baedb22e6145ff.script [ctx] 10000]
