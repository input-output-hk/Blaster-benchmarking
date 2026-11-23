import LiveScripts.Shared
import LiveScripts.S_1c258fc7dc88ff02fb5e19b01a58693e61a3778c2305ba59a8c8e5f3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1c258fc7dc88ff02fb5e19b01a58693e61a3778c2305ba59a8c8e5f3.script [ctx] 10000]
