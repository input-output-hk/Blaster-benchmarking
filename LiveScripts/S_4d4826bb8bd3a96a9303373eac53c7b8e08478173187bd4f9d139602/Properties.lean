import LiveScripts.Shared
import LiveScripts.S_4d4826bb8bd3a96a9303373eac53c7b8e08478173187bd4f9d139602.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4d4826bb8bd3a96a9303373eac53c7b8e08478173187bd4f9d139602.script [ctx] 10000]
