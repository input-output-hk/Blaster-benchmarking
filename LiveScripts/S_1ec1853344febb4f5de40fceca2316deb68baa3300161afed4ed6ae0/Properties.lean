import LiveScripts.Shared
import LiveScripts.S_1ec1853344febb4f5de40fceca2316deb68baa3300161afed4ed6ae0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1ec1853344febb4f5de40fceca2316deb68baa3300161afed4ed6ae0.script [ctx] 10000]
