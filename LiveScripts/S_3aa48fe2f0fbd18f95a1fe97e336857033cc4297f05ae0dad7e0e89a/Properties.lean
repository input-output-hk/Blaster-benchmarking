import LiveScripts.Shared
import LiveScripts.S_3aa48fe2f0fbd18f95a1fe97e336857033cc4297f05ae0dad7e0e89a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3aa48fe2f0fbd18f95a1fe97e336857033cc4297f05ae0dad7e0e89a.script [ctx] 10000]
