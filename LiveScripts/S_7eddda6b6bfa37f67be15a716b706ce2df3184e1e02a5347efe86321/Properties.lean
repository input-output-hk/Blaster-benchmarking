import LiveScripts.Shared
import LiveScripts.S_7eddda6b6bfa37f67be15a716b706ce2df3184e1e02a5347efe86321.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7eddda6b6bfa37f67be15a716b706ce2df3184e1e02a5347efe86321.script [ctx] 10000]
