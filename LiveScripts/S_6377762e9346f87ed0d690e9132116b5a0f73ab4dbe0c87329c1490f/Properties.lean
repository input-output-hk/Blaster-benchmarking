import LiveScripts.Shared
import LiveScripts.S_6377762e9346f87ed0d690e9132116b5a0f73ab4dbe0c87329c1490f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6377762e9346f87ed0d690e9132116b5a0f73ab4dbe0c87329c1490f.script [ctx] 10000]
