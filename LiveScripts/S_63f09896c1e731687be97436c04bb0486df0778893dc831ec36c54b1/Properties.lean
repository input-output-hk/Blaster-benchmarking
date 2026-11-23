import LiveScripts.Shared
import LiveScripts.S_63f09896c1e731687be97436c04bb0486df0778893dc831ec36c54b1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_63f09896c1e731687be97436c04bb0486df0778893dc831ec36c54b1.script [ctx] 10000]
