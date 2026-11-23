import LiveScripts.Shared
import LiveScripts.S_2c07095028169d7ab4376611abef750623c8f955597a38cd15248640.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2c07095028169d7ab4376611abef750623c8f955597a38cd15248640.script [redeemer, ctx] 10000]
