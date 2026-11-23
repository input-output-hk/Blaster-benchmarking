import LiveScripts.Shared
import LiveScripts.S_902042871cd5ad69074da4f1d1f1fb93823340ff1a363a5275eb1d8b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_902042871cd5ad69074da4f1d1f1fb93823340ff1a363a5275eb1d8b.script [redeemer, ctx] 10000]
