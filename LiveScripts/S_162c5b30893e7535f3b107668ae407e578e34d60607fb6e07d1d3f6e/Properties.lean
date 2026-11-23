import LiveScripts.Shared
import LiveScripts.S_162c5b30893e7535f3b107668ae407e578e34d60607fb6e07d1d3f6e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_162c5b30893e7535f3b107668ae407e578e34d60607fb6e07d1d3f6e.script [redeemer, ctx] 10000]
