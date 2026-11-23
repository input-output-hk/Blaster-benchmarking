import LiveScripts.Shared
import LiveScripts.S_9c3b97ea4f94b34b39048e1710473872ec016c8a26da46e9988e6ca6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9c3b97ea4f94b34b39048e1710473872ec016c8a26da46e9988e6ca6.script [datum, redeemer, ctx] 10000]
