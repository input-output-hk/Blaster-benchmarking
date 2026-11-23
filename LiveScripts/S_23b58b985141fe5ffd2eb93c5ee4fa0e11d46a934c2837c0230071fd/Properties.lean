import LiveScripts.Shared
import LiveScripts.S_23b58b985141fe5ffd2eb93c5ee4fa0e11d46a934c2837c0230071fd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_23b58b985141fe5ffd2eb93c5ee4fa0e11d46a934c2837c0230071fd.script [ctx] 10000]
