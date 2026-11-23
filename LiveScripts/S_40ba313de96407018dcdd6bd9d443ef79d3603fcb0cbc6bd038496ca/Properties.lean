import LiveScripts.Shared
import LiveScripts.S_40ba313de96407018dcdd6bd9d443ef79d3603fcb0cbc6bd038496ca.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_40ba313de96407018dcdd6bd9d443ef79d3603fcb0cbc6bd038496ca.script [ctx] 10000]
