import LiveScripts.Shared
import LiveScripts.S_e6eb1c3e54e8ac2906e0b9f140e37cd86e34b3da4b6b7496e68c9c2e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e6eb1c3e54e8ac2906e0b9f140e37cd86e34b3da4b6b7496e68c9c2e.script [ctx] 10000]
