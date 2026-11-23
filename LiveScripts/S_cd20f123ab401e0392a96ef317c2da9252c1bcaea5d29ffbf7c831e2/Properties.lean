import LiveScripts.Shared
import LiveScripts.S_cd20f123ab401e0392a96ef317c2da9252c1bcaea5d29ffbf7c831e2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cd20f123ab401e0392a96ef317c2da9252c1bcaea5d29ffbf7c831e2.script [ctx] 10000]
