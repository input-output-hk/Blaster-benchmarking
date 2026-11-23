import LiveScripts.Shared
import LiveScripts.S_f9af588f94c74d2d4e1d069b0535585c84ebe3ef2ca34dd703847e85.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f9af588f94c74d2d4e1d069b0535585c84ebe3ef2ca34dd703847e85.script [redeemer, ctx] 10000]
