import LiveScripts.Shared
import LiveScripts.S_befbcb19919ff8ce5323d123c835da8e7653a098ad482271a72b72f2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_befbcb19919ff8ce5323d123c835da8e7653a098ad482271a72b72f2.script [ctx] 10000]
