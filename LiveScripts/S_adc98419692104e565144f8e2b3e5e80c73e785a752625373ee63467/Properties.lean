import LiveScripts.Shared
import LiveScripts.S_adc98419692104e565144f8e2b3e5e80c73e785a752625373ee63467.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_adc98419692104e565144f8e2b3e5e80c73e785a752625373ee63467.script [datum, redeemer, ctx] 10000]
