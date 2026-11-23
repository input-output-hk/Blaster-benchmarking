import LiveScripts.Shared
import LiveScripts.S_496c564cf2c52bb4b1ae85ccbd67a8cb53c4a838f095805b7878c343.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_496c564cf2c52bb4b1ae85ccbd67a8cb53c4a838f095805b7878c343.script [ctx] 10000]
