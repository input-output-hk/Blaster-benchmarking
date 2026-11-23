import LiveScripts.Shared
import LiveScripts.S_99bd60b03112617ef3b4a6f8339ccbf882e9c043bd3277df64e0e3dc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_99bd60b03112617ef3b4a6f8339ccbf882e9c043bd3277df64e0e3dc.script [redeemer, ctx] 10000]
