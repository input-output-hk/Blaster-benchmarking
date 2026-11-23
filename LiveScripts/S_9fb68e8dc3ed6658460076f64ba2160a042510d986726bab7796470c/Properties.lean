import LiveScripts.Shared
import LiveScripts.S_9fb68e8dc3ed6658460076f64ba2160a042510d986726bab7796470c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9fb68e8dc3ed6658460076f64ba2160a042510d986726bab7796470c.script [ctx] 10000]
