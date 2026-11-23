import LiveScripts.Shared
import LiveScripts.S_a3d5052864638828bc3fbc0d5b9a4223e233620d7911a5376ed4b658.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a3d5052864638828bc3fbc0d5b9a4223e233620d7911a5376ed4b658.script [ctx] 10000]
