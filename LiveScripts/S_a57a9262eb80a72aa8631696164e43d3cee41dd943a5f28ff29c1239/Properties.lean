import LiveScripts.Shared
import LiveScripts.S_a57a9262eb80a72aa8631696164e43d3cee41dd943a5f28ff29c1239.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a57a9262eb80a72aa8631696164e43d3cee41dd943a5f28ff29c1239.script [ctx] 10000]
