import LiveScripts.Shared
import LiveScripts.S_c23675bbd0b80590d48fccb28479c640cc88052505e765d8a35ad0aa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c23675bbd0b80590d48fccb28479c640cc88052505e765d8a35ad0aa.script [ctx] 10000]
