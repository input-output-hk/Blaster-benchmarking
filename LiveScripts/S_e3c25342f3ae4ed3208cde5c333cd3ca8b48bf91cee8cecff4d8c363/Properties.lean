import LiveScripts.Shared
import LiveScripts.S_e3c25342f3ae4ed3208cde5c333cd3ca8b48bf91cee8cecff4d8c363.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e3c25342f3ae4ed3208cde5c333cd3ca8b48bf91cee8cecff4d8c363.script [datum, redeemer, ctx] 10000]
