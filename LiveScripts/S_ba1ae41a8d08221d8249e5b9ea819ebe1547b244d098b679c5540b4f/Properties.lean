import LiveScripts.Shared
import LiveScripts.S_ba1ae41a8d08221d8249e5b9ea819ebe1547b244d098b679c5540b4f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ba1ae41a8d08221d8249e5b9ea819ebe1547b244d098b679c5540b4f.script [datum, redeemer, ctx] 10000]
