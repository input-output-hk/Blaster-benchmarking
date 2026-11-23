import LiveScripts.Shared
import LiveScripts.S_45204e64ebd1d05e8c983e74b1d6dbe0898dfbd2c7f34355d87b7b71.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_45204e64ebd1d05e8c983e74b1d6dbe0898dfbd2c7f34355d87b7b71.script [redeemer, ctx] 10000]
