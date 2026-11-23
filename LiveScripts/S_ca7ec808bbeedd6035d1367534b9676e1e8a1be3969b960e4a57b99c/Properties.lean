import LiveScripts.Shared
import LiveScripts.S_ca7ec808bbeedd6035d1367534b9676e1e8a1be3969b960e4a57b99c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ca7ec808bbeedd6035d1367534b9676e1e8a1be3969b960e4a57b99c.script [redeemer, ctx] 10000]
