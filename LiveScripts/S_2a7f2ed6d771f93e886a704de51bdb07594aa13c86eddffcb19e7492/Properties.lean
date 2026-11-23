import LiveScripts.Shared
import LiveScripts.S_2a7f2ed6d771f93e886a704de51bdb07594aa13c86eddffcb19e7492.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2a7f2ed6d771f93e886a704de51bdb07594aa13c86eddffcb19e7492.script [ctx] 10000]
