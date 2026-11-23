import LiveScripts.Shared
import LiveScripts.S_61f052212c52b614f3c1c6233416c3b1ee41f536608fddea7eb9eb7d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_61f052212c52b614f3c1c6233416c3b1ee41f536608fddea7eb9eb7d.script [ctx] 10000]
