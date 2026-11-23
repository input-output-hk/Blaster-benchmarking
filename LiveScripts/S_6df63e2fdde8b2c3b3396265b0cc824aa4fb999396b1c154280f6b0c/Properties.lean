import LiveScripts.Shared
import LiveScripts.S_6df63e2fdde8b2c3b3396265b0cc824aa4fb999396b1c154280f6b0c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6df63e2fdde8b2c3b3396265b0cc824aa4fb999396b1c154280f6b0c.script [redeemer, ctx] 10000]
