import LiveScripts.Shared
import LiveScripts.S_109d3bc1b23ac267cf7c59f0d569ae2eff0b94338e6d6b3d51b92ba9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_109d3bc1b23ac267cf7c59f0d569ae2eff0b94338e6d6b3d51b92ba9.script [redeemer, ctx] 10000]
