import LiveScripts.Shared
import LiveScripts.S_274765b4c626c28d18752176b59c0ff63db56b8305c1daa49c9879fe.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_274765b4c626c28d18752176b59c0ff63db56b8305c1daa49c9879fe.script [ctx] 10000]
