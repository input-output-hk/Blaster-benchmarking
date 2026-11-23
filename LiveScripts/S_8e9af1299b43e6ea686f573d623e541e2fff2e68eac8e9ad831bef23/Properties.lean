import LiveScripts.Shared
import LiveScripts.S_8e9af1299b43e6ea686f573d623e541e2fff2e68eac8e9ad831bef23.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8e9af1299b43e6ea686f573d623e541e2fff2e68eac8e9ad831bef23.script [ctx] 10000]
