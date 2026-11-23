import LiveScripts.Shared
import LiveScripts.S_12951622b1fa0a57e8f8cf08cc42a833fe41e611f546e90d31d5cefe.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_12951622b1fa0a57e8f8cf08cc42a833fe41e611f546e90d31d5cefe.script [ctx] 10000]
