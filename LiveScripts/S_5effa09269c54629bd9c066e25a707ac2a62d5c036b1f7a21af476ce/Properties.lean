import LiveScripts.Shared
import LiveScripts.S_5effa09269c54629bd9c066e25a707ac2a62d5c036b1f7a21af476ce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5effa09269c54629bd9c066e25a707ac2a62d5c036b1f7a21af476ce.script [redeemer, ctx] 10000]
