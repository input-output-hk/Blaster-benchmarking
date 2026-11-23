import LiveScripts.Shared
import LiveScripts.S_acaa4627d2389fed8f54b3d1752f5bc7f911ef3b7f9ff003514e204d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_acaa4627d2389fed8f54b3d1752f5bc7f911ef3b7f9ff003514e204d.script [datum, redeemer, ctx] 10000]
