import LiveScripts.Shared
import LiveScripts.S_b3db1b84025653b964a5c7ae34ddf74304b1ce7a505e2a1135be1c57.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b3db1b84025653b964a5c7ae34ddf74304b1ce7a505e2a1135be1c57.script [ctx] 10000]
