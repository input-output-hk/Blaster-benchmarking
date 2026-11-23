import LiveScripts.Shared
import LiveScripts.S_ca9724e2ad962293f3daa9a1fa3b950c2ad26031a4c331645f76b904.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ca9724e2ad962293f3daa9a1fa3b950c2ad26031a4c331645f76b904.script [datum, redeemer, ctx] 10000]
