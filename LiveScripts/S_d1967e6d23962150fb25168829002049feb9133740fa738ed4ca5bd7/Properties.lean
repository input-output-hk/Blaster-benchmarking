import LiveScripts.Shared
import LiveScripts.S_d1967e6d23962150fb25168829002049feb9133740fa738ed4ca5bd7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d1967e6d23962150fb25168829002049feb9133740fa738ed4ca5bd7.script [datum, redeemer, ctx] 10000]
