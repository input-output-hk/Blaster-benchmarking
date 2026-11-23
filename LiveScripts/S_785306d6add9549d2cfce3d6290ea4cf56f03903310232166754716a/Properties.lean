import LiveScripts.Shared
import LiveScripts.S_785306d6add9549d2cfce3d6290ea4cf56f03903310232166754716a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_785306d6add9549d2cfce3d6290ea4cf56f03903310232166754716a.script [ctx] 10000]
