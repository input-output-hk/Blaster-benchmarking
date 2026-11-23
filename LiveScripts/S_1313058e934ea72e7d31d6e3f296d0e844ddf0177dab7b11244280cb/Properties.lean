import LiveScripts.Shared
import LiveScripts.S_1313058e934ea72e7d31d6e3f296d0e844ddf0177dab7b11244280cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1313058e934ea72e7d31d6e3f296d0e844ddf0177dab7b11244280cb.script [datum, redeemer, ctx] 10000]
