import LiveScripts.Shared
import LiveScripts.S_dfbcc1945ddd3928b8baf293c2b6410ec5c52c648597283f1a6f08c9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dfbcc1945ddd3928b8baf293c2b6410ec5c52c648597283f1a6f08c9.script [ctx] 10000]
