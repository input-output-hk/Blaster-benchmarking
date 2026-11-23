import LiveScripts.Shared
import LiveScripts.S_700fe391a5e260994921b5a73ad549f4e89b3b97439e5ae7b8176a5b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_700fe391a5e260994921b5a73ad549f4e89b3b97439e5ae7b8176a5b.script [ctx] 10000]
