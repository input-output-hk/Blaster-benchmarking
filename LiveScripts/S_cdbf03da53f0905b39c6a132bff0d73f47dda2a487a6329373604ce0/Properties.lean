import LiveScripts.Shared
import LiveScripts.S_cdbf03da53f0905b39c6a132bff0d73f47dda2a487a6329373604ce0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cdbf03da53f0905b39c6a132bff0d73f47dda2a487a6329373604ce0.script [redeemer, ctx] 10000]
