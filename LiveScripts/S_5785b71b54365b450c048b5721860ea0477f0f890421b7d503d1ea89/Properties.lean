import LiveScripts.Shared
import LiveScripts.S_5785b71b54365b450c048b5721860ea0477f0f890421b7d503d1ea89.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5785b71b54365b450c048b5721860ea0477f0f890421b7d503d1ea89.script [redeemer, ctx] 10000]
