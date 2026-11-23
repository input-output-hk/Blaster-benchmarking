import LiveScripts.Shared
import LiveScripts.S_2e0837ad53e006a46f794653915914fa63f3291d11e2e05afc737b41.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2e0837ad53e006a46f794653915914fa63f3291d11e2e05afc737b41.script [ctx] 10000]
