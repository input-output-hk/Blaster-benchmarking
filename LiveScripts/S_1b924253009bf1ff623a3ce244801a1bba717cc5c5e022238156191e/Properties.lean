import LiveScripts.Shared
import LiveScripts.S_1b924253009bf1ff623a3ce244801a1bba717cc5c5e022238156191e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1b924253009bf1ff623a3ce244801a1bba717cc5c5e022238156191e.script [datum, redeemer, ctx] 10000]
