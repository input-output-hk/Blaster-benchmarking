import LiveScripts.Shared
import LiveScripts.S_6f1be9594f8df02bcb7f2faab22d548fb2784b3ea4b5e0a428fe5d09.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f1be9594f8df02bcb7f2faab22d548fb2784b3ea4b5e0a428fe5d09.script [ctx] 10000]
