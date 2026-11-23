import LiveScripts.Shared
import LiveScripts.S_4f59b412e8918dfa481e57e859b259e8007fa9675cf5f154691faef3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4f59b412e8918dfa481e57e859b259e8007fa9675cf5f154691faef3.script [ctx] 10000]
