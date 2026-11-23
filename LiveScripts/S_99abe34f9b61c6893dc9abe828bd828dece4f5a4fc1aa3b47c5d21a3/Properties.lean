import LiveScripts.Shared
import LiveScripts.S_99abe34f9b61c6893dc9abe828bd828dece4f5a4fc1aa3b47c5d21a3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_99abe34f9b61c6893dc9abe828bd828dece4f5a4fc1aa3b47c5d21a3.script [ctx] 10000]
