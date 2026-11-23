import LiveScripts.Shared
import LiveScripts.S_de4d616cce9eb9105cb213396036ec74877f091613f8dc4ae10e58dd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_de4d616cce9eb9105cb213396036ec74877f091613f8dc4ae10e58dd.script [ctx] 10000]
