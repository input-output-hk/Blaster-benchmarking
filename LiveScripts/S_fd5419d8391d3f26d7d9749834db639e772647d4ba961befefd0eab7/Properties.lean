import LiveScripts.Shared
import LiveScripts.S_fd5419d8391d3f26d7d9749834db639e772647d4ba961befefd0eab7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fd5419d8391d3f26d7d9749834db639e772647d4ba961befefd0eab7.script [ctx] 10000]
