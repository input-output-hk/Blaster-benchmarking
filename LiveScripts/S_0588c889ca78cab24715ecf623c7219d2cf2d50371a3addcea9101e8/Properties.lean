import LiveScripts.Shared
import LiveScripts.S_0588c889ca78cab24715ecf623c7219d2cf2d50371a3addcea9101e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0588c889ca78cab24715ecf623c7219d2cf2d50371a3addcea9101e8.script [datum, redeemer, ctx] 10000]
