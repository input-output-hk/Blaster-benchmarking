import LiveScripts.Shared
import LiveScripts.S_e9a2d61c5a6dc5173684bc781c8266eecce6aa6379b7534b6daa39c4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e9a2d61c5a6dc5173684bc781c8266eecce6aa6379b7534b6daa39c4.script [ctx] 10000]
