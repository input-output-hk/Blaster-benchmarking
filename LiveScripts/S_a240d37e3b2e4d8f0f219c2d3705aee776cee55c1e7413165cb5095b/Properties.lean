import LiveScripts.Shared
import LiveScripts.S_a240d37e3b2e4d8f0f219c2d3705aee776cee55c1e7413165cb5095b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a240d37e3b2e4d8f0f219c2d3705aee776cee55c1e7413165cb5095b.script [redeemer, ctx] 10000]
