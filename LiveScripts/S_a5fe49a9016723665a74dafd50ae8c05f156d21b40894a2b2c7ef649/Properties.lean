import LiveScripts.Shared
import LiveScripts.S_a5fe49a9016723665a74dafd50ae8c05f156d21b40894a2b2c7ef649.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a5fe49a9016723665a74dafd50ae8c05f156d21b40894a2b2c7ef649.script [ctx] 10000]
