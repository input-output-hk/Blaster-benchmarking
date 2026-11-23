import LiveScripts.Shared
import LiveScripts.S_73a7b8a53c2e2b6a176b38a8eb8ac767c83222f2ca94d6635f5a3722.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_73a7b8a53c2e2b6a176b38a8eb8ac767c83222f2ca94d6635f5a3722.script [redeemer, ctx] 10000]
