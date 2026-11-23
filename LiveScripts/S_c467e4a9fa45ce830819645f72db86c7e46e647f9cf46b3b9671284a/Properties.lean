import LiveScripts.Shared
import LiveScripts.S_c467e4a9fa45ce830819645f72db86c7e46e647f9cf46b3b9671284a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c467e4a9fa45ce830819645f72db86c7e46e647f9cf46b3b9671284a.script [datum, redeemer, ctx] 10000]
