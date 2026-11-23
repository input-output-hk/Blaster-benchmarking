import LiveScripts.Shared
import LiveScripts.S_ca925263da4c59bf675f3cc485c894575cfe9b2b50ae5c3a360a62cd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ca925263da4c59bf675f3cc485c894575cfe9b2b50ae5c3a360a62cd.script [datum, redeemer, ctx] 10000]
