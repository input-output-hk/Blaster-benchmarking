import LiveScripts.Shared
import LiveScripts.S_a8bda69beeace3098441a5ae0766507372c2a16417592de1ddd353d9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a8bda69beeace3098441a5ae0766507372c2a16417592de1ddd353d9.script [ctx] 10000]
