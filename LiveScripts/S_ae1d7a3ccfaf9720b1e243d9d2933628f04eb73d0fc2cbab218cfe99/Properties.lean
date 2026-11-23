import LiveScripts.Shared
import LiveScripts.S_ae1d7a3ccfaf9720b1e243d9d2933628f04eb73d0fc2cbab218cfe99.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ae1d7a3ccfaf9720b1e243d9d2933628f04eb73d0fc2cbab218cfe99.script [ctx] 10000]
