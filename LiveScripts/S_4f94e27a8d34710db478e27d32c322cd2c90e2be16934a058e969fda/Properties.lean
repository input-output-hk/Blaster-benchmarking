import LiveScripts.Shared
import LiveScripts.S_4f94e27a8d34710db478e27d32c322cd2c90e2be16934a058e969fda.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4f94e27a8d34710db478e27d32c322cd2c90e2be16934a058e969fda.script [ctx] 10000]
