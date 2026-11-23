import LiveScripts.Shared
import LiveScripts.S_759779cc41c475cd6b4dc6c14b8ad281765ceea141b53a106b91ef0e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_759779cc41c475cd6b4dc6c14b8ad281765ceea141b53a106b91ef0e.script [ctx] 10000]
