import LiveScripts.Shared
import LiveScripts.S_b88deb72abd08a855b807ef3326b81813ddc98243f6d5d67bc0b1783.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b88deb72abd08a855b807ef3326b81813ddc98243f6d5d67bc0b1783.script [datum, redeemer, ctx] 10000]
