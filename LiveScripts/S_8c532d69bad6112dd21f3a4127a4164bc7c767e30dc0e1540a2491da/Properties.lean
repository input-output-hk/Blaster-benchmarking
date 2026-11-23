import LiveScripts.Shared
import LiveScripts.S_8c532d69bad6112dd21f3a4127a4164bc7c767e30dc0e1540a2491da.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8c532d69bad6112dd21f3a4127a4164bc7c767e30dc0e1540a2491da.script [ctx] 10000]
