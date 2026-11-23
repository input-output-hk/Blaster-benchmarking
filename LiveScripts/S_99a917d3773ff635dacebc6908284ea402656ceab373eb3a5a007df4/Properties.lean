import LiveScripts.Shared
import LiveScripts.S_99a917d3773ff635dacebc6908284ea402656ceab373eb3a5a007df4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_99a917d3773ff635dacebc6908284ea402656ceab373eb3a5a007df4.script [datum, redeemer, ctx] 10000]
