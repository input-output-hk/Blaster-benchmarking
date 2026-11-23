import LiveScripts.Shared
import LiveScripts.S_96f1e8891ea6c52ad5f90f7086d2ee84c568ab154e3d43c75eca2505.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_96f1e8891ea6c52ad5f90f7086d2ee84c568ab154e3d43c75eca2505.script [ctx] 10000]
