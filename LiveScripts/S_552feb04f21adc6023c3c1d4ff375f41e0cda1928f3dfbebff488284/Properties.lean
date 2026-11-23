import LiveScripts.Shared
import LiveScripts.S_552feb04f21adc6023c3c1d4ff375f41e0cda1928f3dfbebff488284.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_552feb04f21adc6023c3c1d4ff375f41e0cda1928f3dfbebff488284.script [ctx] 10000]
