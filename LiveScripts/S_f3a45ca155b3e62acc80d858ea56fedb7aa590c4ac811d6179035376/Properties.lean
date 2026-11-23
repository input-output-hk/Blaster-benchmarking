import LiveScripts.Shared
import LiveScripts.S_f3a45ca155b3e62acc80d858ea56fedb7aa590c4ac811d6179035376.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f3a45ca155b3e62acc80d858ea56fedb7aa590c4ac811d6179035376.script [datum, redeemer, ctx] 10000]
