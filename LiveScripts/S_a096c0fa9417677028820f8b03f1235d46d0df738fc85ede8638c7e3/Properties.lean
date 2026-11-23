import LiveScripts.Shared
import LiveScripts.S_a096c0fa9417677028820f8b03f1235d46d0df738fc85ede8638c7e3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a096c0fa9417677028820f8b03f1235d46d0df738fc85ede8638c7e3.script [ctx] 10000]
