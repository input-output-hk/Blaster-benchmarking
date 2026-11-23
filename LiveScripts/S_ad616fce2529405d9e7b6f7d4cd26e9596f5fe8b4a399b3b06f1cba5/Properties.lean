import LiveScripts.Shared
import LiveScripts.S_ad616fce2529405d9e7b6f7d4cd26e9596f5fe8b4a399b3b06f1cba5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ad616fce2529405d9e7b6f7d4cd26e9596f5fe8b4a399b3b06f1cba5.script [ctx] 10000]
