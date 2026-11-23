import LiveScripts.Shared
import LiveScripts.S_5d9bb00b6fce163121dac9e3c55b51c8105797d0bc093b66130ec6cd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5d9bb00b6fce163121dac9e3c55b51c8105797d0bc093b66130ec6cd.script [datum, redeemer, ctx] 10000]
