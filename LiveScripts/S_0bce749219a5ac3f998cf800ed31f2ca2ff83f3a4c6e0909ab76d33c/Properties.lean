import LiveScripts.Shared
import LiveScripts.S_0bce749219a5ac3f998cf800ed31f2ca2ff83f3a4c6e0909ab76d33c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0bce749219a5ac3f998cf800ed31f2ca2ff83f3a4c6e0909ab76d33c.script [redeemer, ctx] 10000]
