import LiveScripts.Shared
import LiveScripts.S_e7a1131abcf336801eadcb33ba7e21c838d5f13b1dfda263a2efb70d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e7a1131abcf336801eadcb33ba7e21c838d5f13b1dfda263a2efb70d.script [datum, redeemer, ctx] 10000]
