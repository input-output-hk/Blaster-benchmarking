import LiveScripts.Shared
import LiveScripts.S_6743f4b69446b4e066cfb89daa3d01ef041b6d2646968993be4cec09.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6743f4b69446b4e066cfb89daa3d01ef041b6d2646968993be4cec09.script [ctx] 10000]
