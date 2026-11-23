import LiveScripts.Shared
import LiveScripts.S_64fc4b24599b7fa08c9beee33d4bc35184d36b38d2b87d487f32253f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_64fc4b24599b7fa08c9beee33d4bc35184d36b38d2b87d487f32253f.script [ctx] 10000]
