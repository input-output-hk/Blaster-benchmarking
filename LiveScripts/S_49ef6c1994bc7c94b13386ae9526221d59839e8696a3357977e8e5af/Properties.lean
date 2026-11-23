import LiveScripts.Shared
import LiveScripts.S_49ef6c1994bc7c94b13386ae9526221d59839e8696a3357977e8e5af.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_49ef6c1994bc7c94b13386ae9526221d59839e8696a3357977e8e5af.script [datum, redeemer, ctx] 10000]
