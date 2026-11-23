import LiveScripts.Shared
import LiveScripts.S_50ed8de918b0d944215e69688536cbe2d7484c744c4e11b9d8b9fc07.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_50ed8de918b0d944215e69688536cbe2d7484c744c4e11b9d8b9fc07.script [redeemer, ctx] 10000]
