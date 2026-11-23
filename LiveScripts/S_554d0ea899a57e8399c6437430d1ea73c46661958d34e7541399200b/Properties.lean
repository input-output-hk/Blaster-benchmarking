import LiveScripts.Shared
import LiveScripts.S_554d0ea899a57e8399c6437430d1ea73c46661958d34e7541399200b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_554d0ea899a57e8399c6437430d1ea73c46661958d34e7541399200b.script [ctx] 10000]
