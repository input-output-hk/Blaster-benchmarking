import LiveScripts.Shared
import LiveScripts.S_52bdaa27bb84ab3a62053b01c08f8645278182b4fe48090f42096eec.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_52bdaa27bb84ab3a62053b01c08f8645278182b4fe48090f42096eec.script [ctx] 10000]
