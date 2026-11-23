import LiveScripts.Shared
import LiveScripts.S_882cbb37779b7f1f3dd2b7643662de1bfc180baf225ef820c3d8feae.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_882cbb37779b7f1f3dd2b7643662de1bfc180baf225ef820c3d8feae.script [ctx] 10000]
