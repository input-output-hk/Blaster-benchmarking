import LiveScripts.Shared
import LiveScripts.S_ed3fb7e046b4f3387e0749fb46847dbc15e85e61aaa76558f968136d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ed3fb7e046b4f3387e0749fb46847dbc15e85e61aaa76558f968136d.script [ctx] 10000]
