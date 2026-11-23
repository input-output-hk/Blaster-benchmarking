import LiveScripts.Shared
import LiveScripts.S_2dbbdcd45154f5ace8af8846082f697520f3d42863b0f79c1c3ee2ed.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2dbbdcd45154f5ace8af8846082f697520f3d42863b0f79c1c3ee2ed.script [ctx] 10000]
