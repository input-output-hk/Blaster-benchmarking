import LiveScripts.Shared
import LiveScripts.S_9bd3c250f347caf0da649d3488565fb0de8d12c12aa690449037b741.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9bd3c250f347caf0da649d3488565fb0de8d12c12aa690449037b741.script [ctx] 10000]
