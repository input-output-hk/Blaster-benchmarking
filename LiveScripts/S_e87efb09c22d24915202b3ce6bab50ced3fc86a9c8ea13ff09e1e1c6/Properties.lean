import LiveScripts.Shared
import LiveScripts.S_e87efb09c22d24915202b3ce6bab50ced3fc86a9c8ea13ff09e1e1c6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e87efb09c22d24915202b3ce6bab50ced3fc86a9c8ea13ff09e1e1c6.script [ctx] 10000]
