import LiveScripts.Shared
import LiveScripts.S_386fc0f8ba73f1618798e3b81441aa29c562a5ca71bbc26ec1506c21.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_386fc0f8ba73f1618798e3b81441aa29c562a5ca71bbc26ec1506c21.script [datum, redeemer, ctx] 10000]
