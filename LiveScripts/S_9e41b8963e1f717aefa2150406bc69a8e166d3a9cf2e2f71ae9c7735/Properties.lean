import LiveScripts.Shared
import LiveScripts.S_9e41b8963e1f717aefa2150406bc69a8e166d3a9cf2e2f71ae9c7735.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9e41b8963e1f717aefa2150406bc69a8e166d3a9cf2e2f71ae9c7735.script [ctx] 10000]
