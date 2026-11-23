import LiveScripts.Shared
import LiveScripts.S_2d09e21ad2bd24b93c74615029d21c25aebdb306a8b4ab0aa0c2f6da.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2d09e21ad2bd24b93c74615029d21c25aebdb306a8b4ab0aa0c2f6da.script [ctx] 10000]
