import LiveScripts.Shared
import LiveScripts.S_cb60783d259afbc97b44d193e26e73d9ac6237898753f50117b9c0eb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cb60783d259afbc97b44d193e26e73d9ac6237898753f50117b9c0eb.script [datum, redeemer, ctx] 10000]
