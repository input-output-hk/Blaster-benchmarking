import LiveScripts.Shared
import LiveScripts.S_ffbfb44b231e8311608ea310f12c49a5227ce2e988d2b071a327e1f5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ffbfb44b231e8311608ea310f12c49a5227ce2e988d2b071a327e1f5.script [datum, redeemer, ctx] 10000]
