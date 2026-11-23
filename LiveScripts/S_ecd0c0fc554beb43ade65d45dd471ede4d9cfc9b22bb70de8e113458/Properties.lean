import LiveScripts.Shared
import LiveScripts.S_ecd0c0fc554beb43ade65d45dd471ede4d9cfc9b22bb70de8e113458.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ecd0c0fc554beb43ade65d45dd471ede4d9cfc9b22bb70de8e113458.script [ctx] 10000]
