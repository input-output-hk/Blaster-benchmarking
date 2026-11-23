import LiveScripts.Shared
import LiveScripts.S_186843b12bb63d7f3d8015f6e418d7cb9a55a029a564bb44167886e3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_186843b12bb63d7f3d8015f6e418d7cb9a55a029a564bb44167886e3.script [ctx] 10000]
