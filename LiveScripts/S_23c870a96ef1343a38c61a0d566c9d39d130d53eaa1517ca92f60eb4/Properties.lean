import LiveScripts.Shared
import LiveScripts.S_23c870a96ef1343a38c61a0d566c9d39d130d53eaa1517ca92f60eb4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_23c870a96ef1343a38c61a0d566c9d39d130d53eaa1517ca92f60eb4.script [ctx] 10000]
