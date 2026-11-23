import LiveScripts.Shared
import LiveScripts.S_8a0e9d688d502c8184608a3915f529803db7e1e6d84c958b46c513ed.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8a0e9d688d502c8184608a3915f529803db7e1e6d84c958b46c513ed.script [ctx] 10000]
