import LiveScripts.Shared
import LiveScripts.S_24af1a829b2a56457dbeb02e854a0f0af1e7d0af4233aaa0c0d7b1e1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_24af1a829b2a56457dbeb02e854a0f0af1e7d0af4233aaa0c0d7b1e1.script [redeemer, ctx] 10000]
