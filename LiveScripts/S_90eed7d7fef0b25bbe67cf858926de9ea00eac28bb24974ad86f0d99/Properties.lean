import LiveScripts.Shared
import LiveScripts.S_90eed7d7fef0b25bbe67cf858926de9ea00eac28bb24974ad86f0d99.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_90eed7d7fef0b25bbe67cf858926de9ea00eac28bb24974ad86f0d99.script [datum, redeemer, ctx] 10000]
