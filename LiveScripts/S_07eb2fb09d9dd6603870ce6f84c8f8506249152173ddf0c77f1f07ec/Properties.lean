import LiveScripts.Shared
import LiveScripts.S_07eb2fb09d9dd6603870ce6f84c8f8506249152173ddf0c77f1f07ec.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_07eb2fb09d9dd6603870ce6f84c8f8506249152173ddf0c77f1f07ec.script [ctx] 10000]
