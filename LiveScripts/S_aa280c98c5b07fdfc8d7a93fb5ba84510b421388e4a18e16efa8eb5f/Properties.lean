import LiveScripts.Shared
import LiveScripts.S_aa280c98c5b07fdfc8d7a93fb5ba84510b421388e4a18e16efa8eb5f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aa280c98c5b07fdfc8d7a93fb5ba84510b421388e4a18e16efa8eb5f.script [redeemer, ctx] 10000]
