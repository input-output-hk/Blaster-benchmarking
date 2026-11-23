import LiveScripts.Shared
import LiveScripts.S_5fbb3e5295c211c7595ddd23db2e0a0833131e0681cc7ea800f85d34.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5fbb3e5295c211c7595ddd23db2e0a0833131e0681cc7ea800f85d34.script [ctx] 10000]
