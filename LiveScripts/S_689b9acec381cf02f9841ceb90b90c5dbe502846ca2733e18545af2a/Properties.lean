import LiveScripts.Shared
import LiveScripts.S_689b9acec381cf02f9841ceb90b90c5dbe502846ca2733e18545af2a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_689b9acec381cf02f9841ceb90b90c5dbe502846ca2733e18545af2a.script [ctx] 10000]
