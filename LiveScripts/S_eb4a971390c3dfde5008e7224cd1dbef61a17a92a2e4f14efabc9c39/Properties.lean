import LiveScripts.Shared
import LiveScripts.S_eb4a971390c3dfde5008e7224cd1dbef61a17a92a2e4f14efabc9c39.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eb4a971390c3dfde5008e7224cd1dbef61a17a92a2e4f14efabc9c39.script [datum, redeemer, ctx] 10000]
