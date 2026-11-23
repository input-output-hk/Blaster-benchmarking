import LiveScripts.Shared
import LiveScripts.S_f8c2ea6de1d4243b16dc1362ad34c6bf93edec7a49d057107172b402.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f8c2ea6de1d4243b16dc1362ad34c6bf93edec7a49d057107172b402.script [datum, redeemer, ctx] 10000]
