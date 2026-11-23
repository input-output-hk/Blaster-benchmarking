import LiveScripts.Shared
import LiveScripts.S_f691433e0f802c0f7bc4ca72a66c801b016eda13995cc8e8c9e48ad3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f691433e0f802c0f7bc4ca72a66c801b016eda13995cc8e8c9e48ad3.script [ctx] 10000]
